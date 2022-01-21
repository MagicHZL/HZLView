//
//  ZoomView.h
//  Athena_iOS
//
//  Created by 郝忠良 on 2018/7/11.
//  Copyright © 2018年 haozhongliang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <LCActionSheet/LCActionSheet.h>

@interface ZoomView : UIView <UIScrollViewDelegate,LCActionSheetDelegate>

@property(nonatomic,strong)UIImageView *contImgV;

@property(nonatomic,copy)void(^dissmiss)(void);


@end
