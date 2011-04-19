//
//  Category.m
//  MyTasks
//
//  Created by Claudio Fernando Pinto on 10/04/11.
//  Copyright 2011 Mobilizando. All rights reserved.
//

#import "Category.h"


@implementation Category
@synthesize _id,title;
-(id)initWithID:(NSString *)pk andTitle:(NSString *)tit
{
    if((self = [super init]))
    {
        _id = pk;
        title = tit;
    }
    return self;
}
-(void)dealloc
{
    [_id release];
    [title release];
    [super dealloc];
}
@end
