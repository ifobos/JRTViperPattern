//
//  viperTableViewController.m
//  
//
//  Created by Juan Garcia on 7/4/15.
//  Copyright (c) 2015 Jerti LLC. All rights reserved.
//

#import "JRTViperTableViewControllerClass.h"

@interface JRTViperTableViewControllerClass ()

@end

@implementation JRTViperTableViewControllerClass


@synthesize presenter =_presenter;

#pragma mark - Getters

-(id<PresenterProtocol>)presenter
{
    if (!_presenter)
    @throw  [[NSException alloc] initWithName:[NSString stringWithFormat:@"Abstract %@", self.class]
                                       reason:[NSString stringWithFormat:@"the Router set nil in %@ property", NSStringFromSelector(_cmd)]
                                     userInfo:nil];
    return _presenter;
}


#pragma mark - Abstract Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 0;
}

@end
