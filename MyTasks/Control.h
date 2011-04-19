//
//  Control.h
//  MyTasks
//
//  Created by Claudio Fernando Pinto on 10/04/11.
//  Copyright 2011 Mobilizando. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Control : NSObject {
    NSString *databaseName;
	NSString *databasePath;
}
-(id)init;
@end
