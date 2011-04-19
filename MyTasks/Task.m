//
//  MyClass.m
//  MyTasks
//
//  Created by Claudio Fernando Pinto on 10/04/11.
//  Copyright 2011 Mobilizando. All rights reserved.
//

#import "Task.h"


@implementation Task
@synthesize _id,title,date,category;

-(id)initWithID:(NSString *)pk andTitle:(NSString *)tit andDate:(NSDate *)dat andCategory:(Category *)cat
{
    if((self = [super init]))
    {
        _id = pk;
        title = tit;
        date = dat;
        category = cat;
    }
    return self;
}
-(void)dealloc
{
    [_id release];
    [title release];
    [date release];
    [category release];
    [super dealloc];
}
@end
