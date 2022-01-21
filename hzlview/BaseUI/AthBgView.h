//
//  AthBgView.h
//  Athena_iOS
//
//  Created by 郝忠良 on 2018/1/31.
//  Copyright © 2018年 haozhongliang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AthAdvertisingModel;

@interface AthBgView : UIView

@property(nonatomic,copy)void(^dissmiss)(void);
@property(nonatomic,strong)AthAdvertisingModel *advMo;

+(instancetype)bgView:(CGRect)fram;


@end
