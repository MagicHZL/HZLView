//
//  AthAlert.m
//  Athena_iOS
//
//  Created by 郝忠良 on 2018/1/23.
//  Copyright © 2018年 haozhongliang. All rights reserved.
//

#import "AthAlert.h"
#import "AthBgView.h"
#import "AthHintView.h"
#import <UIKit/UIKit.h>
#import <SDWebImage/UIButton+WebCache.h>
#import "NotifbottomView.h"

@implementation AthAlert

+(void)alertWithTitle:(NSString*)title message:(NSString*)mesg vc:(id)vc str:(NSArray *)str, ...{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:mesg preferredStyle:UIAlertControllerStyleAlert];
    
    if (vc == nil) {
        
        vc = [UIApplication sharedApplication].keyWindow.rootViewController
        ;
    }
    
    va_list list;
    
    va_start(list, str);

    for (int i = 0; i <str.count ; i++) {
        
        UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:str[i] style:UIAlertActionStyleDefault handler:va_arg(list, id)];
            
        [alert addAction:cancleAction];

    }
    
    va_end(list);
    
    [vc newpresentViewController:alert animated:YES completion:nil];
    
}


+(void)alertDelRemind:(void(^)(void))del{
    
    
    [self alertWithTitle:@"是否删除" message:nil vc:[UIApplication sharedApplication].keyWindow.rootViewController str:@[@"否",@"是"],nil,^(UIAlertAction * _Nonnull action) {
        
       
        if (del) {
            
            del(); 
        }
        
    }];
    
    
}


+(void)alertDelRemind:(void(^)(void))del withTitle:(NSString*)title{
    
    
    [self alertWithTitle:title message:nil vc:[UIApplication sharedApplication].keyWindow.rootViewController str:@[@"否",@"是"],nil,^(UIAlertAction * _Nonnull action) {
        
        
        if (del) {
            
            del();
        }
        
    }];
    
    
}

+(void)showError:(NSString*)str{
    
    if (str.isSafe) {
        
        [SVProgressHUD showErrorWithStatus:str];
        [SVProgressHUD dismissWithDelay:1.5];
    }
 
    
}

+(void)showSuccess:(NSString*)str{
    
    [SVProgressHUD showSuccessWithStatus:str];
    [SVProgressHUD dismissWithDelay:1];
    
}

/***自定义提示视图****/

+(void)showAthSucess:(NSString*)str dissmiss:(float)miss{
    
    [self showAthSucess:str withBtn:nil target:nil action:nil dissmiss:miss completion:nil];
    
}

+(void)showAthSucess:(NSString*)str withBtn:(NSString*)btnStr target:(id)t action:(SEL)sel dissmiss:(float)miss completion:(void(^)(void))dissmiss{
    
    [self showCustom:@"successImg" mes:str withBtn:btnStr target:t action:sel dissmiss:miss completion:dissmiss];
    
}

+(void)showAthError:(NSString*)str dissmiss:(float)miss{
    
    
    
}

+(void)showCustom:(NSString*)img mes:(NSString*)str withBtn:(NSString*)btnStr target:(id)t action:(SEL)sel dissmiss:(float)miss completion:(void(^)(void))dissmiss {
    
    
    AthBgView *bgView = [AthBgView bgView:CGRectMake(0, 0, kWidth, kHeight)];
    [bgView setDissmiss:dissmiss];
    
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 165)];
    
    contentView.backgroundColor = [UIColor whiteColor];
    contentView.center = bgView.center;
    
    AthHintView *hintView = [[[NSBundle mainBundle] loadNibNamed:@"AthHintView" owner:self options:nil ] lastObject];
    
    hintView.frame = contentView.bounds;
    //配置huntView
    hintView.title.text = str;
    [hintView.actionBtn setTitle:btnStr forState:UIControlStateNormal];
    
    if (btnStr == nil) {
        
        hintView.actionBtn.hidden = YES;
        contentView.mj_h = 115;
        
    }else{
        
        hintView.actionBtn.hidden = NO;
        contentView.mj_h = 165;
        [hintView addTarget:t selectAction:sel];
        
    }
    hintView.statusImgh.image = [UIImage imageNamed:img];
    
    contentView.layer.cornerRadius = 8;
    contentView.layer.masksToBounds = YES;
    [contentView addSubview:hintView];
    
    [bgView addSubview:contentView];
    
    if (miss!= 0 ) {
        
        [self performSelector:@selector(dismiss:) withObject:hintView.actionBtn afterDelay:miss];
        
    }
    bgView.alpha = 0;
    
    [[UIApplication sharedApplication].keyWindow addSubview:bgView];
    
    [UIView animateWithDuration:.35 animations:^{
       
        bgView.alpha = 1;
    }];
}


+(void)dismiss:(UIButton*)btn{
    
    [UIView animateWithDuration:.35 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        
        btn.superview.superview.superview.alpha = 0;
        
    } completion:^(BOOL finished) {
        
        [btn.superview.superview.superview removeFromSuperview];
        
    }];
    
    
}

+(void)showWithBanner:(BannerModel*)model target:(id)t action:(SEL)sel{
    
//先加载图片避免没有图片显示
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    
    [manager loadImageWithURL:[NSURL URLWithString:model.banner_img] options:0 progress:nil completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, SDImageCacheType cacheType, BOOL finished, NSURL * _Nullable imageURL) {
        
        if (error) {
            
            return ;
        }
        
        AthBgView *bgView = [AthBgView bgView:CGRectMake(0, 0, kWidth, kHeight)];
        bgView.alpha = 0;
        UIButton *imgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        imgBtn.frame = CGRectMake(0, 0, kWidth * 0.75 , kWidth * 0.75 * 9 / 7 );
        imgBtn.center = CGPointMake(kWidth/2, kHeight/2);
        [imgBtn setBackgroundImage:image forState:UIControlStateNormal];
        [imgBtn setBackgroundImage:image forState:UIControlStateHighlighted];
        [imgBtn addTarget:t action:sel forControlEvents:UIControlEventTouchUpInside];
        [bgView addSubview:imgBtn];
        [[UIApplication sharedApplication].keyWindow addSubview:bgView];
        
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(imgBtn.frame) - 37, CGRectGetMinY(imgBtn.frame) - 27 * 50 / 30, 27 ,27 * 50 / 30)];
    
        imgView.image = [UIImage imageNamed:@"delete"];
        
        [bgView addSubview:imgView];
        
        [UIView animateWithDuration:.35 animations:^{
            
            bgView.alpha = 1;
            
        }];
        
        
    }];
   
}


+(void)showNotification:(NSDictionary*)info dismiss:(NSInteger)time{
    
    
    UIView *bottomBox = [[UIView alloc] initWithFrame:CGRectMake(20, kHeight, kWidth - 40  , 129)];
    
    bottomBox.layer.cornerRadius = 7;
//    bottomBox.layer.masksToBounds = YES;
    bottomBox.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    bottomBox.layer.shadowOpacity = .4;
    bottomBox.layer.shadowRadius = 4;
    
//    bottomBox.layer.shan
    
    NotifbottomView *bottomView = [[[NSBundle mainBundle] loadNibNamed:@"NotifbottomView" owner:self options:nil] lastObject];
    bottomView.layer.cornerRadius = 7;
    bottomView.layer.masksToBounds = YES;
    bottomView.title.text = AthStrAppend(@"【%@】",info[@"title"]);
    bottomView.body.text = info[@"body"];
    
    bottomBox.height =  [AthTool heightFromStr:info[@"body"] width:bottomBox.width - 40 attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]}] + 58;
    
    bottomView.frame = bottomBox.bounds;
    
    [bottomBox addSubview:bottomView];
    
    [[UIApplication sharedApplication].keyWindow addSubview:bottomBox];
    
    [UIView animateWithDuration:.35 animations:^{
       
        bottomBox.transform = CGAffineTransformMakeTranslation(0, -49 - bottomBox.height - 20);
        
    }];
    kWeakSelf(bottomBox);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [UIView animateWithDuration:.35 animations:^{
            
            weakbottomBox.alpha = 0;
            
        } completion:^(BOOL finished) {
            
            [weakbottomBox removeFromSuperview];
            
        }];
        
    });
    
    
}


@end
