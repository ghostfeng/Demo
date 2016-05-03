//
//  KBSegueSender.h
//  WisdomPay
//
//  Created by 唐何 on 16/3/15.
//  Copyright © 2016年 tanghe. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef  void(^PrepareBlock)(UIStoryboardSegue * segue) ;

@interface KBSegueSender : NSObject

@property(assign)id  sender;
@property(assign) PrepareBlock prepareBlock;

- (id)initWithSend:(id)sender prepareBlock:(PrepareBlock) block;

@end
