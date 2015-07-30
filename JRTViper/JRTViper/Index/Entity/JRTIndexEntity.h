//
//  JRTIndexEntity.h
//  JertiObjectiveCDemo
//
//  Created by Juan Garcia on 13/5/15.
//  Copyright (c) 2015 Juan Garcia. All rights reserved.
//

@import Foundation;

extern NSString * const kSectionTitleKey;
extern NSString * const kModulesKey;
extern NSString * const kModuleNameKey;
extern NSString * const kModuleRouterNameKey;

@interface JRTIndexEntity : NSObject
@property (nonatomic, strong) NSArray *root;
@end
