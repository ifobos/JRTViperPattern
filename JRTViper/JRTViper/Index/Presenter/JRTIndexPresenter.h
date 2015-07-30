//
//  JRTIndexPresenter.h
//  JertiObjectiveCDemo
//
//  Created by Juan Garcia on 13/5/15.
//  Copyright (c) 2015 Juan Garcia. All rights reserved.
//

@import Foundation;
#import "JRTViperPresenterClass.h"

@interface JRTIndexPresenter : JRTViperPresenterClass
- (NSInteger)numberOfSectionsInTableView;
- (NSInteger)numberOfRowsInSection:(NSInteger)index;
- (NSString *)titleForHeaderInSection:(NSInteger)index;
- (NSString *)demoNameForIndexPath:(NSIndexPath *)indexPath;
- (void)showDemorAtIndexPath:(NSIndexPath *)indexPath;
@end
