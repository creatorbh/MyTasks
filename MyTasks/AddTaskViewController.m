//
//  AddTaskViewController.m
//  MyTasks
//
//  Created by Claudio Fernando Pinto on 10/04/11.
//  Copyright 2011 Mobilizando. All rights reserved.
//

#import "AddTaskViewController.h"


@implementation AddTaskViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {                
        
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"Add Task";
    
    UIBarButtonItem *btnSave = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStyleDone target:self action:@selector(saveTask)];
    self.navigationItem.rightBarButtonItem = btnSave;
    
    ControlCategory *controlCategory = [[ControlCategory alloc] init];        
    listCategories = [controlCategory listCategories];
    [controlCategory release];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}
-(void)saveTask
{
    ControlTask *controlTask = [[ControlTask alloc] init];
    
    NSDateFormatter *inFormat = [[NSDateFormatter alloc] init];
    [inFormat setDateFormat:@"dd/mm/yyyy"];
    NSDate *dateTmp = [inFormat dateFromString:[date text]];
    
    Task *task = [[Task alloc] initWithID:nil andTitle:[taskTitle text] andDate:dateTmp andCategory:[listCategories objectAtIndex:selectedIndexCategory]];
    UIAlertView *alert = nil;
    if ([controlTask saveTask:task]) 
        alert = [[UIAlertView alloc] initWithTitle:@"Task" message:@"Task save with sucess." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    else
        alert = [[UIAlertView alloc] initWithTitle:@"Task" message:@"Could not save the task. Try again." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];    
    [alert show];
    [alert release];
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
#pragma mark - UIPickerView Delegate
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [listCategories count];
}
- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [[listCategories objectAtIndex:row] title];
   
}
- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {    
    selectedIndexCategory = row;
}

#pragma mark - UITextField Delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}
@end
