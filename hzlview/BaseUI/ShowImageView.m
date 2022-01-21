//
//  ShowImageView.m
//  Athena_iOS
//
//  Created by 郝忠良 on 2018/4/28.
//  Copyright © 2018年 haozhongliang. All rights reserved.
//

#import "ShowImageView.h"
#import "DissMissImgView.h"
//#import "ZoomView.h"
#import "ShowBigimgController.h"
#import "AthRotateNavgController.h"

@implementation ShowImageView


-(instancetype)initWithFrame:(CGRect)frame{
    
    
    if(self = [super initWithFrame:frame]){
        
        self.userInteractionEnabled = YES;
        self.backgroundColor = [UIColor colorWithWhite:.98 alpha:1];
        self.contentMode = UIViewContentModeScaleAspectFit;
        
        UITapGestureRecognizer *tap =  [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showBig)];
        
        [self addGestureRecognizer:tap];
        
    }
    
    return self;
    
}

-(void)showBig{
    
    if (self.image) {
        
        //        ZoomView *bigImg = [[ZoomView alloc] initWithFrame:CGRectMake(0, 20, kWidth, kHeight)];
        //
        //        bigImg.contImgV.image = self.image;
        //        //    bigImg.contentMode = UIViewContentModeScaleAspectFit;
        //        bigImg.backgroundColor = [UIColor blackColor];
        //
        //        [[UIApplication sharedApplication].keyWindow addSubview:bigImg];
        
        
        ShowBigimgController *showVC = [[ShowBigimgController alloc] init];
        
        showVC.showImg = self.image;
        
        AthRotateNavgController *rotNavg = [[AthRotateNavgController alloc] initWithRootViewController:showVC];
        
        rotNavg.modalPresentationStyle = UIModalPresentationFullScreen;
        
        [[UIApplication sharedApplication].keyWindow.rootViewController newpresentViewController:rotNavg animated:NO completion:nil];
        
        
        
    }
    
}


@end
