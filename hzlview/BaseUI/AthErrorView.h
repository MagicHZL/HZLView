//
//  AthErrorView.h
//  Athena_iOS
//
//  Created by 郝忠良 on 2018/1/16.
//  Copyright © 2018年 haozhongliang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, AthErrorViewState) {
    AthErrorViewStatueNoNet,          //
    AthErrorViewStateNoData,           //
};


@interface AthErrorView : UIView

@property(nonatomic,strong)UIView *superView;

//获得error 视图
+(instancetype)creatAthErrorViewWithState:(AthErrorViewState)state superView:(UIView*)superView;

+(instancetype)creatAthErrorViewWithImg:(NSString*)imgName title:(NSString*)title superView:(UIView *)superView;

//获得 load 视图
+(instancetype)creatLoadingImgSuperView:(UIView *)superView;


@end
