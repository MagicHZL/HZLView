//
//  AthBgView.m
//  Athena_iOS
//
//  Created by 郝忠良 on 2018/1/31.
//  Copyright © 2018年 haozhongliang. All rights reserved.
//

#import "AthBgView.h"

@implementation AthBgView

+(instancetype)bgView:(CGRect)fram{
    
    AthBgView *view = [[AthBgView alloc] initWithFrame:fram];

    view.backgroundColor = [UIColor colorWithWhite:0 alpha:.3];
    
    return view;
        
}


-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [UIView animateWithDuration:.35 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        
        self.alpha = 0;
        
    } completion:^(BOOL finished) {
        
        if (self.dissmiss) {
            
            self.dissmiss();
        }
        
        [self removeFromSuperview];
        
    }];
    
    
}


@end
