//
//  WaterFlowViewController.m
//  Demo
//
//  Created by LiuYongfeng on 15/10/23.
//  Copyright (c) 2015年 LiuYongfeng. All rights reserved.
//

#import "WaterFlowViewController.h"
#import "WaterFallFlowLayout.h"
#import "WaterFallCell.h"

static CGFloat const kMagin = 6;

@interface WaterFlowViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)NSMutableArray *imageUrls;

@end

@implementation WaterFlowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    dispatch_async(dispatch_get_main_queue(), ^{
        [self initViews];
    });
}

- (NSMutableArray *)imageUrls {
    if (!_imageUrls) {
        _imageUrls  = [NSMutableArray arrayWithObjects:@"http://img0.bdstatic.com/img/image/shouye/leimu/mingxing.jpg",
                                      @"http://imgstatic.baidu.com/img/image/huacaozhiwu0207.jpg",
                                      @"http://d.hiphotos.baidu.com/image/w%3D400/sign=7d27c75af4246b607b0eb374dbf81a35/5882b2b7d0a20cf4f28367d674094b36acaf99ac.jpg",
                                      @"http://f.hiphotos.baidu.com/image/w%3D400/sign=657110132ff5e0feee1888016c6134e5/c83d70cf3bc79f3d6db2fb3ab8a1cd11728b296c.jpg",
                                      @"http://g.hiphotos.baidu.com/image/w%3D400/sign=4be7f3c141166d223877149476230945/e850352ac65c10384d5fbac8b0119313b07e8992.jpg",
                                      @"http://imgstatic.baidu.com/img/image/meinvbizhi0207.jpg",
                                      @"http://h.hiphotos.baidu.com/image/w%3D400/sign=880260efb68f8c54e3d3c42f0a292dee/d0c8a786c9177f3e405a5a0c72cf3bc79f3d5640.jpg",
                                      @"http://a.hiphotos.baidu.com/image/w%3D400/sign=55af4af479899e51788e3b1472a7d990/f9198618367adab42ab8824a89d4b31c8701e44b.jpg",
                                      @"http://imgstatic.baidu.com/img/image/a50f4bfbfbedab64947d23a7f536afc379311e4d.jpg", nil];
    }
    return _imageUrls;
}

- (void)initViews {
    //创建布局类
    WaterFallFlowLayout *layout = [[WaterFallFlowLayout alloc]init];
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-kStatusbarHeight-kNavgationbarHeight) collectionViewLayout:layout];
    [self.collectionView registerClass:[WaterFallCell class] forCellWithReuseIdentifier:@"WaterFallCellID"];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor=[UIColor lightGrayColor];
    [self.view addSubview:self.collectionView];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.imageUrls.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"WaterFallCellID";
    WaterFallCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"WaterFallCell" owner:self options:nil]lastObject];
    }
    cell.label.text = [NSString stringWithFormat:@"%ld",indexPath.row+1];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:self.imageUrls[indexPath.row]]];
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(kMagin,kMagin,kMagin,kMagin);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *imageUrl = self.imageUrls[indexPath.row];
    if (imageUrl) {
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]]];
        return CGSizeMake((kScreenWidth-3*kMagin)/2.0, 20 + (image.size.height*(kScreenWidth-3*kMagin)/2.0)/image.size.width);
    }
    return CGSizeMake((kScreenWidth-3*kMagin)/2.0, (kScreenWidth-3*kMagin)/2.0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return kMagin;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return kMagin;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
