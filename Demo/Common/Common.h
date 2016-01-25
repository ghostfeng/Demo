//
//  Common.h
//  ModelOne
//
//  Created by LiuYongfeng on 15/9/8.
//  Copyright (c) 2015年 LiuYongfeng. All rights reserved.
//

#ifndef Demo_Common_h
#define Demo_Common_h

#import "AppDelegate.h"
#import "UIAlertView+YFCategory.h"
#import "NSString+YFCategory.h"
#import "NSObject+YFCategory.h"
#import "MBProgressHUD+Category.h"
#import <Foundation/Foundation.h>
#import "MMExampleDrawerVisualStateManager.h"
#import <UIImageView+WebCache.h>
#import "DataService.h"
#import "DBManager.h"
#import "PortUrl.h"
#import "Tools.h"

#ifdef DEBUG
#define NSLog(format, ...) fprintf(stderr,"[%s:%d行]\n%s\n\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:format, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(format, ...) nil
#endif


//强引用，弱引用
#define WEAK_SELF __weak __typeof(&*self)weakSelf = self;
#define STRONG_SELF __strong __typeof(&*self)strongSelf = weakSelf;

// weak strong self 定义
#define weakify( x ) \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wshadow\"") \
autoreleasepool{} __weak __typeof__(x) __weak_##x##__ = x; \
_Pragma("clang diagnostic pop")

#define strongify( x ) \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wshadow\"") \
try{} @finally{} __typeof__(x) x = __weak_##x##__; \
_Pragma("clang diagnostic pop")

#define KWeakSelf @weakify(self)
#define KStrongSelf @strongify(self)

/**
 *  @brief  通过storyBoard名称和storyBoardID获取控制器
 *
 *  @param storyboardName storyboardName
 *  @param storyboardID   storyboardID
 *
 *  @return 控制器
 */
id getControllerFromStoryBoard(NSString *storyboardName , NSString *storyboardID);
/**
 *  @author 刘永峰
 *
 *  @brief 冒泡排序
 *
 *  @param a 存放整数的数组
 *  @param n 数组的元素个数
 */
void bubble_sort(int *a , int n);
void swap(int a , int b);

/** 超时时间 */
extern const CGFloat kTimeoutInterval;

/** 标签栏的高度 */
extern const CGFloat kTabbarHeight;

/** 状态栏的高度 */
extern const CGFloat kStatusbarHeight;

/** 导航栏的高度 */
extern const CGFloat kNavgationbarHeight;

//获取NSUserDefault
#define UserDefault [NSUserDefaults standardUserDefaults]

//文件管理对象
#define FileManager [NSFileManager defaultManager]

//获取通知中心对象
#define NotificationCenter [NSNotificationCenter defaultCenter]

//设备系统版本号
#define UIDeviceSystemVersion [[UIDevice currentDevice].systemVersion floatValue]

//获取设备的物理高度
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

//获取设备的物理宽度
#define kScreenWidth [UIScreen mainScreen].bounds.size.width

//根据图片名称获取图片对象
#define IMG(imageName) [UIImage imageNamed:imageName]

//颜色
#define UIColorFromRGBHex(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define RGBA_COLOR(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#endif
