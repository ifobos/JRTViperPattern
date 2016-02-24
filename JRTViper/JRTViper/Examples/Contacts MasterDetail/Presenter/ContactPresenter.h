//
//  ContactPresenter.h
//  JRTViper
//
//  Created by Juan Garcia on 8/19/15.
//  Copyright (c) 2015 Juan Garcia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JRTViperPresenterClass.h"
@interface ContactPresenter : JRTViperPresenterClass
@property (nonatomic, strong) NSNumber *contactUid;

- (NSString *)uid;
- (NSString *)name;
- (NSString *)email;
- (NSString *)phone;
- (NSString *)address;
@end
