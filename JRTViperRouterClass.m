//Copyright (c) 2015 Juan Carlos Garcia Alfaro. All rights reserved.
//
//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in
//all copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//THE SOFTWARE.

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
    self.presenter.interactor     =  nil;
    self.presenter.router         =  nil;
    self.presenter.viewController =  nil;
    self.viewController.presenter =  nil;
    self.presenter                =  nil;
    self.viewController           =  nil;
}

- (void)popViewControllerAnimnated:(BOOL)animated withInteractor:(id<InteractorProtocol>)interactor
{
    [self setPreviousInteractor:interactor inNavigationController:((UIViewController *)self.viewController).navigationController];
    [self popViewControllerAnimnated:animated];
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
