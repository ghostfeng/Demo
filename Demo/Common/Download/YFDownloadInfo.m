//
//  YFDownloader.m
//  Demo
//
//  Created by LiuYongfeng on 16/1/26.
//  Copyright © 2016年 LiuYongfeng. All rights reserved.
//

#import "YFDownloadInfo.h"
#import "YFDownloadConst.h"

/** 下载根目录 */
static NSString *const YFDownloadRootDir = @"YFRootDir";

@interface YFDownloadInfo()<NSURLConnectionDelegate>
{
    YFDownloadState _state;
}
@end

@implementation YFDownloadInfo

- (NSString *)file
{
    if (!_file) {
        _file = [[NSString stringWithFormat:@"%@/%@", YFDownloadRootDir, self.filename] prependCaches];
    }
    
    [_file createDirectory];
    
    return _file;
}

- (NSString *)filename
{
    if (!_filename) {
        NSString *pathExtension = self.url.pathExtension;
        if (pathExtension.length) {
            _filename = [NSString stringWithFormat:@"%@.%@", self.url.MD5, pathExtension];
        } else {
            _filename = self.url.MD5;
        }
    }
    return _filename;
}

- (NSOutputStream *)stream
{
    if (_stream == nil) {
        _stream = [NSOutputStream outputStreamToFileAtPath:self.file append:YES];
    }
    return _stream;
}

- (NSInteger)totalBytesWritten
{
    return self.file.fileSize;
}

- (NSInteger)totalBytesExpectedToWrite
{
    if (!_totalBytesExpectedToWrite) {
        _totalBytesExpectedToWrite = [self.totalFileSizes[self.url] integerValue];
    }
    return _totalBytesExpectedToWrite;
}

- (YFDownloadState)state
{
    // 如果是下载完毕
    if (self.totalBytesExpectedToWrite && self.totalBytesWritten == self.totalBytesExpectedToWrite) {
        return YFDownloadStateCompleted;
    }
    
    // 如果下载失败
    if (self.task.error) return YFDownloadStateNone;
    
    return _state;
}

/**
 *  初始化任务
 */
- (void)setupTask:(NSURLSession *)session
{
    if (self.task) return;
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:self.url]];
    NSString *range = [NSString stringWithFormat:@"bytes=%zd-", self.totalBytesWritten];
    [request setValue:range forHTTPHeaderField:@"Range"];
    
    self.task = [session dataTaskWithRequest:request];
    // 设置描述
    self.task.taskDescription = self.url;
}

/**
 *  通知进度改变
 */
- (void)notifyProgressChange
{
    !self.progressChangeBlock ? : self.progressChangeBlock(self.bytesWritten, self.totalBytesWritten, self.totalBytesExpectedToWrite);
    [[NSNotificationCenter defaultCenter] postNotificationName:YFDownloadProgressDidChangeNotification
                                                        object:self
                                                      userInfo:@{YFDownloadInfoKey : self}];
}

/**
 *  通知下载完毕
 */
- (void)notifyStateChange
{
    !self.stateChangeBlock ? : self.stateChangeBlock(self.state, self.file, self.error);
    [[NSNotificationCenter defaultCenter] postNotificationName:YFDownloadStateDidChangeNotification
                                                        object:self
                                                      userInfo:@{YFDownloadInfoKey : self}];
}

#pragma mark - 状态控制
- (void)setState:(YFDownloadState)state
{
    YFDownloadState oldState = self.state;
    if (state == oldState) return;
    
    _state = state;
    
    // 发通知
    [self notifyStateChange];
}

/**
 *  取消
 */
- (void)cancel
{
    if (self.state == YFDownloadStateCompleted || self.state == YFDownloadStateNone) return;
    
    [self.task cancel];
    self.state = YFDownloadStateNone;
}

/**
 *  恢复
 */
- (void)resume
{
    if (self.state == YFDownloadStateCompleted || self.state == YFDownloadStateResumed) return;
    
    [self.task resume];
    self.state = YFDownloadStateResumed;
}

/**
 * 等待下载
 */
- (void)willResume
{
    if (self.state == YFDownloadStateCompleted || self.state == YFDownloadStateResumed) return;
    
    self.state = YFDownloadStateResumed;
}

/**
 *  暂停
 */
- (void)suspend
{
    if (self.state == YFDownloadStateCompleted || self.state == YFDownloadStateSuspened) return;
    
    if (self.state == YFDownloadStateResumed) { // 如果是正在下载
        [self.task suspend];
        self.state = YFDownloadStateSuspened;
    } else { // 如果是等待下载
        self.state = YFDownloadStateNone;
    }
}


#pragma mark - 代理方法处理
- (void)didReceiveResponse:(NSHTTPURLResponse *)response
{
    // 获得文件总长度
    if (!self.totalBytesExpectedToWrite) {
        self.totalBytesExpectedToWrite = [response.allHeaderFields[@"Content-Length"] integerValue] + self.totalBytesWritten;
        // 存储文件总长度
        _totalFileSizes[self.url] = @(self.totalBytesExpectedToWrite);
        [_totalFileSizes writeToFile:_totalFileSizesFile atomically:YES];
    }
    
    // 打开流
    [self.stream open];
    
    // 清空错误
    self.error = nil;
}

- (void)didReceiveData:(NSData *)data
{
    // 写数据
    NSInteger result = [self.stream write:data.bytes maxLength:data.length];
    
    if (result == -1) {
        self.error = self.stream.streamError;
        [self.task cancel]; // 取消请求
    }else{
        self.bytesWritten = data.length;
        [self notifyProgressChange]; // 通知进度改变
    }
}

- (void)didCompleteWithError:(NSError *)error
{
    // 关闭流
    [self.stream close];
    self.bytesWritten = 0;
    self.stream = nil;
    self.task = nil;
    
    // 错误(避免nil的error覆盖掉之前设置的self.error)
    self.error = error ? error : self.error;
    
    // 通知(如果下载完毕 或者 下载出错了)
    if (self.state == YFDownloadStateCompleted || error) {
        // 设置状态
        self.state = error ? YFDownloadStateNone : YFDownloadStateCompleted;
    }
}

@end
