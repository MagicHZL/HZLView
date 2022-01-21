//
//  AthSelectView.m
//  Athena_iOS
//
//  Created by 郝忠良 on 2018/1/16.
//  Copyright © 2018年 haozhongliang. All rights reserved.
//

#import "AthSelectView.h"
#import "SetModel.h"

@implementation AthSelectView

//设置数据源  初始化ui控件
-(void)setDataSoure:(NSArray *)dataSoure{
    
    _dataSoure = dataSoure;
    //
    _defautSelect = 0;
    

    if (dataSoure.count > 3) {
        //一行最多4个按钮 并且只是试用平分按钮大小
        _btnSize = CGSizeMake((CGRectGetWidth(self.frame) - 5)/4.0, 40);
            
    }else{
            
        _btnSize = CGSizeMake((CGRectGetWidth(self.frame) - (dataSoure.count + 1))/dataSoure.count, 40);
    }
    
    
   
    if (self.titleSize == 0) {
        
        self.titleSize = 16;
    }
    
    self.showsVerticalScrollIndicator = NO;
    self.showsHorizontalScrollIndicator = NO;
    self.bounces = NO;
    self.backgroundColor = [UIColor whiteColor];
    
    [self creatDefaultSubs];

}

-(void)creatDefaultSubs{
    
    if (self.dataSoure.count == 0 || !self.dataSoure) {
        ATLog(@"请设置数据源");
        return;
    }
    
    [self.lineView removeFromSuperview];
    
    for (UIButton *subs in self.subviews) {
        
        if ([subs isKindOfClass:[AthButton class]]) {
            
            [subs removeFromSuperview];
            
        }
        
    }
    
    if (self.btnSize.width == 0) {
        
        self.btnSize = CGSizeMake(50, 50);
    }
    
    CGFloat lastX = 0;
    
    for (int i = 0 ; i < self.dataSoure.count; i++) {
        
        AthButton *btn = [AthButton buttonWithType:UIButtonTypeCustom];
    
        id set = self.dataSoure[i];
         NSString *title = nil;
        if ([set isKindOfClass:[SetModel class]]) {
            
            SetModel *mSet = (SetModel*)set;
            title = mSet.value;
            
        }else if([set isKindOfClass:[NSString class]]){
            
            title = set;
        }
       
    
        btn.titleLabel.font = [AthTool normalFontWithType:0 size:self.titleSize];
        [btn setTitleColor:self.normalColor forState:UIControlStateNormal];
        [btn setTitleColor:self.selectColor forState:UIControlStateSelected];
        [btn setTitle:title forState:UIControlStateNormal];
        [btn setTitle:title forState:UIControlStateSelected];
        
        btn.backgroundColor = [UIColor clearColor];
        btn.tag = i + DTAG;
        
        if (self.pageBtnCount != 0) {
            
            CGFloat btnWidth = [AthTool widthFromStr:title font:[AthTool normalFontWithType:1 size:self.titleSize]];
            
            if (btnWidth < 1) {
                
                btn.frame = CGRectMake( lastX + 1 , 3, 0 , _btnSize.height);
                
            }else{
                
                btn.frame = CGRectMake( lastX + 1 , 3, btnWidth + self.pageBtnCount , _btnSize.height);
            }
            
            
            
        }else{
            
            btn.frame = CGRectMake(i * (_btnSize.width + 1) + 1, 3, _btnSize.width, _btnSize.height);
        }
       
        
        [btn addTarget:self action:@selector(selectAction:) forControlEvents:UIControlEventTouchUpInside];
        if (i == 0) {
            
            btn.selected = YES;
        }
        [self addSubview:btn];
        
        lastX = CGRectGetMaxX(btn.frame);
    }
    
    self.lineView = [[UIView alloc] initWithFrame:CGRectMake(0, _btnSize.height , _btnSize.width, 1.5f)];
    self.lineView.layer.cornerRadius = 2.5 / 2;
    self.lineView.layer.masksToBounds = YES;
    self.lineView.backgroundColor = self.lineColor;
    
    self.frame = CGRectMake(CGRectGetMinX(self.frame), CGRectGetMinY(self.frame), CGRectGetWidth(self.frame) , self.btnSize.height + 5 );
    self.lineView.frame = CGRectMake((_btnSize.width - 40)/2.0, _btnSize.height + 2 , 35, 2.5f);
    
    if (self.pageBtnCount!= 0) {
        
        self.contentSize = CGSizeMake(lastX + 1, CGRectGetHeight(self.frame));
        
        if ((lastX + 1) < CGRectGetWidth(self.frame) && !self.isNOall) {
            
            for (UIButton *subs in self.subviews) {
                
                if ([subs isKindOfClass:[AthButton class]]) {
                    
                    subs.frame = CGRectMake((subs.tag - DTAG) * (_btnSize.width + 1) + 1, 0, _btnSize.width, _btnSize.height);
                }
                
            }
            
            self.contentSize = CGSizeMake((_btnSize.width + 1) * self.dataSoure.count + 2, CGRectGetHeight(self.frame));
            
        }
        
       
        
        
    }else{
        
        self.contentSize = CGSizeMake((_btnSize.width + 1) * self.dataSoure.count + 2, CGRectGetHeight(self.frame));
    }
    
    
    [self addSubview:self.lineView];
}

//设置按钮大小 ***暂时不用
-(void)setBtnSize:(CGSize)btnSize{
    
    _btnSize = btnSize;
    
    for (UIButton *subs in self.subviews) {
        
        if ([subs isKindOfClass:[AthButton class]]) {
            
             subs.frame = CGRectMake((subs.tag - DTAG) * (_btnSize.width + 1) + 1, 0, _btnSize.width, _btnSize.height);
        }
        
    }
    
//    self.frame = CGRectMake(CGRectGetMinX(self.frame), CGRectGetMinY(self.frame), CGRectGetWidth(self.frame) , self.btnSize.height + 2);
    
    self.contentSize = CGSizeMake((_btnSize.width + 1) * self.dataSoure.count + 2, CGRectGetHeight(self.frame));
    
    self.lineView.frame = CGRectMake((_btnSize.width - 20)/2.0, _btnSize.height + 2 , 40, 2.5f);
    
}

//设置普通状态按钮颜色

-(void)setNormalColor:(UIColor *)normalColor{
    
    _normalColor = normalColor;
    for (UIButton *subs in self.subviews) {
        
        if ([subs isKindOfClass:[AthButton class]]) {
            
            [subs setTitleColor:normalColor forState:UIControlStateNormal];
        }
    }
    
}

//设置点击状态颜色

-(void)setSelectColor:(UIColor *)selectColor{
    
    _selectColor = selectColor;
    
    for (UIButton *subs in self.subviews) {
        
        if ([subs isKindOfClass:[AthButton class]]) {
            
            [subs setTitleColor:selectColor forState:UIControlStateSelected];
        }
    }
    
    
}


-(void)setLineColor:(UIColor *)lineColor{
    
    _lineColor = lineColor;
    
    self.lineView.backgroundColor = _lineColor;
    
}
//设置默认的点击按钮

-(void)setDefautSelect:(int)defautSelect{
    
    _defautSelect = defautSelect;
    
    if (_defautSelect < 0 || _defautSelect > _dataSoure.count - 1) {
        _defautSelect = 0;
        return;
    }
    for (UIButton *subs in self.subviews) {
        
        if ([subs isKindOfClass:[AthButton class]]) {
            
            if (subs.tag == defautSelect + DTAG) {
                
                CGFloat goX = _defautSelect * (_btnSize.width + 1) + 1 ;
                [self jumpBtnScroll:goX btn:subs];
                subs.selected = YES;
                if (self.selectFont) {
                    subs.titleLabel.font = self.selectFont;
                }
                
            }else{
                
                subs.selected = NO;
                subs.titleLabel.font = [AthTool normalFontWithType:0 size:self.titleSize];
            }
        }
    }
    
}

//点击事件

-(void)selectAction:(UIButton*)subBtn{

    //ui
    
    if(_defautSelect == (int)subBtn.tag - DTAG){
        
        //相同按键是否切换
        
        return;
    }
    
    subBtn.selected = YES;
    
    UIButton *selectBtn = [self viewWithTag:self.defautSelect + DTAG];
    
    selectBtn.selected = NO;
    
    if (self.selectFont) {
        
        subBtn.titleLabel.font = self.selectFont;
        selectBtn.titleLabel.font = [AthTool normalFontWithType:0 size:self.titleSize];
    }
    
    _defautSelect = (int)subBtn.tag - DTAG;
    
    CGFloat goX = _defautSelect * (_btnSize.width + 1) + 1 ;

    [self jumpBtnScroll:goX btn:subBtn];
//    [UIView animateWithDuration:.35 animations:^{
//        
//        self.lineView.center = CGPointMake(subBtn.center.x , self.lineView.center.y);
//        
//    }];
    //logic
    
    if (!subBtn.titleLabel.text.isSafe) {
        
        return;
    }
    
    if ([self.athSelectViewDelegate respondsToSelector:@selector(athSelectView:didSelectIndex:)]) {
        
        [self.athSelectViewDelegate athSelectView:self didSelectIndex:_defautSelect];
        
    }
    
}


-(void)jumpBtnScroll:(CGFloat)goX btn:(UIButton*)btn{
    
    
    if (self.pageBtnCount == 0) {
        
        if (self.dataSoure.count < 5) {
            
            [UIView animateWithDuration:.35 animations:^{
                
                self.lineView.center = CGPointMake(btn.center.x , self.lineView.center.y);
                
            }];
            
            return;
        }
        
    }
    
//    int xNor = 3;
    
    if (self.pageBtnCount != 0) {
        
        if (self.contentSize.width < self.width) {
            
            [UIView animateWithDuration:.35 animations:^{
                
                self.lineView.center = CGPointMake(btn.center.x , self.lineView.center.y);
                
            }];
            
            return;
        }
        
        CGFloat goCenter = btn.x - self.width / 2 + btn.width / 2;
        
        if (goCenter > 0 && goCenter < self.contentSize.width - self.width) {
            
            [UIView animateWithDuration:.35 animations:^{
                
                [self setContentOffset:CGPointMake(goCenter, 0)];
                self.lineView.center = CGPointMake(btn.center.x , self.lineView.center.y);
                
            }];
            
        }else{
            
            [UIView animateWithDuration:.35 animations:^{
                
                if(goCenter < 0 || goCenter == 0) {
                    
                    [self setContentOffset:CGPointMake(0, 0)];
                    
                }else if(goCenter > (self.contentSize.width - self.width) || goCenter == (self.contentSize.width - self.width)){
                    
                    [self setContentOffset:CGPointMake(self.contentSize.width - self.width, 0)];
                };
                
                self.lineView.center = CGPointMake(btn.center.x , self.lineView.center.y);
                
            }];
            
        }
        
        return;
        
    }
    
    
    if (goX > (_btnSize.width + 1 + 1) && goX < (self.contentSize.width - ( 3 * _btnSize.width + 4))) {
        
        [UIView animateWithDuration:.35 animations:^{
            
            [self setContentOffset:CGPointMake(goX - (_btnSize.width + 1 + 1), 0)];
            self.lineView.center = CGPointMake(btn.center.x , self.lineView.center.y);
            
        }];
        
    }else{
        
        [UIView animateWithDuration:.35 animations:^{
            if(goX < (_btnSize.width + 1 + 3)) {
                [self setContentOffset:CGPointMake(0, 0)];
            }else if(goX > (self.contentSize.width - ( 3 * _btnSize.width + 5))){
                [self setContentOffset:CGPointMake(self.contentSize.width - ( 4 * _btnSize.width + 5), 0)];
            };
            self.lineView.center = CGPointMake(btn.center.x , self.lineView.center.y);
            
        }];
        
    }
    
    
}

-(void)setShowLabel:(UILabel *)la atBtnIndex:(NSInteger)btnIndex{
    
    la.tag = btnIndex + 111;
    
    for (UIButton *subs in self.subviews) {
           
           if ([subs isKindOfClass:[AthButton class]]) {
               
               if (subs.tag == btnIndex + DTAG) {
                   
                   UIView *sub111 = [subs viewWithTag: 111 + btnIndex];
                   if (sub111) {
                       
                       [sub111 removeFromSuperview];
                   }
                   
                   if (la) {
                       
                       if (CGRectGetMaxX(subs.titleLabel.frame)) {
                           
                           la.frame = CGRectMake(CGRectGetMaxX(subs.titleLabel.frame), 0, la.width, la.height);
                       }else{
                           
                           CGFloat titleWidth = [AthTool widthFromStr:subs.currentTitle font:subs.titleLabel.font];
                           
                           la.frame = CGRectMake(titleWidth + (subs.width - titleWidth ) /2, 0, la.width, la.height);
                           
                       }
                                    
                       [subs addSubview:la];
                       
                   }
                
                   
               }
               
           }
       }
    
    
    
    
}


@end
