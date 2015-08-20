//
//  ContactViewController.m
//  JRTViper
//
//  Created by Juan Garcia on 8/19/15.
//  Copyright (c) 2015 Juan Garcia. All rights reserved.
//

#import "ContactViewController.h"
#import "ContactPresenter.h"

@interface ContactViewController ()
@property (weak, nonatomic    ) IBOutlet UILabel *uidLabel;
@property (weak, nonatomic    ) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic    ) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic    ) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic    ) IBOutlet UILabel *addressLabel;
@property (nonatomic, readonly) ContactPresenter *contactPresenter;
@end

@implementation ContactViewController

- (ContactPresenter *)contactPresenter
{
    return (ContactPresenter *)self.presenter;
}

- (void)viewDidLoad
{
    [super viewDidLoad];    
    self.title             = [NSString stringWithFormat:@"Contact %li", (long)self.contactPresenter.contactUid];
    self.uidLabel.text     = [self.contactPresenter uid];
    self.nameLabel.text    = [self.contactPresenter name];
    self.emailLabel.text   = [self.contactPresenter email];
    self.phoneLabel.text   = [self.contactPresenter phone];
    self.addressLabel.text = [self.contactPresenter address];
}


@end
