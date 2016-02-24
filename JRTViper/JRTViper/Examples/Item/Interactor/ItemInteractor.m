//
//  ItemInteractor.m
//  JRTViper
//
//  Created by Juan Garcia on 8/19/15.
//  Copyright (c) 2015 Juan Garcia. All rights reserved.
//

#import "ItemInteractor.h"

@implementation ItemInteractor
- (ItemEntity *)readItem
{
    // Usually entities are obtained from a content provider,
    // but this example is only about viper
    
    ItemEntity *itemEntity = [ItemEntity new];
    itemEntity.uid         = 8;
    itemEntity.name        = @"abc";
    itemEntity.about       = @"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
    return itemEntity;
}
@end
