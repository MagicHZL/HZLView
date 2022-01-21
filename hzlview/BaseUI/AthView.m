//
//  AthView.m
//  Athena_iOS
//
//  Created by 郝忠良 on 2018/1/31.
//  Copyright © 2018年 haozhongliang. All rights reserved.
//

#import "AthView.h"

IB_DESIGNABLE
@implementation AthView

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


+(void)preAttrLable:(UILabel*)label{
    
    label.font =[AthTool normalFontWithType:0 size:11];
    label.layer.borderColor = COLOR_WITH_HEX(0xFFCD99).CGColor;
    label.layer.borderWidth = 1;
    label.layer.cornerRadius = 2;
    label.textColor = COLOR_WITH_HEX(0xff8200);
    label.textAlignment = NSTextAlignmentCenter;
    label.width = [AthTool widthFromStr:label.text font:label.font] + 8;
    
}

@end
