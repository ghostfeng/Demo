//
//  UIViewController+YFCategory.h
//  Demo
//
//  Created by LiuYongfeng on 16/1/4.
//  Copyright © 2016年 LiuYongfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (YFCategory)

/** 网络请求的任务对象 */
@property (nonatomic, strong) NSURLSessionDataTask * task;

/** 存放网络请求的任务对象的数组 */
@property (nonatomic, strong) NSMutableArray *tasks;

/** 是否有返回按钮 */
@property (nonatomic, assign) BOOL hasBackItem;

/** 返回事件 */
- (void)backAction;
/** 设置导航栏标题 */
- (void)setNavigationTitle:(NSString *)title;

@end
