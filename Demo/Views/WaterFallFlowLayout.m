//
//  WaterFallFlowLayout.m
//
//  Created by LiuYongfeng on 15/4/16.
//  Copyright (c) 2015年 LiuYongfeng. All rights reserved.
//

#import "WaterFallFlowLayout.h"

@interface WaterFallFlowLayout ()<UICollectionViewDelegateFlowLayout>
{
    NSMutableArray *colArr;
    UIEdgeInsets edgeInsets;
}
@property (nonatomic, strong) NSMutableDictionary *attributesDic ;

@end

@implementation WaterFallFlowLayout

//准备布局
- (void)prepareLayout {
    [super prepareLayout];
    
    //获取当前布局类的代理并保存
    self.flowDelegate = (id<UICollectionViewDelegateFlowLayout>)self.collectionView.delegate;
    
    NSInteger cellCount = [self.collectionView numberOfItemsInSection:0];
    if (cellCount == 0) {
        return;
    }
    
    _attributesDic = [NSMutableDictionary dictionary];
    
    //列数 此处为2列 数组中存储每列的高度
    colArr = [NSMutableArray array];
    
    float top = 0;
    for (int i=0; i < 2; i++) {
         [colArr addObject:[NSNumber numberWithFloat:top]];
    }
    
     //循环调用layoutAttributesForItemAtIndexPath方法为每个cell计算布局，将indexPath传入,做为布局字典的key
    for (int i = 0; i < cellCount; i++) {
        [self layoutForItemAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
    }
}
- (void)layoutForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    //调用协议方法得到cell间的间隙
    edgeInsets = [self.flowDelegate collectionView:self.collectionView layout:self insetForSectionAtIndex:indexPath.row];
    
    //每个item的大小
    CGSize itemSize = [self.flowDelegate collectionView:self.collectionView layout:self sizeForItemAtIndexPath:indexPath];
    
    //列数
    NSInteger col = 0;
   
    //找出高度最小的列，将cell加入最小列中
    float shortHeight = [[colArr objectAtIndex:col]floatValue];
    for (int i = 0; i < colArr.count; i++) {
        float colHeight = [[colArr objectAtIndex:i]floatValue];
        if (colHeight< shortHeight) {
            shortHeight = colHeight;
            col = i;
        }
    }
    float top = [[colArr objectAtIndex:col]floatValue];
    
    //确定每一个cell的frame
    CGRect itemFrame = CGRectMake(edgeInsets.left+col*(edgeInsets.left+itemSize.width), top+edgeInsets.top, itemSize.width, itemSize.height);
    
    //cell加入后更新列高
    [colArr replaceObjectAtIndex:col withObject:[NSNumber numberWithFloat:(top+edgeInsets.top+itemSize.height)]];
    
    //cell的indexPath对应一个frame存下来
    [_attributesDic setObject:NSStringFromCGRect(itemFrame) forKey:indexPath];
}

- (NSArray *)indexPathsOfItemsInRect:(CGRect)rect {
    //遍历布局字典通过CGRectIntersectsRect方法确定每个cell的rect与传入的rect是否有交集，如果结果为true，则此cell应该显示，将布局字典中对应的indexPath加入数组
    NSMutableArray *indexPaths = [NSMutableArray array];
    for (NSIndexPath *indexPath in _attributesDic) {
        CGRect itemFrame = CGRectFromString(_attributesDic[indexPath]);
        if (CGRectIntersectsRect(rect, itemFrame)) {
            [indexPaths addObject:indexPath];
        }
    }
    return indexPaths;
}

/*此方法会传入一个collectionView当前可见的rect,视图滑动时调用*/
//需要返回每个cell的布局信息，如果忽略传入的rect一次性将所有的cell布局信息返回，图片过多时性能会很差
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSMutableArray *attributes = [NSMutableArray array];
    //调用indexPathsOfItemsInRect方法，将rect传入，计算当前rect中应该出现的cell，返回值为cell的indexPath数组
    NSArray *indexPaths = [self indexPathsOfItemsInRect:rect];
    for (NSIndexPath *indexPath in indexPaths) {
        UICollectionViewLayoutAttributes *attribute = [self layoutAttributesForItemAtIndexPath:indexPath];
        [attributes addObject:attribute];
    }
    return attributes;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *attribute = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    CGRect itemFrame = CGRectFromString(_attributesDic[indexPath]);
    attribute.frame = itemFrame;
    return attribute;
}

//collectionView的内容高度
- (CGSize)collectionViewContentSize {
    CGSize size = self.collectionView.frame.size;
    //找出3列中最高的一列作为collectionView的高度
    float maxHeight = [[colArr objectAtIndex:0]floatValue];
    for (int i = 0; i < colArr.count; i++) {
        float colHeight = [[colArr objectAtIndex:i]floatValue];
        if (colHeight > maxHeight) {
            maxHeight = colHeight;
        }
    }
    size.height = maxHeight+edgeInsets.bottom;
    return size;
}

/*
- (NSInteger)getShortestColumnIndex {
    __block NSUInteger index = 0;
    __block CGFloat shortestHeight = 0;
    
    [colArr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop)
     {
         CGFloat height = [obj floatValue];
         if (height < shortestHeight)
         {
             shortestHeight = height;
             index = idx;
         }
     }];
    
    return index;
}

- (NSInteger)getLongestColumnIndex {
    __block NSUInteger index = 0;
    __block CGFloat longestHeight = 0;
    
    [colArr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop)
     {
         CGFloat height = [obj floatValue];
         if (height > longestHeight)
         {
             longestHeight = height;
             index = idx;
         }
     }];
    
    return index;
}
 */
@end
