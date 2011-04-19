//
//  SecondViewController.m
//  MyTasks
//
//  Created by Claudio Fernando Pinto on 10/04/11.
//  Copyright 2011 Mobilizando. All rights reserved.
//

#import "SetupViewController.h"


@implementation SetupViewController


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if(![ControlTask getPermissionDeleteTask])
        [deleteTask setSelectedSegmentIndex:1];
    
    if(![ControlTask getPermissionAddTask])
        [addTask setSelectedSegmentIndex:1];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}


- (void)viewDidUnload
{
    [super viewDidUnload];
        
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
-(IBAction)changeDeleteTask:(id)sender
{
    BOOL value = true;
    if([sender selectedSegmentIndex] == 1)
        value = false;
    [ControlTask updatePermissionDeleteTask:value];
}
-(IBAction)changeAddTask:(id)sender
{
    BOOL value = true;
    if([sender selectedSegmentIndex] == 1)
        value = false;
    [ControlTask updatePermissionAddTask:value];
}
- (void)dealloc
{
    [super dealloc];
}

@end
