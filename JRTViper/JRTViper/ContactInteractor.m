//
//  ContactInteractor.m
//  JRTViper
//
//  Created by Juan Garcia on 8/19/15.
//  Copyright (c) 2015 Juan Garcia. All rights reserved.
//

#import "ContactInteractor.h"

@implementation ContactInteractor

- (NSArray *)contactList
{
    // Usually entities are obtained from a content provider,
    // but this example is only about viper

    NSMutableArray *list = [NSMutableArray new];
    for (int i = 0; i < 100; i++)
    {
        ContactEntity *entity = [ContactEntity new];
        entity.uid            = i;
        entity.name           = [NSString stringWithFormat:@"Jhon%i",i];
        entity.email          = [NSString stringWithFormat:@"jhon%i@mail.com",i];
        entity.phone          = [NSString stringWithFormat:@"9999 999%i",i];
        entity.address        = [NSString stringWithFormat:@"address #%i",i];
        [list addObject:entity];
    }
    return [NSArray arrayWithArray:list];
}

- (ContactEntity *)readContactWithUid:(NSInteger)uid
{
    // Usually entities are obtained from a content provider,
    // but this example is only about viper

    ContactEntity *entity = [ContactEntity new];
    entity.uid            = uid;
    entity.name           = [NSString stringWithFormat:@"Jhon%li",(long)uid];
    entity.email          = [NSString stringWithFormat:@"jhon%li@mail.com",(long)uid];
    entity.phone          = [NSString stringWithFormat:@"9999 999%li",(long)uid];
    entity.address        = [NSString stringWithFormat:@"address #%li",(long)uid];
    return entity;
}

@end
