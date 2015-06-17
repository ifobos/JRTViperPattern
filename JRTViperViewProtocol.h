//
//  viperViewProtocol.h
//
//
//  Created by Juan Garcia on 31/3/15.
//  Copyright (c) 2015 Jerti LLC. All rights reserved.
//
@import UIKit;
@protocol PresenterProtocol;

//

@protocol ViewProtocol

@property (strong, nonatomic) id <PresenterProtocol> presenter;

@end

//

//@protocol InternalViewProtocol
//
//@end