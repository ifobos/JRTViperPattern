//
//  viperViewControllerClass.m
//  
//
//  Created by Juan Garcia on 31/3/15.
//  Copyright (c) 2015 Jerti LLC. All rights reserved.
//

#import "JRTViperViewControllerClass.h"

@interface JRTViperViewControllerClass ()

@end

@implementation JRTViperViewControllerClass

@synthesize presenter =_presenter;

#pragma mark - Getters

-(id<PresenterProtocol>)presenter
{
    if (!_presenter)
        @throw  [[NSException alloc] initWithName:[NSString stringWithFormat:@"Abstract %@", self.class]
                                           reason:[NSString stringWithFormat:@"the Router set nil in %@ property", NSStringFromSelector(_cmd)]
                                         userInfo:nil];
    return _presenter;
}

@end
