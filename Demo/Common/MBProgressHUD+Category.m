//
//  MBProgressHUD+Category.m
//  Demo
//
//  Created by LiuYongfeng on 15/10/27.
//  Copyright © 2015年 LiuYongfeng. All rights reserved.
//

#import "MBProgressHUD+Category.h"

static MBProgressHUD * load_hud = nil;

@implementation MBProgressHUD (Category)

#pragma mark - 文本提示
+ (void)showText:(NSString *)text toView:(UIView *)superView hideAfterDelay:(NSTimeInterval)delay
{
    if (!superView) {
        superView = [[UIApplication sharedApplication].windows lastObject];
    }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:superView animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.minSize = CGSizeMake(100, 0);
    hud.cornerRadius = 3;
    hud.alpha = 0.9;
    hud.margin = 10;
    hud.labelText = text;
    hud.labelFont = [UIFont boldSystemFontOfSize:16];
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:delay];
}

+ (void)showText:(NSString *)text toView:(UIView *)superView
{
    [self showText:text toView:superView hideAfterDelay:2];
}

#pragma mark - 加载提示
/**
 *
 *  @brief 显示加载提示
 *
 *  @param title     文本
 *  @param superView 父视图
 *
 *  @return hud
 */
+ (MBProgressHUD *)showHUD:(NSString *)title toView:(UIView *)superView
{
    if (!superView) {
        superView = [UIApplication sharedApplication].keyWindow;
    }
    
    if (load_hud) {
        [self hideHUD];
    }
    load_hud = [MBProgressHUD showHUDAddedTo:superView animated:YES];
    load_hud.labelText = title;
    load_hud.cornerRadius = 3;
    load_hud.alpha = 0.9;
    load_hud.margin = 15;
    load_hud.minSize = CGSizeMake(90, 90);
    load_hud.color = [UIColor darkGrayColor];
    //有无灰色的遮罩视图
    load_hud.dimBackground = NO;
    return load_hud;
}

/**
 *  @brief  隐藏加载提示
 */
+ (void)hideHUD
{
    if (load_hud) {
        [load_hud hide:YES];
        load_hud = nil;
    }
}

@end
