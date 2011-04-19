//
//  AddTaskViewController.h
//  MyTasks
//
//  Created by Claudio Fernando Pinto on 10/04/11.
//  Copyright 2011 Mobilizando. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControlCategory.h"
#import "ControlTask.h"

@interface AddTaskViewController : UIViewController <UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource>{
    NSMutableArray *listCategories;
    IBOutlet UITextField *taskTitle;
    IBOutlet UITextField *date;
    IBOutlet UIPickerView *categories;
    int selectedIndexCategory;
}

@end
