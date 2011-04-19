//
//  ControlCategory.h
//  MyTasks
//
//  Created by Claudio Fernando Pinto on 10/04/11.
//  Copyright 2011 Mobilizando. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "Control.h"
#import "Category.h"


@interface ControlCategory : Control {
    
}
-(id)init;
-(NSMutableArray *)listCategories;
-(Category *)findByID:(NSString *)ID;
@end
