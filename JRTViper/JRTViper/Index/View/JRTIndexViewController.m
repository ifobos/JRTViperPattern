//
//  JRTIndexTableViewController.m
//  JertiObjectiveCDemo
//
//  Created by Juan Garcia on 13/5/15.
//  Copyright (c) 2015 Juan Garcia. All rights reserved.
//

#import "JRTIndexViewController.h"
#import "JRTIndexPresenter.h"


@interface JRTIndexViewController ()
@property (nonatomic, readonly) JRTIndexPresenter *indexPresenter;
@end

@implementation JRTIndexViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Index";
}

#pragma mark - Getters

- (JRTIndexPresenter *)indexPresenter
{
    return (JRTIndexPresenter *)self.presenter;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.indexPresenter numberOfSectionsInTableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.indexPresenter numberOfRowsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"classCell";
    UITableViewCell *cell           = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) cell           = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    cell.textLabel.text             = [self.indexPresenter demoNameForIndexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.indexPresenter showDemorAtIndexPath:indexPath];
}


-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [self.indexPresenter titleForHeaderInSection:section];
}



@end
