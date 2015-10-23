//
//  ViewController.m
//  Demo
//
//  Created by LiuYongfeng on 15/10/23.
//  Copyright (c) 2015年 LiuYongfeng. All rights reserved.
//   

#import "ViewController.h"
#import "WaterFlowViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)NSArray *titles;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"Demo汇总";
    
    self.titles = @[@"collectionView实现瀑布流"];

    [self initViews];
}

- (void)initViews {
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"←" style:UIBarButtonItemStyleBordered target:self action:@selector(openDrawer)];
    [self hideTableViewExtraCell:self.tableView];
}

- (void)openDrawer {
    [[AppDelegate currentAppDelegate].drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *idenfitier = @"CellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idenfitier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenfitier];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.text = self.titles[indexPath.row];
    return cell;
}


#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            WaterFlowViewController *waterVC = [[WaterFlowViewController alloc]init];
            [self.navigationController pushViewController:waterVC animated:YES];
        }
            break;
        case 1:
        {

        }
            break;
        case 2:
        {

        }
            break;
        case 3:
        {
          
        }
            break;
        case 4:
        {

        }
            break;
        case 5:
        {
       
        }
            break;
        case 6:
        {

        }
            break;
        case 7:
        {
  
        }
            break;
        case 8:
        {

        }
            break;
        case 9:
        {
     
        }
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
