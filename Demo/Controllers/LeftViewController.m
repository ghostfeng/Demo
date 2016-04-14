//
//  LeftViewController.m
//  Demo
//
//  Created by LiuYongfeng on 15/10/23.
//  Copyright (c) 2015年 LiuYongfeng. All rights reserved.
//

#import "LeftViewController.h"
#import "YFRatingView.h"

@interface LeftViewController ()
@property (weak, nonatomic) IBOutlet YFRatingView *rateview2;

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    YFRatingView *ratingView = [[YFRatingView alloc]initWithFrame:CGRectMake(10, 100, 170, 30)];
    ratingView.backgroundColor = [UIColor greenColor];
    ratingView.score = 6.5;
    [self.view addSubview:ratingView];
    
    self.rateview2.score = 3.5;
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
