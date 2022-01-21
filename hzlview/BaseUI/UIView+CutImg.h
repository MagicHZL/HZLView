//
//  UIView+CutImg.h
//  Athena_iOS
//
//  Created by 郝忠良 on 2018/10/8.
//  Copyright © 2018年 haozhongliang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CutImg)

-(UIImage*)creatOIMg:(CGFloat)fromX height:(CGFloat)toHeight;

-(UIImage*)drawCreatOIMg:(CGFloat)fromX height:(CGFloat)toHeight;

@end
