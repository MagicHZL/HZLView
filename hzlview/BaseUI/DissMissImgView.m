//
//  DissMissImgView.m
//  Athena_iOS
//
//  Created by 郝忠良 on 2018/4/28.
//  Copyright © 2018年 haozhongliang. All rights reserved.
//

#import "DissMissImgView.h"

@implementation DissMissImgView

-(instancetype)initWithFrame:(CGRect)frame{
    
    
    if(self = [super initWithFrame:frame]){
        
        
        self.userInteractionEnabled = YES;
        
    }
    
    return self;
    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
   
    [self removeFromSuperview];
    
}

@end
