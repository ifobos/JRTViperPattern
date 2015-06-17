//
//  viperPresenterProtocol.h
//  
//
//  Created by Juan Garcia on 31/3/15.
//  Copyright (c) 2015 Jerti LLC. All rights reserved.
//
@import UIKit;

#pragma mark - External Protocol

#import "JRTViperViewProtocol.h"
#import "JRTViperRouterProtocol.h"
@protocol InteractorProtocol;

@protocol PresenterProtocol
@property (strong, nonatomic) id <ViewProtocol> viewController;
@property (strong, nonatomic) id <InteractorProtocol> interactor;
@property (strong, nonatomic) id <RouterProtocol> router;
@end