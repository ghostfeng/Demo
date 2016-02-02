//
//  DownloadListViewController.m
//  Demo
//
//  Created by LiuYongfeng on 16/1/22.
//  Copyright © 2016年 LiuYongfeng. All rights reserved.
//

#import "DownloadListViewController.h"
#import "FileModel.h"

@interface DownloadListViewController ()
@property (nonatomic, strong) NSArray *fileList;
@property (nonatomic, strong) NSMutableArray *fileModels;
@end

@implementation DownloadListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"下载列表";
    
    self.tableView.tableFooterView = [UIView new];
    
    self.fileModels = [FileModel mj_objectArrayWithKeyValuesArray:self.fileList];
}

- (NSMutableArray *)fileModels
{
    if (!_fileModels) {
        _fileModels = [[NSMutableArray alloc]init];
    }
    return _fileModels;
}
- (NSArray *)fileList
{
    if (!_fileList) {
        _fileList = @[@{@"url":@"http://www.910app.cn/uploads/video/14417659573752045642929987483826015.mp4",
                        @"name":@"Wonder Girls",
                        @"fileId":@"111"},
                      @{@"url":@"http://910app.cn/uploads/music/14447272758771027468068133881734916.mp3",
                        @"name":@"像梦一样自由",
                        @"fileId":@"222"},
                      @{@"url":@"http://910app.cn/uploads/music/14443740559077285247513697223883666.mp3",
                        @"name":@"音乐1",
                        @"fileId":@"333"},
                      @{@"url":@"http://910app.cn/uploads/music/14417659011026854043481871717743845.mp3",
                        @"name":@"夜曲",
                        @"fileId":@"444"}];
    }
    return _fileList;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.fileModels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FileModel *fileModel = self.fileModels[indexPath.row];
    static NSString *idenfitier = @"CellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idenfitier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenfitier];
    }
    cell.textLabel.text = fileModel.name;
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
