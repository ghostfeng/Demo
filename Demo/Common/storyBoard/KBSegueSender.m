//
//  KBSegueSender.m
//  WisdomPay
//
//  Created by 唐何 on 16/3/15.
//  Copyright © 2016年 tanghe. All rights reserved.
//

#import "KBSegueSender.h"

@implementation KBSegueSender

- (id)initWithSend:(id)sender prepareBlock:(PrepareBlock) block {
    self = [super init];
    
    if (self) {
        self.sender =sender;
        self.prepareBlock = block;
    }
    
    return self;
    
}

@end
