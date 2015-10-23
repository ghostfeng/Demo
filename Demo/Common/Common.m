//
//  Common.m
//  ModelOne
//
//  Created by LiuYongfeng on 15/9/8.
//  Copyright (c) 2015年 LiuYongfeng. All rights reserved.
//

#import "Common.h"
/**
 *  @brief  通过storyBoard名称和storyBoardID获取控制器
 *
 *  @param storyboardName storyboardName
 *  @param storyboardID   storyboardID
 *
 *  @return 控制器
 */
id GetControllerFromStoryBoard(NSString *storyboardName , NSString *storyboardID) {
    return [[UIStoryboard storyboardWithName:storyboardName bundle:[NSBundle mainBundle]]instantiateViewControllerWithIdentifier:storyboardID];
}
