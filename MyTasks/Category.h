//
//  Category.h
//  MyTasks
//
//  Created by Claudio Fernando Pinto on 10/04/11.
//  Copyright 2011 Mobilizando. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Category : NSObject {
    NSString *_id;
    NSString *title;
}
-(id)initWithID:(NSString *)pk andTitle:(NSString *)tit;
@property (nonatomic, retain) NSString *_id;
@property (nonatomic, retain) NSString *title;
@end
