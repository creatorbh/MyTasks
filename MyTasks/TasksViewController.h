//
//  MyTasksViewController.h
//  MyTasks
//
//  Created by Claudio Fernando Pinto on 10/04/11.
//  Copyright 2011 Mobilizando. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AddTaskViewController.h"
#import "ControlTask.h"
#import "DetailViewController.h"

@interface TasksViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>{
    IBOutlet UIBarButtonItem *btnAdd;
    IBOutlet UIBarButtonItem *btnEdit;
    IBOutlet UITableView *tblTasks;
    NSMutableArray *listTasks;
    BOOL editing;
}
- (IBAction)editTableTask:(id)sender;
@end
