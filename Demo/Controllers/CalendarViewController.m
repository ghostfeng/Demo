//
//  CalendarViewController.m
//  Demo
//
//  Created by 刘永峰 on 16/3/24.
//  Copyright © 2016年 LiuYongfeng. All rights reserved.
//

#import "CalendarViewController.h"
#import "CalendarDayCell.h"
#import "CalendarHeaderView.h"
#import "CalendarFlowLayout.h"
#import "CalendarLogic.h"

@interface CalendarViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
/** 日历集合视图 */
@property (nonatomic, strong) UICollectionView *collectionView;
/** 日历数据 */
@property (nonatomic, strong) NSMutableArray *calendarMonthArray;
/** 选中的indexPath */
@property (nonatomic, strong) NSIndexPath *indexPath;

@end

@implementation CalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"日历";
    
    [self setUpCollectionView];
    
    [self loadCalendar];
}

- (void)setUpCollectionView
{
    [self.collectionView registerClass:[CalendarDayCell class] forCellWithReuseIdentifier:@"CalendarDayCellID"];
    [self.collectionView registerNib:[UINib nibWithNibName:@"CalendarHeaderView" bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"CalendarHeaderViewID"];
    [self.view addSubview:self.collectionView];
}

- (void)loadCalendar
{
    self.calendarMonthArray = [[CalendarLogic shareCalendarLogic]getMonthArrayFromDate:[NSDate date] beforeAfterDays:365];
}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-64) collectionViewLayout:[[CalendarFlowLayout alloc]init]];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    return _collectionView;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.calendarMonthArray.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSArray *calendarDays = self.calendarMonthArray[section];
    return calendarDays.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CalendarDayModel *model = self.calendarMonthArray[indexPath.section][indexPath.row];
    CalendarDayCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CalendarDayCellID" forIndexPath:indexPath];
    cell.model = model;
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader){
        
        CalendarHeaderView *monthHeader = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"CalendarHeaderViewID" forIndexPath:indexPath];
        monthHeader.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.8f];
        CalendarDayModel *model = self.calendarMonthArray[indexPath.section][15];
        monthHeader.dateLabel.text = [NSString stringWithFormat:@"%zd年 %zd月",model.year,model.month];
        reusableview = monthHeader;
    }
    return reusableview;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    CalendarDayModel *model = self.calendarMonthArray[indexPath.section][indexPath.row];
    [[CalendarLogic shareCalendarLogic]selectCalendarDayModel:model];
    [self.collectionView reloadData];
//    if (self.indexPath == nil) {
//        self.indexPath = indexPath;
//    }
//    if (self.indexPath != indexPath) {
//        [self.collectionView reloadItemsAtIndexPaths:@[self.indexPath,indexPath]];
//    }
//    self.indexPath = indexPath;
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
