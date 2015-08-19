//
//  ItemEntity.h
//  JRTViper
//
//  Created by Juan Garcia on 8/19/15.
//  Copyright (c) 2015 Juan Garcia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JRTViperEntityClass.h"
@interface ItemEntity : JRTViperEntityClass
@property (nonatomic, strong) NSString *itemId;
@property (nonatomic, strong) NSString *itemName;
@property (nonatomic, strong) NSString *itemDescription;
@end
