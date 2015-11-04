//
//  PortUrl.h
//  ModelOne
//
//  Created by LiuYongfeng on 15/9/8.
//  Copyright (c) 2015年 LiuYongfeng. All rights reserved.
//

#ifndef ModelOne_PortUrl_h
#define ModelOne_PortUrl_h
    
//基接口
static NSString *const BASE_URL                   = @"http://www.910app.cn";     //正式
//static NSString *const BASE_URL                   = @"http://test.appf.bandu.in";//测试

//登录
static NSString *const login                       = @"/appAPI/login";
//第三方登录
static NSString *const loginOther                  = @"/appAPI/loginOther";
//注册
static NSString *const registerAction              = @"/appAPI/register";
//更改密码
static NSString *const changePassword              = @"/appAPI/changePassword";
//找回密码
static NSString *const forgetPassword              = @"/appAPI/forget";
//更改头像
static NSString *const changeHeadImg               = @"/appAPI/changeHeadImg";
//用户状态
static NSString *const userState                   = @"/appAPI/user";
//意见反馈
static NSString *const feedback                    = @"/appAPI/user/feedback";
//列表总页
static NSString *const listPage                    = @"/appAPI/listPage";
//某列表页
static NSString *const list                        = @"/appAPI/listPage/list";
//详情页
static NSString *const contentPage                 = @"/appAPI/contentPage";
//评论列表
static NSString *const commentList                 = @"/appAPI/contentPage/commentList";
//评论
static NSString *const commitComment               = @"/appAPI/contentPage/comment";
//赞与踩信息
static NSString *const favourContent               = @"/appAPI/contentPage/favour";
//点赞或者踩
static NSString *const favourDo                    = @"/appAPI/contentPage/favourDo";
//广告页
static NSString *const adpicture                   = @"/appAPI/adpicture";

#endif
