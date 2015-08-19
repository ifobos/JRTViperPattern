//
//  ItemViewController.m
//  JRTViper
//
//  Created by Juan Garcia on 8/19/15.
//  Copyright (c) 2015 Juan Garcia. All rights reserved.
//

#import "ItemViewController.h"
#import "ItemPresenter.h"

@interface ItemViewController ()
@property (weak, nonatomic    ) IBOutlet UILabel       *itemIdLabel;
@property (weak, nonatomic    ) IBOutlet UILabel       *itemNameLabel;
@property (weak, nonatomic    ) IBOutlet UILabel       *itemDescriptionLabel;
@property (nonatomic, readonly) ItemPresenter *itemPresenter;
@end

@implementation ItemViewController

- (ItemPresenter *)itemPresenter
{
    return (ItemPresenter *)self.presenter;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title                     = @"Item";
    self.itemIdLabel.text          = [self.itemPresenter itemId];
    self.itemNameLabel.text        = [self.itemPresenter itemName];
    self.itemDescriptionLabel.text = [self.itemPresenter itemDescription];
}



@end
