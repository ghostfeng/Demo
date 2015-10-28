//
//  DataService.m
//  Demo
//
//  Created by LiuYongfeng on 15/10/26.
//  Copyright (c) 2015年 LiuYongfeng. All rights reserved.
//

#import "DataService.h"


@implementation DataService

/**
 *  @brief  单例对象
 *
 *  @return 单例对象
 */
+ (DataService *)shareDataService {
    
    static DataService * sessionManage = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sessionManage = [[DataService alloc]initWithBaseURL:[NSURL URLWithString:BASE_URL]];
//        sessionManage.reachabilityManager = [AFNetworkReachabilityManager sharedManager];
        //设置返回数据的解析方式
        AFJSONResponseSerializer *responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingMutableContainers|NSJSONReadingAllowFragments];
        responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html" ,nil];
        sessionManage.responseSerializer = responseSerializer;
        
        sessionManage.requestSerializer = [AFHTTPRequestSerializer serializer];
        sessionManage.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];  //https时用上
        [sessionManage startNetMonitoring];
    });
    return sessionManage;
}

- (NSURLSessionDataTask *)requestWithURLString:(NSString *)URLString
                                    parameters:(id)parameters
                                    httpMethod:(NSString *)httpMethod
                                       timeOut:(NSTimeInterval)time
                                       success:(void (^)(id responseObject))success
                                       failure:(void (^)(NSError *error))failure
                              noNetConnection:(void (^)())noNetConnection
{
    if (![self.reachabilityManager isReachable]) {
        //没有网络连接
        if (noNetConnection) {
            noNetConnection();
        }
        return nil;
    }
    
    //设置超时时间
    self.requestSerializer.timeoutInterval = time;

    if ([httpMethod isEqualToString:httpMethod_GET]) {
        return [self GET:URLString parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
            if (responseObject) {
                if (success) {
                    success(responseObject);
                }
            }else{
                if (success) {
                    success(nil);
                }
            }
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            if (failure){
                failure(error);
            }
        }];
    }
    
    if ([httpMethod isEqualToString:httpMethod_POST]) {
        return [self POST:URLString parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
            if (responseObject) {
                if (success) {
                    success(responseObject);
                }
            }else{
                if (success) {
                    success(nil);
                }
            }
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            if (failure){
                failure(error);
            }
        }];
    }
    
    return nil;
}

-(void)startNetMonitoring{
    //开始监控网络
    [self.reachabilityManager startMonitoring];
    [self.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        NSString *text;
        switch (status)
        {
            case AFNetworkReachabilityStatusUnknown:
                text = @"未知网络";
                break;
            case AFNetworkReachabilityStatusNotReachable:
                text = @"亲.你的网络断开啦";
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                text = @"亲.你目前是移动网络哦.";
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                text = @"亲.已切换到WiFi网络,可以happy啦";
                break;
        }
        [MBProgressHUD showText:text toView:nil];
    }];
}

/**
 *  @brief  是否有网络连接
 *
 *  @return 结果
 */
+ (BOOL)isConnectionAvailable {
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    [manager startMonitoring];
    return [manager isReachable];
}

@end
