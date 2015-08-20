//
//  ContactInteractor.h
//  JRTViper
//
//  Created by Juan Garcia on 8/19/15.
//  Copyright (c) 2015 Juan Garcia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JRTViperInteractorClass.h"
#import "ContactEntity.h"
@interface ContactInteractor : JRTViperInteractorClass
- (NSArray *)contactList;
- (ContactEntity *)readContactWithUid:(NSInteger)uid;
@end
