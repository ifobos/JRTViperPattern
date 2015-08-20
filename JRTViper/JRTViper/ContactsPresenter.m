//
//  ContactsPresenter.m
//  JRTViper
//
//  Created by Juan Garcia on 8/19/15.
//  Copyright (c) 2015 Juan Garcia. All rights reserved.
//

#import "ContactsPresenter.h"
#import "ContactEntity.h"
#import "ContactInteractor.h"
#import "ContactRouter.h"

@interface ContactsPresenter ()
@property (nonatomic, readonly) ContactInteractor *contactInteractor;
@property (nonatomic, strong)NSArray *contacts;
@end

@implementation ContactsPresenter


#pragma mark - Custom Interactor

// If the name of the interactor class does not conform to standard

@synthesize interactor = _interactor;

-(id<InteractorProtocol>)interactor
{
    if (!_interactor)
    {
        _interactor = [ContactInteractor new];
    }
    return _interactor;
}

#pragma mark - Getters

- (ContactInteractor *)contactInteractor
{
    return (ContactInteractor *)self.interactor;
}

- (NSArray *)contacts
{
    if (!_contacts)
    {
        _contacts = [self.contactInteractor contactList];
    }
    return _contacts;
}

#pragma mark - Publics

- (NSInteger)numberOfContacts
{
    return [self.contacts count];
}

- (NSString *)nameOfContactAtIndex:(NSInteger)index
{
    ContactEntity *contact = [self.contacts objectAtIndex:index];
    return contact.name;
}

-(void)showContactAtIndex:(NSInteger)index
{
    ContactRouter *nextRouter = [ContactRouter new];    
    [nextRouter pushInNavigationController:((UIViewController*)self.viewController).navigationController animated:YES andPresenterPerformSelector:NSSelectorFromString(@"setContactUid:") withObject:@(index)];
}



@end
