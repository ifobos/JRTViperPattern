//
//  ContactPresenter.m
//  JRTViper
//
//  Created by Juan Garcia on 8/19/15.
//  Copyright (c) 2015 Juan Garcia. All rights reserved.
//

#import "ContactPresenter.h"
#import "ContactEntity.h"
#import "ContactInteractor.h"

@interface ContactPresenter ()
@property (nonatomic, readonly) ContactInteractor *contactInteractor;
@property (nonatomic, strong  ) ContactEntity     *contactEntity;
@end

@implementation ContactPresenter

- (ContactInteractor *)contactInteractor
{
    return (ContactInteractor *)self.interactor;
}

- (ContactEntity *)contactEntity
{
    if (!_contactEntity)
    {
        _contactEntity = [self.contactInteractor readContactWithUid:self.contactUid.integerValue];
    }
    return _contactEntity;
}

#pragma mark - Public

- (NSString *)uid
{
    return [NSString stringWithFormat:@"%li", (long)self.contactEntity.uid];
}

- (NSString *)name
{
    return [self.contactEntity.name capitalizedString];
}

- (NSString *)email
{
    return self.contactEntity.email;
}

- (NSString *)phone
{
    return self.contactEntity.phone;
}

- (NSString *)address
{
    return self.contactEntity.address;
}

@end
