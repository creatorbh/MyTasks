//
//  SecondViewController.h
//  MyTasks
//
//  Created by Claudio Fernando Pinto on 10/04/11.
//  Copyright 2011 Mobilizando. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControlTask.h"

@interface SetupViewController : UIViewController {
    IBOutlet UISegmentedControl *deleteTask;
    IBOutlet UISegmentedControl *addTask;
    
}
-(IBAction)changeDeleteTask:(id)sender;
-(IBAction)changeAddTask:(id)sender;
@end
