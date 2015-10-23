//
//  BaseMJCollectionView.h
//  AppFactory
//
//  Created by LiuYongfeng on 15/4/20.
//  Copyright (c) 2015年 LiuYongfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseMJCollectionView : UICollectionView

@property(nonatomic,assign)BOOL hasRefreshHeader;//是否有下拉刷新控件
@property(nonatomic,assign)BOOL hasRefreshFooter;//是否有上拉加载更多控件

@property(nonatomic,strong)NSMutableArray *dataList;//数据源

@end
