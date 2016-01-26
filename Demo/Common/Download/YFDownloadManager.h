//
//  YFDownloadManager.h
//  Demo
//
//  Created by LiuYongfeng on 16/1/26.
//  Copyright © 2016年 LiuYongfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
@class YFDownloadInfo;

@interface YFDownloadManager : NSObject<NSURLSessionDataDelegate>

/** 下载管理单例对象 */
+ (YFDownloadManager *)defaultManager;

/** 下载info数组 */
@property (nonatomic, strong) NSMutableArray *downloadInfoArray;

/** session */
@property (nonatomic, strong) NSURLSession *session;

/** queue */
@property (nonatomic, strong) NSOperationQueue *queue;

/** 是否正在批量处理 */
@property (assign, nonatomic, getter=isBatching) BOOL batching;

/** 最大同时下载数 */
@property (assign, nonatomic) NSInteger maxDownloadingCount;

@end
