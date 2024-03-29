//
//  DocumentVC.m
//  DocumentPlayer
//
//  Created by 黄瑞 on 2019/7/12.
//  Copyright © 2019 黄瑞. All rights reserved.
//

#import "DocumentVC.h"

@interface DocumentVC ()

@end

@implementation DocumentVC

#pragma mark - View did load
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Document";
    
    self.titleList = @[
                       [BaseCellModel modelWithTitle:@"App Frameworks" jumpClass:@"AppFrameworksVC"],
                       [BaseCellModel modelWithTitle:@"Graphics and Games" jumpClass:@"GraphicsandGamesVC"],
                       [BaseCellModel modelWithTitle:@"App Services" jumpClass:@"AppServicesVC"],
                       [BaseCellModel modelWithTitle:@"Media" jumpClass:@"MediaVC"],
                       [BaseCellModel modelWithTitle:@"Web" jumpClass:@"Web"],
                       [BaseCellModel modelWithTitle:@"Developer Tools" jumpClass:@"DeveloperToolsVC"],
                       [BaseCellModel modelWithTitle:@"System" jumpClass:@"SystemVC"],
                       ];
}

#pragma mark - NSNotification method
#pragma mark - Gesture method
#pragma mark - IB action
#pragma mark - Delegate
#pragma mark - Data source
#pragma mark - UITableViewDataSource
#pragma mark - Other
#pragma mark - UI config
#pragma mark - UI update
#pragma mark - Network
#pragma mark - Get
#pragma mark - Set

@end
