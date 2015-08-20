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

@synthesize presenter      = _presenter;

#pragma mark - Public

- (void)pushInNavigationController:(UINavigationController*)navigationController animated:(BOOL)animated
{
    [navigationController pushViewController: [self viewController] animated:animated];
}

- (void)pushInNavigationController:(UINavigationController*)navigationController animated:(BOOL)animated withInteractor:(id<InteractorProtocol>)interactor
{
    UIViewController<ViewProtocol> * viewController = (UIViewController<ViewProtocol> *) [self viewController];
    viewController.presenter.interactor = interactor;
    [navigationController pushViewController: viewController animated:animated];
}

- (void)pushInNavigationController:(UINavigationController*)navigationController animated:(BOOL)animated andSetPresenterPropertyNamed:(NSString *)propertyName withObject:(id)object
{
    UIViewController<ViewProtocol> * viewController = (UIViewController<ViewProtocol> *) [self viewController];
    NSObject *presenter = (NSObject *)viewController.presenter;
    
    NSRange range = NSMakeRange(0, 1);
    NSString *firstCharacter = [propertyName substringWithRange:range];
    NSString *capitalizedName = [propertyName stringByReplacingCharactersInRange:range withString:[firstCharacter uppercaseString]];
    NSString *selectorString = [NSString stringWithFormat:@"set%@:", capitalizedName];
    SEL selector = NSSelectorFromString(selectorString);
    if ([presenter respondsToSelector:selector])
    {
        #pragma clang diagnostic push
        #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [presenter performSelector:selector withObject:object];
        #pragma clang diagnostic pop
    }
    else
    {
        @throw  [[NSException alloc] initWithName:[NSString stringWithFormat:@"Abstract %@", self.class]
                                           reason:[NSString stringWithFormat:@"%@ Class must respont to selector %@", [self presenterClassName], selectorString]
                                         userInfo:nil];
    }
    [navigationController pushViewController: viewController animated:animated];
}

- (void)pushInNavigationController:(UINavigationController*)navigationController animated:(BOOL)animated andPresenterPerformSelector:(SEL)selector withObject:(id)object
{
    UIViewController<ViewProtocol> * viewController = (UIViewController<ViewProtocol> *) [self viewController];
    NSObject *presenter = (NSObject *)viewController.presenter;
    if ([presenter respondsToSelector:selector])
    {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [presenter performSelector:selector withObject:object];
#pragma clang diagnostic pop
    }
    else
    {
        @throw  [[NSException alloc] initWithName:[NSString stringWithFormat:@"Abstract %@", self.class]
                                           reason:[NSString stringWithFormat:@"%@ Class must respont to selector", [self presenterClassName]]
                                         userInfo:nil];
    }
    [navigationController pushViewController: viewController animated:animated];
}

- (void)popViewControllerAnimnated:(BOOL)animated
{
    [((UIViewController *)self.presenter.viewController).navigationController popViewControllerAnimated:animated];
}

- (void)popViewControllerAnimnated:(BOOL)animated withInteractor:(id<InteractorProtocol>)interactor
{
    [self setPreviousInteractor:interactor inNavigationController:((UIViewController *)self.presenter.viewController).navigationController];
    [self popViewControllerAnimnated:animated];
}

- (void)setPreviousInteractor:(id<InteractorProtocol>)interactor inNavigationController:(UINavigationController*)navigationController
{
    NSUInteger indexOfViewController         = [navigationController.viewControllers indexOfObject:self.presenter.viewController];
    id <ViewProtocol> previousViewController = [navigationController.viewControllers objectAtIndex:indexOfViewController-1];
    id <PresenterProtocol>previousPresenter  = previousViewController.presenter;
    previousPresenter.interactor             = interactor;
}

#pragma mark - Abstract

- (UIViewController *)viewController
{
    if (!_presenter)
    {
        id <ViewProtocol> viewController = [[NSClassFromString([self viewControllerClassName]) alloc] init];
        if (!viewController)
        {
            @throw  [[NSException alloc] initWithName:[NSString stringWithFormat:@"Abstract %@", self.class]
                                               reason:[NSString stringWithFormat:@"%@ Class return nil for %@", [self viewControllerClassName], NSStringFromSelector(_cmd)]
                                             userInfo:nil];
        }
        
        id <PresenterProtocol> presenter = [[NSClassFromString([self presenterClassName]) alloc] init];
        if (!presenter)
        {
            @throw  [[NSException alloc] initWithName:[NSString stringWithFormat:@"Abstract %@", self.class]
                                               reason:[NSString stringWithFormat:@"%@ Class return nil for %@", [self presenterClassName], NSStringFromSelector(_cmd)]
                                             userInfo:nil];
        }
        viewController.presenter    = presenter;
        presenter.viewController    = viewController;
        presenter.router            = self;
        self.presenter              = presenter;
        return (UIViewController *)viewController;
    }
    else
    {
        return (UIViewController *)self.presenter.viewController;
    }
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
