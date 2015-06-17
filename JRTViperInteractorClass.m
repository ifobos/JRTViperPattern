//
//  viperInteractorClass.m
//  
//
//  Created by Juan Garcia on 22/4/15.
//  Copyright (c) 2015 Jerti LLC. All rights reserved.
//

#import "JRTViperInteractorClass.h"

@implementation JRTViperInteractorClass

@synthesize presenter = _presenter;

#pragma mark - Getters

-(id<PresenterProtocol>)presenter
{
    if (!_presenter)
    {
        @throw  [[NSException alloc] initWithName:[NSString stringWithFormat:@"%@", self.class]
                                           reason:[NSString stringWithFormat:@"%@, the presenter should set himself into this property", NSStringFromSelector(_cmd)]
                                         userInfo:nil];
    }
    return _presenter;
}

@end
