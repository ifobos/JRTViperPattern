//
//  ContactsPresenter.h
//  JRTViper
//
//  Created by Juan Garcia on 8/19/15.
//  Copyright (c) 2015 Juan Garcia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JRTViperPresenterClass.h"
@interface ContactsPresenter : JRTViperPresenterClass
- (NSInteger)numberOfContacts;
- (NSString *)nameOfContactAtIndex:(NSInteger)index;
- (void)showContactAtIndex:(NSInteger)index;
@end
