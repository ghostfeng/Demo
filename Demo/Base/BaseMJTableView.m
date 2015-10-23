//
//  BaseMJTableView.m
//  AppFactory
//
//  Created by LiuYongfeng on 15/4/20.
//  Copyright (c) 2015年 LiuYongfeng. All rights reserved.
//

#import "BaseMJTableView.h"
#import <MJRefresh.h>

@implementation BaseMJTableView

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
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

//初始化子视图
- (void)_initViews
{
    //将表视图的cell之间的分割线填充满
    if ([self respondsToSelector:@selector(setSeparatorInset:)]) {
        [self setSeparatorInset:UIEdgeInsetsZero];
    }
    
    //隐藏多余的cell分割线
    self.tableFooterView = [[UIView alloc]init];
    
    //允许tableview处于编辑状态下可点
    [self setAllowsSelectionDuringEditing:YES];
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
