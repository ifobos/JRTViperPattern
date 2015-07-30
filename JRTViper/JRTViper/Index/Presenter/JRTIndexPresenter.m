//
//  JRTIndexPresenter.m
//  JertiObjectiveCDemo
//
//  Created by Juan Garcia on 13/5/15.
//  Copyright (c) 2015 Juan Garcia. All rights reserved.
//

#import "JRTIndexPresenter.h"
#import "JRTIndexInteractor.h"
#import "JRTIndexEntity.h"
#import "JRTIndexViewController.h"

@interface JRTIndexPresenter()
@property (nonatomic, readonly) JRTIndexInteractor          *indexInteractor;
@property (nonatomic, readonly) JRTIndexViewController      *indexTableViewController;
@property (nonatomic, strong  ) JRTIndexEntity              *entity;

@end

@implementation JRTIndexPresenter

- (void)loadFromInteractor
{
    self.entity = [self.indexInteractor newIndexEntity];
}

#pragma mark - Getters

- (JRTIndexEntity *)entity
{
    if (!_entity)
    {
        _entity = [self.indexInteractor newIndexEntity];
    }
    return _entity;
}

-(JRTIndexInteractor *)indexInteractor
{
    return (JRTIndexInteractor *) self.interactor;
}

-(JRTIndexViewController *)indexTableViewController
{
    return (JRTIndexViewController *)self.viewController;
}

#pragma mark - PublicsMethods

- (NSInteger)numberOfSectionsInTableView
{
    return [self.entity.root count];
}

- (NSInteger)numberOfRowsInSection:(NSInteger)index
{
    NSDictionary * section = [self sectionForIndex:index];
    NSArray * routers      = [self demosOfSection:section];
    return [routers count];
}

-(NSString *)titleForHeaderInSection:(NSInteger)index
{
    NSDictionary * section = [self sectionForIndex:index];
    return  [self titleOfSection:section];
}

-(NSString *)demoNameForIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *demo = [self demoForIndexPath:indexPath];
    return [demo objectForKey:kModuleNameKey];
}

-(NSString *)demoRouterNameForIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *demo = [self demoForIndexPath:indexPath];
    return [demo objectForKey:kModuleRouterNameKey];
}

- (void)showDemorAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * routerName = [self demoRouterNameForIndexPath:indexPath];
    id<RouterProtocol> nextRouter = [[NSClassFromString(routerName) alloc] init];
    [nextRouter pushInNavigationController:self.indexTableViewController.navigationController animated:YES];
}

#pragma mark - Helpers

- (NSDictionary *)sectionForIndex:(NSInteger)index
{
    NSDictionary * section;
    id sectionObject = [self.entity.root objectAtIndex:index];
    if ([sectionObject isKindOfClass:[NSDictionary class]])
    {
        section = sectionObject;
    }
    else
    {
        @throw  [[NSException alloc] initWithName:[NSString stringWithFormat:@"%@", self.class]
                                           reason:[NSString stringWithFormat:@"%@, %@ must contain objects of type NSDictionary in root property",NSStringFromSelector(_cmd), self.entity.class]
                                         userInfo:nil];
    }
    return section;
}

- (NSArray *)demosOfSection:(NSDictionary *)section
{
    NSArray * routers;
    id routersObject = [section objectForKey:kModulesKey];
    if ([routersObject isKindOfClass:[NSArray class]])
    {
        routers = routersObject;
    }
    else
    {
        @throw  [[NSException alloc] initWithName:[NSString stringWithFormat:@"%@", self.class]
                                           reason:[NSString stringWithFormat:@"%@, kRoutersKey value must be a NSArray within each NSDictionary in  “root” property of %@", NSStringFromSelector(_cmd), self.entity.class]
                                         userInfo:nil];
    }
    return routers;
}

- (NSDictionary *)demoForIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *demo;
    NSDictionary * section = [self sectionForIndex:indexPath.section];
    NSArray * demos      = [self demosOfSection:section];
    id demoObject = [demos objectAtIndex:indexPath.row];
    if ([demoObject isKindOfClass:[NSDictionary class]])
    {
        demo = demoObject;
    }
    else
    {
        @throw  [[NSException alloc] initWithName:[NSString stringWithFormat:@"%@", self.class]
                                           reason:[NSString stringWithFormat:@"%@,  demos of section must contain objects of type NSDictionary in Array", NSStringFromSelector(_cmd)]
                                         userInfo:nil];
    }
    
    return demo;
}

- (NSString *)titleOfSection:(NSDictionary *)section
{
    NSString * title;
    id titleObject = [section objectForKey:kSectionTitleKey];
    if ([titleObject isKindOfClass:[NSString class]])
    {
        title = titleObject;
    }
    else
    {
        @throw  [[NSException alloc] initWithName:[NSString stringWithFormat:@"%@", self.class]
                                           reason:[NSString stringWithFormat:@"%@, kTitleKey value must be a NSString within each NSDictionary in  “root” property of %@", NSStringFromSelector(_cmd), self.entity.class]
                                         userInfo:nil];
    }
    return title;
}

@end
