//
//  DetailViewController.h
//  MyTasks
//
//  Created by Claudio Fernando Pinto on 15/04/11.
//  Copyright 2011 Mobilizando. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Task.h"

@interface DetailViewController : UIViewController {
    Task *task;
    UILabel *lblTitle;
}
@property (nonatomic, retain) IBOutlet UILabel *lblTitle;
@property (nonatomic,retain) Task *task;
@end
