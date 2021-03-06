//
//  ContactEntity.h
//  JRTViper
//
//  Created by Juan Garcia on 8/19/15.
//  Copyright (c) 2015 Juan Garcia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JRTViperEntityClass.h"
@interface ContactEntity : JRTViperEntityClass;
@property (nonatomic        ) NSInteger uid;
@property (nonatomic, strong) NSString  *name;
@property (nonatomic, strong) NSString  *email;
@property (nonatomic, strong) NSString  *phone;
@property (nonatomic, strong) NSString  *address;
@end
