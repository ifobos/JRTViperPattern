//
//  JRTIndexEntity.m
//  JertiObjectiveCDemo
//
//  Created by Juan Garcia on 13/5/15.
//  Copyright (c) 2015 Juan Garcia. All rights reserved.
//

#import "JRTIndexEntity.h"

#import "EmptyRouter.h"
#import "ItemRouter.h"

NSString * const kSectionTitleKey = @"SectionTitle";
NSString * const kModulesKey      = @"Modules";
NSString * const kModuleNameKey   = @"ModuleName";
NSString * const kModuleRouterNameKey = @"ModuleRouter";

@implementation JRTIndexEntity
-(NSArray *)root
{
    if (!_root)
    {
        _root = @[
                    @{
                      kSectionTitleKey  : @"Base",
                      kModulesKey       : @[
                                            @{
                                                kModuleNameKey          : @"Empty",
                                                kModuleRouterNameKey    : NSStringFromClass([EmptyRouter class])
                                              },
                                            @{
                                                kModuleNameKey          : @"Item",
                                                kModuleRouterNameKey    : NSStringFromClass([ItemRouter class])
                                             }
                                            
                                             ]
                      }
                    
                  ];
    }
    return _root;
}


//-(NSArray *)root
//{
//    if (!_root)
//    {
//        _root = @[
//                  @{
//                      kSectionTitleKey  : @"Views",
//                      kModulesKey       : @[
//                              @{
//                                  kModuleNameKey          : @"Form",
//                                  kModuleRouterNameKey    : NSStringFromClass([JRTFormRouter class])
//                                  }
//                              
//                              ]
//                      },
//                  @{
//                      kSectionTitleKey  : @"Integrations",
//                      kModulesKey       : @[
//                              @{
//                                  kModuleNameKey          : @"Contacts",
//                                  kModuleRouterNameKey    : NSStringFromClass([JRTContactsRouter class])
//                                  }
//                              
//                              ]
//                      },
//                  @{
//                      kSectionTitleKey  : @"Utilities",
//                      kModulesKey       : @[
//                              @{
//                                  kModuleNameKey          : @"Alert",
//                                  kModuleRouterNameKey    : NSStringFromClass([JRTAlertRouter class])
//                                  }
//                              
//                              ]
//                      }
//                  ];
//    }
//    return _root;
//}

@end
