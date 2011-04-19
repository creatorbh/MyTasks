//
//  ControlTask.h
//  MyTasks
//
//  Created by Claudio Fernando Pinto on 10/04/11.
//  Copyright 2011 Mobilizando. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "Control.h"
#import "ControlCategory.h"

#import "Task.h"

@interface ControlTask : Control {
    
}
-(id)init;
-(BOOL)saveTask:(Task *)task;
-(BOOL)removeTask:(Task *)task;
-(NSMutableArray *)listTasks;
+(void)updatePermissionDeleteTask:(BOOL)permission;
+(BOOL)getPermissionDeleteTask;
+(void)updatePermissionAddTask:(BOOL)permission;
+(BOOL)getPermissionAddTask;
@end
