//
//  viperRouterProtocol.h
//
//
//  Created by Juan Garcia on 31/3/15.
//  Copyright (c) 2015 Jerti LLC. All rights reserved.
//

@import UIKit;
@protocol ViewProtocol;
@protocol PresenterProtocol;
@protocol InteractorProtocol;

@protocol RouterProtocol

- (void)pushInNavigationController:(UINavigationController*)navigationController animated:(BOOL)animated;
- (void)pushInNavigationController:(UINavigationController*)navigationController animated:(BOOL)animated withInteractor:(id<InteractorProtocol>)interactor;
- (void)popViewControllerAnimnated:(BOOL)animated;
- (void)popViewControllerAnimnated:(BOOL)animated withInteractor:(id<InteractorProtocol>)interactor;
- (void)setPreviousInteractor:(id<InteractorProtocol>)interactor inNavigationController:(UINavigationController*)navigationController;

@property (strong, nonatomic) id <ViewProtocol> viewController;
@property (strong, nonatomic) id <PresenterProtocol> presenter;

@end