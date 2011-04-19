//
//  MyClass.h
//  MyTasks
//
//  Created by Claudio Fernando Pinto on 10/04/11.
//  Copyright 2011 Mobilizando. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Category.h"

@interface Task : NSObject {
    NSString *_id;
    NSString *title;
    NSDate *date;
    Category *category;
}
@property (nonatomic, retain) NSString *_id;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSDate *date;
@property (nonatomic, retain) Category *category;

-(id)initWithID:(NSString *)pk andTitle:(NSString *)tit andDate:(NSDate *)dat andCategory:(Category *)cat;
@end
