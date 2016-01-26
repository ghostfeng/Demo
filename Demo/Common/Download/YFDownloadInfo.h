//
//  YFDownloader.h
//  Demo
//
//  Created by LiuYongfeng on 16/1/26.
//  Copyright © 2016年 LiuYongfeng. All rights reserved.
//

#import <Foundation/Foundation.h>


/** 下载状态 */
typedef NS_ENUM(NSInteger, YFDownloadState) {
    YFDownloadStateNone = 0,     // 闲置状态（除后面几种状态以外的其他状态）
    YFDownloadStateWillResume,   // 即将下载（等待下载）
    YFDownloadStateResumed,      // 下载中
    YFDownloadStateSuspened,     // 暂停中
    YFDownloadStateCompleted     // 已经完全下载完毕
} NS_ENUM_AVAILABLE_IOS(2_0);

/**
 *  跟踪下载进度的Block回调
 *
 *  @param bytesWritten              【这次回调】写入的数据量
 *  @param totalBytesWritten         【目前总共】写入的数据量
 *  @param totalBytesExpectedToWrite 【最终需要】写入的数据量
 */
typedef void (^YFDownloadProgressChangeBlock)(NSInteger bytesWritten, NSInteger totalBytesWritten, NSInteger totalBytesExpectedToWrite);

/**
 *  状态改变的Block回调
 *
 *  @param file 文件的下载路径
 *  @param error    失败的描述信息
 */
typedef void (^YFDownloadStateChangeBlock)(YFDownloadState state, NSString *file, NSError *error);

@interface YFDownloadInfo : NSObject

/** 存放所有的文件大小 */
@property (nonatomic, strong) NSMutableDictionary *totalFileSizes;
/** 存放所有的文件大小的文件路径 */
@property (copy, nonatomic) NSString *totalFileSizesFile;

/** 下载状态 */
@property (assign, nonatomic) YFDownloadState state;
/** 这次写入的数量 */
@property (assign, nonatomic) NSInteger bytesWritten;
/** 已下载的数量 */
@property (assign, nonatomic) NSInteger totalBytesWritten;
/** 文件的总大小 */
@property (assign, nonatomic) NSInteger totalBytesExpectedToWrite;

/** 文件名 */
@property (copy, nonatomic) NSString *filename;
/** 文件路径 */
@property (copy, nonatomic) NSString *file;
/** 文件url */
@property (copy, nonatomic) NSString *url;
/** 下载的错误信息 */
@property (strong, nonatomic) NSError *error;


/** 存放所有的进度回调 */
@property (copy, nonatomic) YFDownloadProgressChangeBlock progressChangeBlock;
/** 存放所有的完毕回调 */
@property (copy, nonatomic) YFDownloadStateChangeBlock stateChangeBlock;
/** 任务 */
@property (strong, nonatomic) NSURLSessionDataTask *task;
/** 文件流 */
@property (strong, nonatomic) NSOutputStream *stream;


/**
 *  通知进度改变
 */
- (void)notifyProgressChange;

/**
 *  通知下载完毕
 */
- (void)notifyStateChange;

/**
 *  初始化任务
 */
- (void)setupTask:(NSURLSession *)session;

/**
 *  取消
 */
- (void)cancel;

/**
 *  恢复
 */
- (void)resume;

/**
 * 等待下载
 */
- (void)willResume;
/**
 *  暂停
 */
- (void)suspend;

- (void)didReceiveResponse:(NSHTTPURLResponse *)response;

- (void)didReceiveData:(NSData *)data;

/** 下载失败 */
- (void)didCompleteWithError:(NSError *)error;

@end
