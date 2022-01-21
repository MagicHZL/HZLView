//
//  AthHintView.m
//  Athena_iOS
//
//  Created by 郝忠良 on 2018/3/9.
//  Copyright © 2018年 haozhongliang. All rights reserved.
//

#import "AthHintView.h"

@implementation AthHintView

-(void)addTarget:(id)owner selectAction:(SEL)action{
    
    [self.actionBtn addTarget:owner action:action forControlEvents:UIControlEventTouchUpInside];
    
}

@end
