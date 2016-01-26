//
//  YFDownloadManager.m
//  Demo
//
//  Created by LiuYongfeng on 16/1/26.
//  Copyright © 2016年 LiuYongfeng. All rights reserved.
//

#import "YFDownloadManager.h"
#import "YFDownloadInfo.h"

static YFDownloadManager *manager = nil;

@implementation YFDownloadManager

+ (YFDownloadManager *)defaultManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[YFDownloadManager alloc]init];
    });
    return manager;
}

- (NSMutableArray *)downloadInfoArray
{
    if (!_downloadInfoArray) {
        self.downloadInfoArray = [NSMutableArray array];
    }
    return _downloadInfoArray;
}


- (NSURLSession *)session
{
    if (!_session) {
        // 配置
        NSURLSessionConfiguration *cfg = [NSURLSessionConfiguration defaultSessionConfiguration];
        // session
        self.session = [NSURLSession sessionWithConfiguration:cfg delegate:self delegateQueue:self.queue];
    }
    return _session;
}

- (NSOperationQueue *)queue
{
    if (!_queue) {
        self.queue = [[NSOperationQueue alloc] init];
        self.queue.maxConcurrentOperationCount = 1;
    }
    return _queue;
}

#pragma mark - 下载方法
- (YFDownloadInfo *)downloadWithURLString:(NSString *)URLString
                      toDestinationPath:(NSString *)destinationPath
                               progress:(YFDownloadProgressChangeBlock)progress
                                  state:(YFDownloadStateChangeBlock)state
{
    if (URLString == nil) return nil;
    
    // 下载信息
    YFDownloadInfo *info = [self downloadInfoForURL:URLString];
    
    // 设置block
    info.progressChangeBlock = progress;
    info.stateChangeBlock = state;
    
    // 设置文件路径
    if (destinationPath) {
        info.file = destinationPath;
        info.filename = [destinationPath lastPathComponent];
    }
    
    // 如果已经下载完毕
    if (info.state == YFDownloadStateCompleted) {
        // 完毕
        [info notifyStateChange];
        return info;
    } else if (info.state == YFDownloadStateResumed) {
        return info;
    }
    
    // 创建任务
    [info setupTask:self.session];
    
    // 开始任务
    [self resume:URLString];
    
    return info;
}

#pragma mark - 文件操作
/**
 * 让第一个等待下载的文件开始下载
 */
- (void)resumeFirstWillResume
{
    if (self.isBatching) return;
    
    YFDownloadInfo *willInfo = [self.downloadInfoArray filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"state==%d", YFDownloadStateWillResume]].firstObject;
    [self resume:willInfo.url];
}

- (void)cancelAll
{
    [self.downloadInfoArray enumerateObjectsUsingBlock:^(YFDownloadInfo *info, NSUInteger idx, BOOL *stop) {
        [self cancel:info.url];
    }];
}

- (void)suspendAll
{
    self.batching = YES;
    [self.downloadInfoArray enumerateObjectsUsingBlock:^(YFDownloadInfo *info, NSUInteger idx, BOOL *stop) {
        [self suspend:info.url];
    }];
    self.batching = NO;
}

- (void)resumeAll
{
    [self.downloadInfoArray enumerateObjectsUsingBlock:^(YFDownloadInfo *info, NSUInteger idx, BOOL *stop) {
        [self resume:info.url];
    }];
}

- (void)cancel:(NSString *)url
{
    if (url == nil) return;
    
    // 取消
    [[self downloadInfoForURL:url] cancel];
    
    // 这里不需要取出第一个等待下载的，因为调用cancel会触发-URLSession:task:didCompleteWithError:
//        [self resumeFirstWillResume];
}

- (void)suspend:(NSString *)url
{
    if (url == nil) return;
    
    // 暂停
    [[self downloadInfoForURL:url] suspend];
    
    // 取出第一个等待下载的
    [self resumeFirstWillResume];
}

- (void)resume:(NSString *)url
{
    if (url == nil) return;
    
    // 获得下载信息
    YFDownloadInfo *info = [self downloadInfoForURL:url];
    
    // 正在下载的
    NSArray *downloadingDownloadInfoArray = [self.downloadInfoArray filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"state==%d", YFDownloadStateResumed]];
    if (self.maxDownloadingCount && downloadingDownloadInfoArray.count == self.maxDownloadingCount) {
        // 等待下载
        [info willResume];
    } else {
        // 继续
        [info resume];
    }
}

#pragma mark - 获得下载信息
- (YFDownloadInfo *)downloadInfoForURL:(NSString *)url
{
    if (url == nil) return nil;
    
    YFDownloadInfo *info = [self.downloadInfoArray filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"url==%@", url]].firstObject;
    if (info == nil) {
        info = [[YFDownloadInfo alloc] init];
        info.url = url; // 设置url
        [self.downloadInfoArray addObject:info];
    }
    return info;
}

#pragma mark - NSURLSessionDataDelegate

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSHTTPURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler
{
    // 获得下载信息
    YFDownloadInfo *info = [self downloadInfoForURL:dataTask.taskDescription];

    // 处理响应
    [info didReceiveResponse:response];

    // 继续
    if (completionHandler) {
        completionHandler(NSURLSessionResponseAllow);
    }
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data
{
    // 获得下载信息
    YFDownloadInfo *info = [self downloadInfoForURL:dataTask.taskDescription];

    // 处理数据
    [info didReceiveData:data];
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error
{
    // 获得下载信息
    YFDownloadInfo *info = [self downloadInfoForURL:task.taskDescription];

    // 处理结束
    [info didCompleteWithError:error];
    
    // 恢复等待下载的
    [self resumeFirstWillResume];
}

@end
