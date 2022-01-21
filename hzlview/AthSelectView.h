//
//  AthSelectView.h
//  Athena_iOS
//
//  Created by 郝忠良 on 2018/1/16.
//  Copyright © 2018年 haozhongliang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AthSelectView;

@protocol AthSelectViewDelegate <NSObject>

-(void)athSelectView:(AthSelectView*)athSelectView didSelectIndex:(int)selectIndex;

@end


@interface AthSelectView : UIScrollView

@property(nonatomic,assign)float pageBtnCount;// 按钮之间的间距 ******设置了按钮会自适应大小

@property(nonatomic,assign)BOOL isNOall;//是否全屏显示

@property(nonatomic,assign)int defautSelect;

@property(nonatomic,strong)NSArray *dataSoure;
@property(nonatomic,assign)CGFloat titleSize;
@property(nonatomic,strong)UIFont *selectFont;

@property(nonatomic,weak)id<AthSelectViewDelegate> athSelectViewDelegate;

@property(nonatomic,strong)UIColor *selectColor;
@property(nonatomic,strong)UIColor *normalColor;
@property(nonatomic,strong)UIView *lineView;
@property(nonatomic,strong)UIColor *lineColor;

@property(nonatomic)CGSize btnSize;

/*添加显示的标签在按钮上
 需要设定 la 的高和宽 //tag 必须是 btnIndex + 111
 */

-(void)setShowLabel:(UILabel*)la atBtnIndex:(NSInteger)btnIndex;


@end
