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
    NSMutableArray *list = [NSMutableArray new];
    for (int i = 0; i < 9; i++)
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

@end
