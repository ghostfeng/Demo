//
//  YFDownloadConst.m
//  Demo
//
//  Created by LiuYongfeng on 16/1/26.
//  Copyright © 2016年 LiuYongfeng. All rights reserved.
//

#import "YFDownloadConst.h"

@implementation YFDownloadConst

/******** 通知 Begin ********/
/** 下载进度发生改变的通知 */
NSString * const YFDownloadProgressDidChangeNotification = @"YFDownloadProgressDidChangeNotification";
/** 下载状态发生改变的通知 */
NSString * const YFDownloadStateDidChangeNotification = @"YFDownloadStateDidChangeNotification";
/** 利用这个key从通知中取出对应的MJDownloadInfo对象 */
NSString * const YFDownloadInfoKey = @"YFDownloadInfoKey";
/******** 通知 End ********/

@end
