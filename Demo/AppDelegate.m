//
//  AppDelegate.m
//  Demo
//
//  Created by LiuYongfeng on 15/10/23.
//  Copyright (c) 2015年 LiuYongfeng. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "LeftViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

#pragma mark - customMethod
/**
 *  @brief  获取当前的AppDelegate对象
 *
 *  @return 当前的AppDelegate对象
 */
+ (AppDelegate *)currentAppDelegate {
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

/**
 *  @brief  加载主视图
 */
- (void)loadMain {
    
    MMDrawerController *drawerController = [[MMDrawerController alloc]initWithCenterViewController:[[UINavigationController alloc]initWithRootViewController:getControllerFromStoryBoard(@"Main", @"ViewControllerID")] leftDrawerViewController:[[LeftViewController alloc]init]];
    
    //设置最大右侧侧拉宽度
    [drawerController setMaximumLeftDrawerWidth:200];
    
    //设置打开侧拉手势区域
    [drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeNone];
    
    //设置关闭侧拉的手势区域
    [drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    
    //配置管理动画的block
    [drawerController setDrawerVisualStateBlock:^(MMDrawerController *drawerController, MMDrawerSide drawerSide, CGFloat percentVisible) {
        MMDrawerControllerDrawerVisualStateBlock block;
        block = [[MMExampleDrawerVisualStateManager sharedManager]
                 drawerVisualStateBlockForDrawerSide:drawerSide];
        if(block){
            block(drawerController, drawerSide, percentVisible);
        }
    }];
    
    //设置是否有阴影边框
    drawerController.showsShadow = YES;
    drawerController.shadowRadius = 2;
    
    //存储drawerController
    self.drawerController = drawerController;
    
    self.window.rootViewController = drawerController;
}

#pragma mark - application

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    [self loadMain];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
