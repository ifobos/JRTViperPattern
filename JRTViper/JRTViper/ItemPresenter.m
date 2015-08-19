//
//  ItemPresenter.m
//  JRTViper
//
//  Created by Juan Garcia on 8/19/15.
//  Copyright (c) 2015 Juan Garcia. All rights reserved.
//

#import "ItemPresenter.h"
#import "ItemEntity.h"
#import "ItemInteractor.h"
@interface ItemPresenter ()
@property (nonatomic, readonly)ItemInteractor *itemInteractor;
@property (nonatomic, strong) ItemEntity *itemEntity;

@end

@implementation ItemPresenter

- (ItemInteractor *)itemInteractor
{
    return (ItemInteractor *)self.interactor;
}

-(ItemEntity *)itemEntity
{
    if (!_itemEntity)
    {
        _itemEntity = [self.itemInteractor readItem];
    }
    return _itemEntity;
}

- (NSString *)itemId
{
    return [NSString stringWithFormat:@"[%li]",(long)self.itemEntity.uid];
}

- (NSString *)itemName
{
    return [self.itemEntity.name capitalizedString];
}

- (NSString *)itemDescription
{
    return [NSString stringWithFormat:@"%@ +",self.itemEntity.about];
}


@end
