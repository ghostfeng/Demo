//
//  KBCrossStoryBoardModalSegue.h
//  WisdomPay
//
//  Created by 唐何 on 16/3/15.
//  Copyright © 2016年 tanghe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KBCrossStoryBoardModalSegue : UIStoryboardSegue {
    
    UIViewController *_customDest;
}

- (UIViewController *)destinationViewController;

@end
