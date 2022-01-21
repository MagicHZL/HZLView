//
//  AthView.h
//  Athena_iOS
//
//  Created by 郝忠良 on 2018/1/31.
//  Copyright © 2018年 haozhongliang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AthView : UIView

@property (nonatomic, assign) IBInspectable CGFloat connerRadius;
@property (nonatomic, assign) IBInspectable CGFloat borderWidth;
@property (nonatomic, assign) IBInspectable UIColor *borderColor;

//完善属性 label
+(void)preAttrLable:(UILabel*)label;

@end
