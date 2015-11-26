//
//  MBProgressHUD+Category.m
//  Demo
//
//  Created by LiuYongfeng on 15/10/27.
//  Copyright © 2015年 LiuYongfeng. All rights reserved.
//

#import "MBProgressHUD+Category.h"

@implementation MBProgressHUD (Category)

/**
 *  @brief  显示文本提示
 *
 *  @param text      文本提示内容
 *  @param superView 父视图
 *  @param delay     消失延时时间
 */
+ (void)showText:(NSString *)text toView:(UIView *)superView hideAfterDelay:(NSTimeInterval)delay {
    if (!superView) {
        superView = [[UIApplication sharedApplication].windows lastObject];
    }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:superView animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.minSize = CGSizeMake(100, 0);
    hud.cornerRadius = 2;
    hud.alpha = 0.8;
    hud.color = [UIColor whiteColor];
    hud.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    hud.margin = 10;
    hud.labelText = text;
    hud.labelFont = [UIFont boldSystemFontOfSize:16];
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:delay];
}

/**
 *  @brief  显示文本提示
 *
 *  @param text      文本提示内容
 *  @param superView 父视图
 */
+ (void)showText:(NSString *)text toView:(UIView *)superView {
    [self showText:text toView:superView hideAfterDelay:2];
}
@end
