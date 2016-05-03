//
//  KBCrossStoryBoardPushSegue.m
//  WisdomPay
//
//  Created by 唐何 on 16/3/15.
//  Copyright © 2016年 tanghe. All rights reserved.
//

#import "KBCrossStoryBoardPushSegue.h"

@implementation KBCrossStoryBoardPushSegue

- (id)initWithIdentifier:(NSString *)identifier source:(UIViewController *)source destination:(UIViewController *)destination {
    
    NSArray *idArray =[identifier componentsSeparatedByString:@":"];
    if( idArray.count ==3 ){
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName: [idArray objectAtIndex:1] bundle:nil];
        destination = [storyboard instantiateViewControllerWithIdentifier:[idArray objectAtIndex:2]];
    }
    
    if(self = [super initWithIdentifier:identifier source:source destination:destination])
    {
        
    }
    return self;
}

- (void)perform {
    
    UIViewController *src = (UIViewController *) self.sourceViewController;
    UIViewController *dst = (UIViewController *) self.destinationViewController;
    [src.navigationController pushViewController:dst animated:YES];
}


@end
