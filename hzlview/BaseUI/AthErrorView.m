//
//  AthErrorView.m
//  Athena_iOS
//
//  Created by 郝忠良 on 2018/1/16.
//  Copyright © 2018年 haozhongliang. All rights reserved.
//

#import "AthErrorView.h"
#import "CourseDetailCell.h"
/*
 不同类型  不同图片展示
 */
@implementation AthErrorView{
    
    
    AthErrorViewState _state;
    UILabel *la;
    
    NSString *_imgName;
    NSString *_title;
    UIView *_contentView;
    
    //otherSubView
    
}

+(instancetype)creatAthErrorViewWithState:(AthErrorViewState)state superView:(UIView*)superView{
    
    AthErrorView *errorView = [[AthErrorView alloc] initWithFrame:superView.bounds state:state];
    for (UIView *v in superView.subviews) {
        
        if ([v isKindOfClass:[AthErrorView class]]) {
            
            [v removeFromSuperview];
        }
    }
    
    [superView addSubview:errorView];
    
    errorView.superView = superView;
    
    return errorView;
}

+(instancetype)creatAthErrorViewWithImg:(NSString*)imgName title:(NSString*)title superView:(UIView *)superView{
    
    
    AthErrorView *errorView = [[AthErrorView alloc] initWithFrame:superView.bounds img:imgName title:title];
    
    for (UIView *v in superView.subviews) {
        
        if ([v isKindOfClass:[AthErrorView class]]) {
            
            [v removeFromSuperview];
        }
    }
    
    [superView addSubview:errorView];
    
    errorView.superView = superView;
    
    return errorView;
    
    
}


+(instancetype)creatLoadingImgSuperView:(UIView *)superView{
    

    
    AthErrorView *errorView = [[AthErrorView alloc] initLoadingWithFrame:superView.bounds];

    
    for (UIView *v in superView.subviews) {
        
        if ([v isKindOfClass:[AthErrorView class]]) {
            
            [v removeFromSuperview];
        }
    }
    
    [superView addSubview:errorView];
    
    errorView.superView = superView;
    
    return errorView;
    
}

-(instancetype)initLoadingWithFrame:(CGRect)frame{
    
    
    if (self = [super initWithFrame: frame]) {
        
        [self creatLoadingView];
        
    }
    
    return self;
    
}

-(instancetype)initWithFrame:(CGRect)frame state:(AthErrorViewState)state{
    
    if (self = [super initWithFrame: frame]) {
        
        _state = state;
        [self creatSubView];
        
        [self setUI];
         
    }
    
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame img:(NSString*)imgName title:(NSString*)title{
    
    if (self = [super initWithFrame: frame]) {
        
        _imgName = imgName;
        _title = title;
        
        [self creatSubView];
        
//        [self setUI];
        
    }
    
    return self;
}


-(void)setUI{
    
    
    switch (_state) {
        case AthErrorViewStateNoData:{
            
            la = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), 30)];
            la.text = @"找不到数据";
            la.textAlignment = NSTextAlignmentCenter;
            la.center = self.center;
            la.textColor = [UIColor blackColor];
            [self addSubview:la];
            
        }
            break;
            
        case AthErrorViewStatueNoNet:{
            
            la = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), 30)];
            la.text = @"无网络";
            la.textAlignment = NSTextAlignmentCenter;
            la.center = self.center;
            la.textColor = [UIColor blackColor];
            [self addSubview:la];
            
        }
            break;
            
        default:
            break;
    }
    
}


-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    if ([_superView isKindOfClass:[UITableView class]]) {
        
        UITableView *tabV = (UITableView*)_superView;
        
        CGFloat eHeight = CGRectGetHeight(_superView.frame) - tabV.tableHeaderView.mj_h - tabV.sectionHeaderHeight - tabV.tableFooterView.mj_h - tabV.contentInset.top;
        
        if (eHeight < (255 + 70)) {
            
            eHeight = 255 + 70;
        }
        
        self.frame = CGRectMake(0, tabV.tableHeaderView.mj_h + tabV.sectionHeaderHeight , CGRectGetWidth(_superView.frame) ,eHeight);
                
        
    }else{
        
        self.frame = CGRectMake(0, 0, CGRectGetWidth(_superView.frame), CGRectGetHeight(_superView.frame));
    }
    
    UIView *ssView = _superView.superview;
    if (ssView) {
        
        if ([ssView isKindOfClass:[CourseDetailCell class]]) {
            
            self.frame = CGRectMake(0, ((CourseDetailCell*)ssView).margY,_superView.width,_superView.height - ((CourseDetailCell*)ssView).margY);
            
            
        }
        
    }
    
    
    if (la) {
        
       la.center = CGPointMake(self.mj_w / 2, self.mj_h/2);
    }
    
    if (_contentView) {
        
        _contentView.center = CGPointMake(self.mj_w / 2, self.mj_h/2 - 70);
        
    }
   
    
}


-(void)creatSubView{
    
    
    _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 255)];
    
    UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 300,200)];
    
    imgV.image = [UIImage imageNamed:_imgName];
    imgV.contentMode = UIViewContentModeCenter;
    
    [_contentView addSubview:imgV];
    
    UILabel *titleV = [[UILabel alloc] initWithFrame:CGRectMake(0, 225, 300, 30)];
    titleV.text = _title;
    titleV.textAlignment = NSTextAlignmentCenter;
    titleV.font = [AthTool normalFontWithType:0 size:20];
    titleV.textColor = COLOR_WITH_HEX(0x999999);
    
    [_contentView addSubview:titleV];
    
    [self addSubview:_contentView];
    
}

-(void)creatLoadingView{
    
    
    _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    
    UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    
    NSMutableArray *imgs = [NSMutableArray array];
    
    for (int i = 0; i < 12; i++) {
        
        UIImage *subImg = [UIImage imageNamed:AthStrAppend(@"load_%d",i + 2)];
        [imgs addObject:subImg];
    }
    
    imgV.animationImages = imgs;
    imgV.animationDuration = 0.8;
    [imgV startAnimating];
//    imgV.image = [UIImage imageNamed:@"icon_share"];
    
    imgV.contentMode = UIViewContentModeScaleAspectFit;
    
    [_contentView addSubview:imgV];
    
    [self addSubview:_contentView];
    
    
}



@end
