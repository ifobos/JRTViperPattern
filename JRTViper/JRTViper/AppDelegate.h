//
//  AppDelegate.h
//  JRTViper
//
//  Created by Juan Garcia on 7/30/15.
//  Copyright (c) 2015 Juan Garcia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JRTMainRouter.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) JRTMainRouter *mainRouter;


@end

