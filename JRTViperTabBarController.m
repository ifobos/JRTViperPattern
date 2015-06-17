//
//  viperTabBarController.m
//  Trainer
//
//  Created by Juan Garcia on 14/6/15.
//  Copyright (c) 2015 Ndurnz. All rights reserved.
//

#import "JRTViperTabBarController.h"

@interface JRTViperTabBarController ()

@end

@implementation JRTViperTabBarController

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
