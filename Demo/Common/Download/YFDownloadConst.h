//
//  YFDownloadConst.h
//  Demo
//
//  Created by LiuYongfeng on 16/1/26.
//  Copyright © 2016年 LiuYongfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YFDownloadConst : NSObject
/******** 通知 Begin ********/
/** 下载进度发生改变的通知 */
extern NSString * const YFDownloadProgressDidChangeNotification;
/** 下载状态发生改变的通知 */
extern NSString * const YFDownloadStateDidChangeNotification;
/** 利用这个key从通知中取出对应的MJDownloadInfo对象 */
extern NSString * const YFDownloadInfoKey;
/******** 通知 End ********/
@end
