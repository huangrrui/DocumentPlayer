//
//  NSUIntegerVC.m
//  DocumentPlayer
//
//  Created by 黄瑞 on 2019/7/12.
//  Copyright © 2019 黄瑞. All rights reserved.
//

#import "NSUIntegerVC.h"

@interface NSUIntegerVC ()

<
UITableViewDataSource
>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation NSUIntegerVC

#pragma mark - View did load
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"NSUIntegerVC";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self configTableView];
}

#pragma mark - NSNotification method
#pragma mark - Gesture method
#pragma mark - IB action
#pragma mark - Delegate
#pragma mark - Data source
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    switch (indexPath.row)
    {
        case 0:
            cell.textLabel.text = @"NSUInteger";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu", NSUIntegerMax];
            break;
        default:
            break;
    }
    return cell;
}

#pragma mark - Other
#pragma mark - UI config
- (void)configTableView
{
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

#pragma mark - UI update
#pragma mark - Network
#pragma mark - Get
#pragma mark - Set

@end
