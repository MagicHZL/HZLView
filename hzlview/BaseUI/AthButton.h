//
//  AthButton.h
//  Athena_iOS
//
//  Created by 郝忠良 on 2018/1/16.
//  Copyright © 2018年 haozhongliang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AthButton : UIButton

@property(nonatomic,assign)NSInteger customTag;

@property (nonatomic, assign) IBInspectable CGFloat connerRadius;
@property (nonatomic, assign) IBInspectable CGFloat borderWidth;
@property (nonatomic, assign) IBInspectable UIColor *borderColor;

@end
