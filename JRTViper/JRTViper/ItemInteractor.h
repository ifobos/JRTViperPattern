//
//  ItemInteractor.h
//  JRTViper
//
//  Created by Juan Garcia on 8/19/15.
//  Copyright (c) 2015 Juan Garcia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JRTViperInteractorClass.h"
#import "ItemEntity.h"

@interface ItemInteractor : JRTViperInteractorClass
- (ItemEntity *)readItem;
@end
