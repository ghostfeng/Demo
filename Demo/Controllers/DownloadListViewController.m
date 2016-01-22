//
//  DownloadListViewController.m
//  Demo
//
//  Created by LiuYongfeng on 16/1/22.
//  Copyright © 2016年 LiuYongfeng. All rights reserved.
//

#import "DownloadListViewController.h"

@interface DownloadListViewController ()

@end

@implementation DownloadListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"下载列表";
    
    self.tableView.tableFooterView = [UIView new];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *idenfitier = @"CellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idenfitier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenfitier];
    }
    cell.textLabel.text = @"1111";
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
