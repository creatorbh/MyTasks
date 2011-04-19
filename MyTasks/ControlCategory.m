//
//  ControlCategory.m
//  MyTasks
//
//  Created by Claudio Fernando Pinto on 10/04/11.
//  Copyright 2011 Mobilizando. All rights reserved.
//

#import "ControlCategory.h"


@implementation ControlCategory

-(id)init
{
    if((self = [super init]))
    {
        
    }
    return self;
}
-(NSMutableArray *)listCategories
{
    NSMutableArray *list = [[NSMutableArray alloc] init];
    @try {
        sqlite3 *database;
        if(sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {
            const char *sqlStatement = "select * from category";
            sqlite3_stmt *compiledStatement;
            if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
                while(sqlite3_step(compiledStatement) == SQLITE_ROW) {                
                    NSString *_id = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 0)];
                    NSString *title = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 1)];
                    Category *category = [[Category alloc] initWithID:_id andTitle:title];
                    [list addObject:category];
                    [category release];
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
        return list;
    }    
}
-(Category *)findByID:(NSString *)ID
{
    Category *category = nil;
    @try {
        sqlite3 *database;
        if(sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {
            const char *sqlStatement = "select * from category where id = ?";
            sqlite3_stmt *compiledStatement;
            if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
                sqlite3_bind_text(compiledStatement, 1, [ID UTF8String], -1, SQLITE_TRANSIENT);
                while(sqlite3_step(compiledStatement) == SQLITE_ROW) {                
                    NSString *_id = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 0)];
                    NSString *title = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 1)];
                    category = [[Category alloc] initWithID:_id andTitle:title];
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
        return category;
    }    

    
}
@end
