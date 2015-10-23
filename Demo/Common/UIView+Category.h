//
//  UIView+Category.h
//  Demo
//
//  Created by LiuYongfeng on 15/10/23.
//  Copyright (c) 2015年 LiuYongfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Category)

/**
 *  @brief  通过响应者链获取当前视图所在的控制器
 *
 *  @return UIViewController
 */
- (UIViewController *)viewController;

@end
