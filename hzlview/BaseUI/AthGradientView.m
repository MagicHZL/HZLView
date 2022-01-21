//
//  AthGradientView.m
//  Athena_iOS
//
//  Created by 郝忠良 on 2020/5/13.
//  Copyright © 2020 haozhongliang. All rights reserved.
//

#import "AthGradientView.h"

@implementation AthGradientView

-(void)awakeFromNib{
    
    [super awakeFromNib];
    
    
   CAGradientLayer *gradientLayer = [CAGradientLayer layer];
     
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(0, 1);
     
     //设置颜色数组
    gradientLayer.colors = @[(__bridge id)COLOR_WITH_HEX(0xFFDDB9).CGColor,
                                   (__bridge id)COLOR_WITH_HEX(0xFFF0DF).CGColor];
     
     //设置颜色分割点（范围：0-1）
     gradientLayer.locations = @[@(0), @(1.0f)];
    
    self.gradientLayer = gradientLayer;
    
    self.gradientLayer.frame = self.layer.bounds;
    
    
    [self.layer insertSublayer:self.gradientLayer atIndex:0];
    
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    self.gradientLayer.frame = self.layer.bounds;
    
    
}




@end
