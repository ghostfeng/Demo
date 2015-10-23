//
//  AppDelegate.h
//  Demo
//
//  Created by LiuYongfeng on 15/10/23.
//  Copyright (c) 2015年 LiuYongfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MMDrawerController.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(nonatomic,strong)MMDrawerController *drawerController;

/**
 *  @brief  获取当前的AppDelegate对象
 *
 *  @return 当前的AppDelegate对象
 */
+ (AppDelegate *)currentAppDelegate;

@end

