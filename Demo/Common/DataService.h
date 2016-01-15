//
//  DataService.h
//  Demo
//
//  Created by LiuYongfeng on 15/10/26.
//  Copyright (c) 2015年 LiuYongfeng. All rights reserved.
//

#import "AFHTTPSessionManager.h"
#import <Reachability.h>

static NSString *const httpMethod_POST = @"POST";
static NSString *const httpMethod_GET  = @"GET";

typedef NS_ENUM(NSInteger,HttpMethodType) {
    GET = 1,
    POST = 2
};

@interface DataService : AFHTTPSessionManager

@property(nonatomic,strong)Reachability *reachability;

/**
 *  @brief  单例对象
 *
 *  @return 单例对象
 */
+ (DataService *)shareDataService;

/** 网络请求 */
- (NSURLSessionDataTask *)requestWithURLString:(NSString *)URLString
                                    parameters:(id)parameters
                                    httpMethod:(HttpMethodType)httpMethod
                                         block:(void (^)(id responseObject,NSError *error))block;

- (NSURLSessionDataTask *)requestWithURLString:(NSString *)URLString
                                    parameters:(id)parameters
                                    httpMethod:(NSString *)httpMethod
                                       timeOut:(NSTimeInterval)time
                                       success:(void (^)(id responseObject))success
                                       failure:(void (^)(NSError *error))failure
                               noNetConnection:(void (^)())noNetConnection;

/**
 *  @brief  是否有网络连接
 *
 *  @return 结果
 */
+ (BOOL)isConnectionAvailable;
@end
