//
//  ControlTask.m
//  MyTasks
//
//  Created by Claudio Fernando Pinto on 10/04/11.
//  Copyright 2011 Mobilizando. All rights reserved.
//

#import "ControlTask.h"


@implementation ControlTask

-(id)init
{
    if((self = [super init]))
    {
        
    }
    return self;
}
-(BOOL)saveTask:(Task *)task
{
    BOOL result = false;
    @try {
                
        int timestamp = (int)[[task date] timeIntervalSince1970];
        sqlite3 *database;
        if(sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {
            const char *sqlStatement = "insert into task(title,date_task,category_id) Values(?, ?, ?)";
            sqlite3_stmt *addStmt;
            if(sqlite3_prepare_v2(database, sqlStatement, -1, &addStmt, NULL) == SQLITE_OK) {
                sqlite3_bind_text(addStmt, 1, [[task title] UTF8String], -1, SQLITE_TRANSIENT);
                sqlite3_bind_int(addStmt, 2, timestamp);
                sqlite3_bind_int(addStmt, 3, [[[task category] _id] intValue]);
                if(sqlite3_step(addStmt) != SQLITE_DONE)
                    result = false;
                else
                    result = true;                
            }
            sqlite3_reset(addStmt);
        }
         sqlite3_close(database);                    
    }
    @catch (NSException *exception) {
        result = false;
    }
    @finally {
        return result;
    }    
}




-(NSMutableArray *)listTasks
{
    NSMutableArray *list = [[NSMutableArray alloc] init];
    ControlCategory *controlCategory = [[ControlCategory alloc] init];
    @try {
        sqlite3 *database;
        if(sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {
            const char *sqlStatement = "select * from task";
            sqlite3_stmt *compiledStatement;
            if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
                while(sqlite3_step(compiledStatement) == SQLITE_ROW) {                
                    NSString *_id = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 0)];
                    NSString *title = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 1)];
                    NSDate *date = [[NSDate alloc] initWithTimeIntervalSince1970:sqlite3_column_int(compiledStatement, 2)];
                    NSString *idCategory = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 3)];
                    
                    Category *category = [controlCategory findByID:idCategory];
                    
                    Task *task = [[Task alloc] initWithID:_id andTitle:title andDate:date andCategory:category];
                    [list addObject:task];
                    [task release];
                }
            }
            sqlite3_finalize(compiledStatement);        
        }
        sqlite3_close(database);
        
    }
    @catch (NSException *exception) {
        //TODO: Tratamento de erro
    }
    @finally {
        [controlCategory release];
        return list;
    }    
}











-(BOOL)removeTask:(Task *)task
{
    BOOL result = false;
    @try {        
        sqlite3 *database;
        if(sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {
            const char *sqlStatement = "delete from task where id = ?";
            sqlite3_stmt *addStmt;
            if(sqlite3_prepare_v2(database, sqlStatement, -1, &addStmt, NULL) == SQLITE_OK) {
                sqlite3_bind_text(addStmt, 1, [[task _id] UTF8String], -1, SQLITE_TRANSIENT);
                if(sqlite3_step(addStmt) != SQLITE_DONE)
                    result = false;
                else
                    result = true;                
            }
            sqlite3_reset(addStmt);
        }
        sqlite3_close(database);                    
    }
    @catch (NSException *exception) {
        result = false;
    }
    @finally {
        return result;
    }    
}
+(void)updatePermissionDeleteTask:(BOOL)permission
{
    NSUserDefaults *data = [NSUserDefaults standardUserDefaults];
    [data setBool:permission forKey:@"permissionDeleteTask"];
    [data synchronize];
}
+(BOOL)getPermissionDeleteTask
{
    return [[NSUserDefaults standardUserDefaults] boolForKey:@"permissionDeleteTask"];
}
+(void)updatePermissionAddTask:(BOOL)permission
{
    NSUserDefaults *data = [NSUserDefaults standardUserDefaults];
    [data setBool:permission forKey:@"permissionAddTask"];
    [data setValue:@"Este é meu recorde" forKey:@"keyRecorde"];
    [data synchronize];
}
+(BOOL)getPermissionAddTask
{
    return [[NSUserDefaults standardUserDefaults] boolForKey:@"permissionAddTask"];
}
@end
