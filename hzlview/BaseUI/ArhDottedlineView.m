//
//  ArhDottedlineView.m
//  Athena_iOS
//
//  Created by 郝忠良 on 2019/2/27.
//  Copyright © 2019年 haozhongliang. All rights reserved.
//

#import "ArhDottedlineView.h"

@implementation ArhDottedlineView

- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    //设置虚线颜色
    CGContextSetRGBStrokeColor(currentContext, ColorValue(238), ColorValue(238), ColorValue(238), 1);
    //设置虚线宽度
    CGContextSetLineWidth(currentContext, 1);
    //设置虚线绘制起点
    CGContextMoveToPoint(currentContext,0,1);
    //设置虚线绘制终点
    CGContextAddLineToPoint(currentContext,rect.size.width ,1);
    //设置虚线排列的宽度间隔:下面的arr中的数字表示先绘制3个点再绘制1个点
    CGFloat arr[] = {4,2};
    //下面最后一个参数“2”代表排列的个数。
    CGContextSetLineDash(currentContext, 0, arr, 2);
    CGContextDrawPath(currentContext, kCGPathStroke);
    
}


@end
