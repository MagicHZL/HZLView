
//
//  ZoomView.m
//  Athena_iOS
//
//  Created by 郝忠良 on 2018/7/11.
//  Copyright © 2018年 haozhongliang. All rights reserved.
//

#import "ZoomView.h"


@implementation ZoomView{
    
    UIScrollView *scrollV;
    
}

-(instancetype)initWithFrame:(CGRect)frame{
    
    
    if (self = [super initWithFrame:frame]) {
        
        [self creatSubView];
        
    }
    
    return self;
    
}

-(void)awakeFromNib{
    
    [super awakeFromNib];
    
    [self creatSubView];
    
    
}


-(void)creatSubView{
    
    
    scrollV = [[UIScrollView alloc] initWithFrame:self.bounds];
    
    scrollV.delegate = self;
    
    scrollV.minimumZoomScale = .5;
    scrollV.maximumZoomScale = 2;
    
    scrollV.contentSize = self.bounds.size;
    
    self.contImgV = [[UIImageView alloc] initWithFrame:scrollV.bounds];
    
//    self.contImgV.backgroundColor = [UIColor whiteColor];
    self.contImgV.contentMode = UIViewContentModeScaleAspectFit;
    
    [scrollV addSubview:self.contImgV];
    
    [self addSubview:scrollV];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dissmissAction)];
    
    [self addGestureRecognizer:tap];
    
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap2Action)];
    
    tap2.numberOfTapsRequired = 2;
    
    [self addGestureRecognizer:tap2];
    
    [tap requireGestureRecognizerToFail:tap2];
    
    
    UILongPressGestureRecognizer *longpress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(saveToPhoto:)];
    
    longpress.minimumPressDuration = 1;
    [self addGestureRecognizer:longpress];
    
    
//    UIButton *dissBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//
//    [dissBtn addTarget:self action:@selector(dissmiss) forControlEvents:UIControlEventTouchUpInside];
//
//
//    dissBtn.frame = CGRectMake(20, 20, 60, 35);
//
//    dissBtn.layer.cornerRadius = 6;
//    dissBtn.layer.masksToBounds = YES;
//    dissBtn.backgroundColor = [UIColor colorWithWhite:.3 alpha:.5];
//    [dissBtn setTitle:@"返回" forState:UIControlStateNormal];
//    [dissBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    dissBtn.titleLabel.font = [UIFont systemFontOfSize:16];
//
//    [self addSubview:dissBtn];
    
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    scrollV.zoomScale  = 1;
    
    scrollV.frame = self.bounds;
    self.contImgV.frame = scrollV.bounds;
    
    
    
}


-(void)dissmissAction{
    
//    [self removeFromSuperview];
    if (self.dissmiss) {
        
        self.dissmiss();
    }
    
}

-(void)tap2Action{
    
    if (scrollV.zoomScale > 1) {
        
        scrollV.zoomScale = 1;
        
    }else{
        
        scrollV.zoomScale = 2;
    }
    
}


- (nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    
    return self.contImgV;
    
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view atScale:(CGFloat)scale{
    
    if (scale < 1) {
        view.frame = CGRectMake((scrollView.width - view.width) / 2, (scrollView.height - view.height ) / 2, view.width, view.height);
    }
    
}



-(void)saveToPhoto:(UILongPressGestureRecognizer*)longPre{
    
    
    if (longPre.state == UIGestureRecognizerStateBegan) {
        LCActionSheet *actionSheet = [LCActionSheet sheetWithTitle:@""
                                                      delegate:self
                                             cancelButtonTitle:@"取消"
                                             otherButtonTitles:@"保存至相册", nil];
        
        actionSheet.buttonFont = [UIFont systemFontOfSize:15];
        actionSheet.buttonHeight = 50.0f;
        [actionSheet show];
    }
    
}

- (void)actionSheet:(LCActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex == 1) {
        
        UIImageWriteToSavedPhotosAlbum(self.contImgV.image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    }
    
}

#pragma mark -- <保存到相册>
-(void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    
    if(error){
        [AthAlert showError:@"保存失败!"];
    }else{
        [AthAlert showSuccess:@"保存成功!"];
    }
}

@end
