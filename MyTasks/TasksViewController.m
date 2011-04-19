//
//  MyTasksViewController.m
//  MyTasks
//
//  Created by Claudio Fernando Pinto on 10/04/11.
//  Copyright 2011 Mobilizando. All rights reserved.
//

#import "TasksViewController.h"


@implementation TasksViewController

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
    
    [btnAdd setTarget:self];
    [btnAdd setAction:@selector(showViewAddTask)];
}
-(void)viewDidAppear:(BOOL)animated
{
    ControlTask *controlTask = [[ControlTask alloc] init];
    listTasks = [controlTask listTasks];
    [controlTask release];
    [tblTasks reloadData];
}
-(void)showViewAddTask
{
    if([ControlTask getPermissionAddTask])
    {
        AddTaskViewController *addTaskViewController = [[AddTaskViewController alloc] initWithNibName:@"AddTaskViewController" bundle:[NSBundle mainBundle]];
        [self.navigationController pushViewController:addTaskViewController animated:NO];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Task" message:@"Disabled create task." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
    
}
- (IBAction)editTableTask:(id)sender
{
    
    
    if(editing)
    {
        editing = NO;
        [tblTasks setEditing:NO animated:YES];
        [tblTasks reloadData];
        [self.navigationItem.leftBarButtonItem setTitle:@"Edit"];
        [self.navigationItem.leftBarButtonItem setStyle:UIBarButtonItemStylePlain];
        [self.navigationItem.rightBarButtonItem setEnabled:true];
    }
    else if ([ControlTask getPermissionDeleteTask]) 
    {        
        editing = YES; 
        [tblTasks setEditing:YES animated:YES];
        [tblTasks reloadData];
        [self.navigationItem.leftBarButtonItem setTitle:@"Done"];
        [self.navigationItem.leftBarButtonItem setStyle:UIBarButtonItemStyleDone];
        [self.navigationItem.rightBarButtonItem setEnabled:false];
        
    } 
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Task" message:@"Disabled remove tasks." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:@"Confirm",nil];
        [alert show];
        [alert release];
    }
    
    
    
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark Table view data source and delegate

-(NSInteger)numberOfSectionsInTableView:(UITableView*)tableView {
    
    return 1;
}


-(NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {    
    return [listTasks count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [indexPath row];
    [indexPath section];
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
	Task *task = (Task *)[listTasks objectAtIndex:indexPath.row];
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"dd/mm/yyyy"];
    NSString *dateString = [format stringFromDate:[task date]];
	
    
    cell.textLabel.text = [task title];
    cell.detailTextLabel.text = [[NSString alloc] initWithFormat:@"%@ at %@",[[task category] title],dateString];
	
    
	return cell;
}
-(void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath {
    
    Task *task = [listTasks objectAtIndex:[indexPath row]];
    DetailViewController *detail = [[DetailViewController alloc] init];
    [detail setTask:task];
    
    [[self navigationController] pushViewController:detail animated:YES];
    
    //[tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (void)tableView:(UITableView *)aTableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath 
{
    ControlTask *controlTask = [[ControlTask alloc] init];
    Task *task = [listTasks objectAtIndex:indexPath.row];
    if([controlTask removeTask:task])
    {
        [listTasks removeObjectAtIndex:indexPath.row];
        [tblTasks reloadData];
        
    }
    [controlTask release];
}
@end
