//
//  TopScrollView.h
//  Demo
//
//  Created by 刘永峰 on 16/3/21.
//  Copyright © 2016年 LiuYongfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopScrollView : UIScrollView

/** 点击栏目回调的block */
@property (nonatomic,copy) void(^listItemClickBlock)(NSString *itemName , NSInteger itemIndex);
/** 栏目名称数据源 */
@property (nonatomic,strong) NSMutableArray *dataList;
/** 点击对应索引的按钮的触发事件 */
-(void)itemClickWithIndex:(NSInteger)index;

@end
