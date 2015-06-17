//
//  viperInteractorProtocol.h
//  
//
//  Created by Juan Garcia on 22/4/15.
//  Copyright (c) 2015 Jerti LLC. All rights reserved.
//


@import Foundation;
#import "JRTViperPresenterProtocol.h"

@protocol InteractorProtocol
@property (strong, nonatomic) id <PresenterProtocol> presenter;
@end