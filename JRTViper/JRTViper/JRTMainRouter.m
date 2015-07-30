//
//  JRTMainRouter.m
//  
//
//  Created by Juan Garcia on 31/3/15.
//  Copyright (c) 2015 Jerti LLC. All rights reserved.
//

#import "JRTMainRouter.h"
#import "JRTViperRouterProtocol.h"


NSString * const kInitialRouter = @"JRTIndexRouter";

@interface JRTMainRouter ()
@property (nonatomic, strong) UINavigationController *mainNavigationController;
@property (nonatomic, strong) id<RouterProtocol> initialRouter;
@end

@implementation JRTMainRouter

- (UINavigationController *)mainNavigationController
{
    if (!_mainNavigationController)
    {
        _mainNavigationController = [UINavigationController new];
        [self.initialRouter pushInNavigationController:_mainNavigationController animated:NO];
    }
    return _mainNavigationController;
}

-(id<RouterProtocol>)initialRouter
{
    if (!_initialRouter) _initialRouter = [[NSClassFromString(kInitialRouter) alloc] init];
    return _initialRouter;
}

- (id)rootViewController
{
    return self.mainNavigationController;
}


@end
