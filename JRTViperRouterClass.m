//
//  viperRouterClass.m
//
//
//  Created by Juan Garcia on 31/3/15.
//  Copyright (c) 2015 Jerti LLC. All rights reserved.
//

#import "JRTViperRouterClass.h"
#import "JRTViperPresenterProtocol.h"
#import "JRTViperViewProtocol.h"

@interface JRTViperRouterClass()

@end

@implementation JRTViperRouterClass

#pragma mark - Synthesize

@synthesize viewController = _viewController;
@synthesize presenter      = _presenter;

#pragma mark - Setup

-(instancetype)init
{
    if (self = [super init])
    {
        self.viewController.presenter =  self.presenter;
        self.presenter.viewController =  self.viewController;
        self.presenter.router         =  self;
    }
    return self;
}

#pragma mark - Public

- (void)pushInNavigationController:(UINavigationController*)navigationController animated:(BOOL)animated
{
    [navigationController pushViewController: (UIViewController *)self.viewController animated:animated];
}

- (void)pushInNavigationController:(UINavigationController*)navigationController animated:(BOOL)animated withInteractor:(id<InteractorProtocol>)interactor
{
    self.presenter.interactor = interactor;
    [navigationController pushViewController: (UIViewController *)self.viewController animated:animated];
}

- (void)popViewControllerAnimnated:(BOOL)animated
{
    [((UIViewController *)self.viewController).navigationController popViewControllerAnimated:animated];
}

- (void)popViewControllerAnimnated:(BOOL)animated withInteractor:(id<InteractorProtocol>)interactor
{
    [self setPreviousInteractor:interactor inNavigationController:((UIViewController *)self.viewController).navigationController];
    [((UIViewController *)self.viewController).navigationController popViewControllerAnimated:animated];
}

- (void)setPreviousInteractor:(id<InteractorProtocol>)interactor inNavigationController:(UINavigationController*)navigationController
{
    NSUInteger indexOfViewController         = [navigationController.viewControllers indexOfObject:self.viewController];
    id <ViewProtocol> previousViewController = [navigationController.viewControllers objectAtIndex:indexOfViewController-1];
    id <PresenterProtocol>previousPresenter  = previousViewController.presenter;
    previousPresenter.interactor             = interactor;
}

#pragma mark - Abstract

- (id<ViewProtocol>)viewController
{
    
    if (!_viewController)
    {
        _viewController = [[NSClassFromString([self viewControllerClassName]) alloc] init];
        
        if (!_viewController)
        {
            @throw  [[NSException alloc] initWithName:[NSString stringWithFormat:@"Abstract %@", self.class]
                                               reason:[NSString stringWithFormat:@"%@ Class return nil for %@", [self viewControllerClassName], NSStringFromSelector(_cmd)]
                                             userInfo:nil];
        }
    }
    return _viewController;
}

- (id<PresenterProtocol>)presenter
{
    if (!_presenter)
    {
        _presenter = [[NSClassFromString([self presenterClassName]) alloc] init];
        
        if (!_presenter)
        {
            @throw  [[NSException alloc] initWithName:[NSString stringWithFormat:@"Abstract %@", self.class]
                                               reason:[NSString stringWithFormat:@"%@ Class return nil for %@", [self presenterClassName], NSStringFromSelector(_cmd)]
                                             userInfo:nil];
        }
    }
    
    return _presenter;
}

#pragma mark - Class Name Helpers

- (NSString *)abstractClassName
{
    NSString *className = NSStringFromClass([self class]);
    className = [className stringByReplacingOccurrencesOfString:@"Router" withString:@""];
    return className;
}


- (NSString *)viewControllerClassName
{
    return [NSString stringWithFormat:@"%@%@", [self abstractClassName], @"ViewController"];
}

- (NSString *)presenterClassName
{
    return [NSString stringWithFormat:@"%@%@", [self abstractClassName], @"Presenter"];
}

@end
