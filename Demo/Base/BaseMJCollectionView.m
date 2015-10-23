//
//  BaseMJCollectionView.m
//  AppFactory
//
//  Created by LiuYongfeng on 15/4/20.
//  Copyright (c) 2015年 LiuYongfeng. All rights reserved.
//

#import "BaseMJCollectionView.h"
#import <MJRefresh.h>

@implementation BaseMJCollectionView

- (id)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        [self _initViews];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self _initViews];
}

//初始化界面
- (void)_initViews {
    self.showsVerticalScrollIndicator = NO;
}

//下拉控件
- (void)setHasRefreshHeader:(BOOL)hasRefreshHeader
{
    _hasRefreshFooter = hasRefreshHeader;
    if (hasRefreshHeader) {
        self.header = [[MJRefreshNormalHeader alloc]init];
    }
}

//上拉控件
- (void)setHasRefreshFooter:(BOOL)hasRefreshFooter
{
    _hasRefreshFooter = hasRefreshFooter;
    if (hasRefreshFooter) {
        self.footer = [[MJRefreshBackNormalFooter alloc]init];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
