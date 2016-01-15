//
//  MBProgressHUD+Category.h
//  Demo
//
//  Created by LiuYongfeng on 15/10/27.
//  Copyright © 2015年 LiuYongfeng. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (Category)

/**
 *  @brief  显示文本提示
 *
 *  @param text      文本提示内容
 *  @param superView 父视图
 *  @param delay     消失延时时间
 */
+ (void)showText:(NSString *)text toView:(UIView *)superView hideAfterDelay:(NSTimeInterval)delay;

/**
 *  @brief  显示文本提示
 *
 *  @param text      文本提示内容
 *  @param superView 父视图
 */
+ (void)showText:(NSString *)text toView:(UIView *)superView ;

/**
 *
 *  @brief 显示加载提示
 *
 *  @param title     文本
 *  @param superView 父视图
 *
 *  @return hud
 */
+ (MBProgressHUD *)showHUD:(NSString *)title toView:(UIView *)superView;

/**
 *  @brief  隐藏加载提示
 */
+ (void)hideHUD;

@end
