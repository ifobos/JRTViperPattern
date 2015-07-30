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
