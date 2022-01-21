//
//  AthImgView.m
//  Athena_iOS
//
//  Created by 郝忠良 on 2020/6/16.
//  Copyright © 2020 haozhongliang. All rights reserved.
//

#import "AthImgView.h"

IB_DESIGNABLE
@implementation AthImgView

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
