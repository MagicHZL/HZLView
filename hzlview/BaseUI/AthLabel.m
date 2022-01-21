//
//  AthLabel.m
//  Athena_iOS
//
//  Created by 郝忠良 on 2018/3/15.
//  Copyright © 2018年 haozhongliang. All rights reserved.
//

#import "AthLabel.h"

IB_DESIGNABLE
@implementation AthLabel

- (void)setConnerRadius:(CGFloat)connerRadius {
    _connerRadius = connerRadius;
    self.layer.cornerRadius = _connerRadius;
    self.layer.masksToBounds = YES;
}
- (void)setBorderWidth:(CGFloat)borderWidth {
    _borderWidth = borderWidth;
    self.layer.borderWidth = _borderWidth;
}
- (void)setBorderColor:(UIColor *)borderColor {
    _borderColor = borderColor;
    self.layer.borderColor = _borderColor.CGColor;
}

@end
