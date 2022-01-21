//
//  AthTimeView.h
//  Athena_iOS
//
//  Created by 郝忠良 on 2018/2/2.
//  Copyright © 2018年 haozhongliang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AthTimeView : UIView

@property(nonatomic,copy)void(^second)(void);//时间回调

@property(nonatomic,copy)void(^endExam)(void);//时间结束

@property(nonatomic,assign) NSInteger time;
@property(nonatomic,assign)BOOL isnoBegin;
@property(nonatomic,strong)UIButton *show;
@property(nonatomic,assign)BOOL isDown;//是否是 ++ or --

+(instancetype)timeAction:(NSInteger)time;

-(void)setNewTime:(NSInteger)time;

-(void)cancelTime;

-(void)start;

-(void)refreshUI;

@end
