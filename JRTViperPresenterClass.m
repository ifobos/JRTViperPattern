//
//  viperPresenterClass.m
//
//
//  Created by Juan Garcia on 8/4/15.
//  Copyright (c) 2015 Jerti LLC. All rights reserved.
//

#import "JRTViperPresenterClass.h"
#import "JRTViperInteractorProtocol.h"

@interface JRTViperPresenterClass() 
@end

@implementation JRTViperPresenterClass
#pragma mark - Synthesize

@synthesize viewController = _viewController;
@synthesize interactor     = _interactor;
@synthesize router         = _router;

#pragma mark - Init

-(instancetype)init
{
    if (self = [super init])
    {
        [self commonInit];
    }
    return self;
}

- (void)commonInit
{
    self.interactor.presenter = self;
}

-(void)setInteractor:(id<InteractorProtocol>)interactor
{
    _interactor           = interactor;
    _interactor.presenter = self;
}

#pragma mark - Getters

-(id<ViewProtocol>)viewController
{
    if (!_viewController)
        @throw  [[NSException alloc] initWithName:[NSString stringWithFormat:@"Abstract %@", self.class]
                                           reason:[NSString stringWithFormat:@"the Router set nil in %@ property", NSStringFromSelector(_cmd)]
                                         userInfo:nil];
    return _viewController;
}

-(id<RouterProtocol>)router
{
    if (!_router)
        @throw  [[NSException alloc] initWithName:[NSString stringWithFormat:@"%@", self.class]
                                           reason:[NSString stringWithFormat:@"%@, the Router should set himself into this property", NSStringFromSelector(_cmd)]
                                         userInfo:nil];
    return _router;
}

#pragma mark - Abstract

-(id<InteractorProtocol>)interactor
{
    if (!_interactor)
    {
        _interactor = [[NSClassFromString([self interactorClassName]) alloc] init];
        
        if (!_interactor)
        {
            @throw  [[NSException alloc] initWithName:[NSString stringWithFormat:@"Abstract %@", self.class]
                                               reason:[NSString stringWithFormat:@"%@ it does not exist, %@ don’t have an implementation of %@", [self interactorClassName], self.class, NSStringFromSelector(_cmd)]
                                             userInfo:nil];
        }
        else
        {
            _interactor.presenter = self;
        }    
    }
    return _interactor;
}

#pragma mark - Class Name Helpers

- (NSString *)abstractClassName
{
    NSString *className = NSStringFromClass([self class]);
    className = [className stringByReplacingOccurrencesOfString:@"Presenter" withString:@""];
    return className;
}


- (NSString *)interactorClassName
{
    return [NSString stringWithFormat:@"%@%@", [self abstractClassName], @"Interactor"];
}


@end
