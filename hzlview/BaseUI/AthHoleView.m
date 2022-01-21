//
//  AthHoleView.m
//  Athena_iOS
//
//  Created by 郝忠良 on 2019/3/25.
//  Copyright © 2019年 haozhongliang. All rights reserved.
//

#import "AthHoleView.h"

@implementation AthHoleView


- (void)drawRect:(CGRect)rect {
 
    CGFloat width = CGRectGetWidth(self.frame);
    
    CGPoint p1 = CGPointMake(width / 2 , 0);
    
    CGPoint p2 = CGPointMake(width + 0, width / 2 + 0);
    
    CGPoint p3 = CGPointMake(width / 2 + 0,  width + 0);
    
    CGPoint p4 = CGPointMake(0, width / 2 + 0);
    
    CGPoint c1 = CGPointMake(width + 0, 0);
    CGPoint c2 = CGPointMake(width + 0,width + 0);
    CGPoint c3 = CGPointMake(0, width + 0 );
    CGPoint c4 = CGPointMake(0, 0);
    
    NSArray *starP = @[@(p1),@(p2),@(p3),@(p4)];
    NSArray *scendP = @[@(c1),@(c2),@(c3),@(c4)];
    NSArray *thirdP = @[@(p2),@(p3),@(p4),@(p1)];

    
    for (int i = 0;  i < 4;  i ++) {
        
        UIBezierPath *bezierPath = [UIBezierPath bezierPath];
        
        [bezierPath moveToPoint:[starP[i] CGPointValue]];
        
        [bezierPath addLineToPoint:[scendP[i] CGPointValue]];
        [bezierPath addLineToPoint:[thirdP[i] CGPointValue]];
        
        CGPoint cp = [scendP[i] CGPointValue];
        CGPoint newCp ;
        switch (i) {
            case 0:

                newCp = CGPointMake(cp.x - 2, cp.y + 2);

                break;
            case 1:
                newCp = CGPointMake(cp.x - 2, cp.y - 2);
                break;
            case 2:
                newCp = CGPointMake(cp.x + 2, cp.y - 2);
                break;
            case 3:
                newCp = CGPointMake(cp.x + 2, cp.y + 2);
                break;
            default:
                newCp = CGPointZero;
                break;
        }
        
        
        [bezierPath addQuadCurveToPoint:[starP[i] CGPointValue] controlPoint:newCp];
        [bezierPath closePath];
        [[UIColor colorWithWhite:0 alpha:.5] set];
        [bezierPath fill];
        
    }
    

}


@end
