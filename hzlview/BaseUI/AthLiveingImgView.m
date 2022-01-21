//
//  AthLiveingImgView.m
//  Athena_iOS
//
//  Created by 郝忠良 on 2020/7/16.
//  Copyright © 2020 haozhongliang. All rights reserved.
//

#import "AthLiveingImgView.h"

@implementation AthLiveingImgView

-(void)awakeFromNib{
    
    [super awakeFromNib];
    
    self.contentMode = UIViewContentModeScaleAspectFit;
    NSMutableArray *imgs = [NSMutableArray array];
        
    for (int i = 0; i < 10; i++) {
            
        UIImage *subImg = [UIImage imageNamed:AthStrAppend(@"liveing_%d",i + 1)];
        [imgs addObject:subImg];
    }
        
    self.animationImages = imgs;
    self.animationDuration = 1;

    [self startAnimating];
    
}

@end
