//
//  KBCrossStoryBoardModalSegue.m
//  WisdomPay
//
//  Created by 唐何 on 16/3/15.
//  Copyright © 2016年 tanghe. All rights reserved.
//

#import "KBCrossStoryBoardModalSegue.h"

@implementation KBCrossStoryBoardModalSegue

- (id)initWithIdentifier:(NSString *)identifier source:(UIViewController *)source destination:(UIViewController *)destination {
    
    NSArray *idArray =[identifier componentsSeparatedByString:@":"];
    if( idArray.count ==3 ){
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName: [idArray objectAtIndex:1] bundle:nil];
        _customDest = [storyboard instantiateViewControllerWithIdentifier:[idArray objectAtIndex:2]];
    }else if( idArray.count ==2 ){
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName: [idArray objectAtIndex:1] bundle:nil];
        _customDest = [storyboard instantiateInitialViewController];
    }
    //    NSLog(@" dist:%d  cutoms:%d" ,[ destination retainCount] , [_customDest retainCount] );
    
    if(self = [super initWithIdentifier:identifier source:source destination:destination])
    {
        
    }
    //TODO Chang seems like right?
    return self;
}

- (UIViewController*)destinationViewController {
    return _customDest;
}

- (void)perform {
    UIViewController * coll =(UIViewController*)self.sourceViewController;
    coll.modalPresentationStyle =UIModalPresentationFullScreen;
    
    // self.destinationViewController.modalTransitionStyle = UIModalTransitionStylePartialCurl;
    
    self.destinationViewController.modalPresentationStyle =UIModalPresentationFullScreen;
    [coll presentViewController:self.destinationViewController animated:YES completion:nil];
    
}


@end
