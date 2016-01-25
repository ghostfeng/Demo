//
//  Common.m
//  ModelOne
//
//  Created by LiuYongfeng on 15/9/8.
//  Copyright (c) 2015年 LiuYongfeng. All rights reserved.
//

#import "Common.h"

#pragma mark - 接口定义


//基接口
NSString *const BASE_URL                   = @"http://www.910app.cn";     //正式
//NSString *const BASE_URL                   = @"http://test.appf.bandu.in";//测试

//登录
NSString *const login                       = @"/appAPI/login";
//第三方登录
NSString *const loginOther                  = @"/appAPI/loginOther";
//注册
NSString *const registerAction              = @"/appAPI/register";
//更改密码
NSString *const changePassword              = @"/appAPI/changePassword";
//找回密码
NSString *const forgetPassword              = @"/appAPI/forget";
//更改头像
NSString *const changeHeadImg               = @"/appAPI/changeHeadImg";
//用户状态
NSString *const userState                   = @"/appAPI/user";
//意见反馈
NSString *const feedback                    = @"/appAPI/user/feedback";
//列表总页
NSString *const listPage                    = @"/appAPI/listPage";
//某列表页
NSString *const list                        = @"/appAPI/listPage/list";
//详情页
NSString *const contentPage                 = @"/appAPI/contentPage";
//评论列表
NSString *const commentList                 = @"/appAPI/contentPage/commentList";
//评论
NSString *const commitComment               = @"/appAPI/contentPage/comment";
//赞与踩信息
NSString *const favourContent               = @"/appAPI/contentPage/favour";
//点赞或者踩
NSString *const favourDo                    = @"/appAPI/contentPage/favourDo";
//广告页
NSString *const adpicture                   = @"/appAPI/adpicture";

#pragma mark - 常量定义
/** 超时时间 */
const CGFloat kTimeoutInterval = 30.0f;

/** 标签栏的高度 */
const CGFloat kTabbarHeight = 49.0f;

/** 状态栏的高度 */
const CGFloat kStatusbarHeight = 20.0f;

/** 导航栏的高度 */
const CGFloat kNavgationbarHeight = 44.0f;


/**
 *  @brief  通过storyBoard名称和storyBoardID获取控制器
 *
 *  @param storyboardName storyboardName
 *  @param storyboardID   storyboardID
 *
 *  @return 控制器
 */
id getControllerFromStoryBoard(NSString *storyboardName , NSString *storyboardID) {
    return [[UIStoryboard storyboardWithName:storyboardName bundle:[NSBundle mainBundle]]instantiateViewControllerWithIdentifier:storyboardID];
}

/**
 *  @author 刘永峰
 *
 *  @brief 冒泡排序
 *
 *  @param a 存放整数的数组
 *  @param n 数组的元素个数
 */
void bubble_sort(int *a , int n)
{
    int i,j,temp;
    for (i = 0 ; i < n-1; i++) {
        for (j = i+1 ; j < n; j++) {
            if (a[i] > a[j]) {
//                swap(a[i], a[j]);
                temp = a[i];
                a[i] = a[j];
                a[j] = temp;
            }
        }
    }
}

void swap(int a , int b)
{
    int tmp;
    tmp = a;
    a = b;
    b = tmp;
}