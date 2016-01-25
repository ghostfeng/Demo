//
//  Common.m
//  ModelOne
//
//  Created by LiuYongfeng on 15/9/8.
//  Copyright (c) 2015年 LiuYongfeng. All rights reserved.
//

#import "Common.h"

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