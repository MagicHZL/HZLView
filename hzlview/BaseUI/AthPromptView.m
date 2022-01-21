//
//  AthPromptView.m
//  Athena_iOS
//
//  Created by 郝忠良 on 2019/3/18.
//  Copyright © 2019年 haozhongliang. All rights reserved.
//

#import "AthPromptView.h"
#import "AthHoleView.h"

@implementation AthPromptView


+(void)creatPromptViewInMySubCourse{
    
    NSString *promName = @"MySubCourseProm";
    if (![AthUserDefaults boolForKey:promName]) {
    
        UIView *superView = [UIApplication sharedApplication].keyWindow;
    
        AthPromptView *promptView = [[AthPromptView alloc] initWithFrame:superView.bounds];

        [promptView creatMySubCourseSubView];
        
        [superView addSubview:promptView];
        
        [AthUserDefaults setBool:YES forKey:promName];
        
    }
   
}

+(void)creatPromptViewInCourse{
    
    NSString *promName = @"MyCourseProm";
    
    if (![AthUserDefaults boolForKey:promName]) {
        
        UIView *superView = [UIApplication sharedApplication].keyWindow;
        
        AthPromptView *promptView = [[AthPromptView alloc] initWithFrame:superView.bounds];
        
        [promptView creatMyCourseSubView];
        
        [superView addSubview:promptView];
        
        [AthUserDefaults setBool:YES forKey:promName];
        
    }
    
    
}

+(void)creatPromptViewInExam{
    
    
    NSString *promName = @"ExamProm";
    
    if (![AthUserDefaults boolForKey:promName]) {
    
        UIView *superView = [UIApplication sharedApplication].keyWindow;
        
        AthPromptView *promptView = [[AthPromptView alloc] initWithFrame:superView.bounds];
        
        [promptView creatExamSubView];
        
        [superView addSubview:promptView];
        
        [AthUserDefaults setBool:YES forKey:promName];
    }
    
    
    
}

+(AthPromptView *)creatPromptViewInVideo{
    
    NSString *promName = @"VideoProm";
    AthPromptView *promptView = nil;
    
    if (![AthUserDefaults boolForKey:promName]) {
        
        UIView *superView = [UIApplication sharedApplication].keyWindow;
        
        promptView = [[AthPromptView alloc] initWithFrame:superView.bounds];
        
        [promptView creatSubView:@"cue_vedio"];
        
        [superView addSubview:promptView];
        
        [AthUserDefaults setBool:YES forKey:promName];
        
    }
    
    return promptView;
   
}

-(void)creatMyCourseSubView{
    
    UIColor *backColor = [UIColor colorWithWhite:0 alpha:.5];
    UIView *subView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SplitWidth , 55 + 64 + [AthTool marginBarStausX])];
    subView1.backgroundColor = backColor;
    
    [self addSubview:subView1];
    
    UIView *subView2 = [[UIView alloc] initWithFrame:CGRectMake(0,CGRectGetMaxY(subView1.frame) + 205, SplitWidth, kHeight)];
    
    subView2.backgroundColor = backColor;
    
    [self addSubview:subView2];
    
    UIImage *subCourseImg = [UIImage imageNamed:@"cue_course_set"];
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(SplitWidth / 2 - 220 / 2.0, subView2.y + 20, 220, 220 * subCourseImg.size.height / subCourseImg.size.width)];
    
    imgView.image = subCourseImg;
    
    [self addSubview:imgView];
    
}

-(void)creatExamSubView{
    
    CGFloat clicleWidth  = 40;
    
    UIColor *backColor = [UIColor colorWithWhite:0 alpha:.5];
    
    UIView *subView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0,SplitWidth, 24 + [AthTool marginBarStausX])];
    subView1.backgroundColor = backColor;
    
    [self addSubview:subView1];
    
    UIView *subView2 = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(subView1.frame) + clicleWidth, SplitWidth, kHeight)];
    
    subView2.backgroundColor = backColor;
    
    [self addSubview:subView2];
    
    AthHoleView *holeView1 = [[AthHoleView alloc] initWithFrame:CGRectMake(SplitWidth - clicleWidth - 26, CGRectGetMaxY(subView1.frame), clicleWidth, clicleWidth)];
    
    holeView1.backgroundColor = [UIColor clearColor];
    
    [self addSubview:holeView1];
    
    
    AthHoleView *holeView2 = [[AthHoleView alloc] initWithFrame:CGRectMake(holeView1.x - 50, CGRectGetMaxY(subView1.frame), clicleWidth, clicleWidth)];
    
    holeView2.backgroundColor = [UIColor clearColor];
    
    [self addSubview:holeView2];
    
    AthHoleView *holeView3 = [[AthHoleView alloc] initWithFrame:CGRectMake(holeView2.x - 50, CGRectGetMaxY(subView1.frame), clicleWidth, clicleWidth)];
    holeView3.backgroundColor = [UIColor clearColor];
    
    [self addSubview:holeView3];
    
    
    UIView *subView3 = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(subView1.frame), holeView3.x, clicleWidth)];
    subView3.backgroundColor = backColor;
    
    [self addSubview:subView3];
    
    UIView *subView6 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(holeView2.frame), CGRectGetMaxY(subView1.frame), CGRectGetMinX(holeView1.frame) - CGRectGetMaxX(holeView2.frame), clicleWidth)];
    
    subView6.backgroundColor = backColor;
    
    [self addSubview:subView6];
    
    UIView *subView4 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(holeView3.frame), CGRectGetMaxY(subView1.frame), CGRectGetMinX(holeView2.frame) - CGRectGetMaxX(holeView3.frame), clicleWidth)];
    
    subView4.backgroundColor  = backColor;
    
    [self addSubview:subView4];
    
    UIView *subView5 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(holeView1.frame), CGRectGetMaxY(subView1.frame), clicleWidth, clicleWidth)];
    
    subView5.backgroundColor = backColor;
    
    [self addSubview:subView5];
    
    UIImage *subCourseImg = [UIImage imageNamed:@"cue_write"];
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(SplitWidth / 2 - 220 / 2.0, subView2.y + 200, 200, 200 * subCourseImg.size.height / subCourseImg.size.width)];
    
    imgView.image = subCourseImg;
    
    [self addSubview:imgView];
    
    UILabel *lableTxt = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(holeView3.frame) - 30, subView2.y + 15, CGRectGetMaxX(holeView1.frame) - CGRectGetMinX(holeView3.frame) + 30 , 200)];
    lableTxt.font = [AthTool normalFontWithType:0 size:22];
    lableTxt.numberOfLines = 0;
    lableTxt.textColor = [UIColor whiteColor];
    lableTxt.text = @"可查看答题卡、收藏题目、重做、分享、设置页面";
    [self addSubview:lableTxt];
    
    
    
}


-(void)creatSubView:(NSString*)image{
    
    UIImage *imageData = [UIImage imageNamed:image];
    
    UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.width,self.height)];
    
    imageV.image = imageData;
    
    [self addSubview:imageV];
    
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:.3];
    
    
}

-(void)creatMySubCourseSubView{
    
    
    CGFloat maginLeft = 10;
    CGFloat cicleWidth = 44;
    
    UIColor *backColor = [UIColor colorWithWhite:0 alpha:.5];
    
    UIView *subView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SplitWidth, 20 + [AthTool marginBarStausX])];
    subView1.backgroundColor = backColor;
    UIView *subView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 20 + [AthTool marginBarStausX], SplitWidth - maginLeft - cicleWidth, kHeight - 20)];
    subView2.backgroundColor = backColor;
    
    AthHoleView *holeView = [[AthHoleView alloc] initWithFrame:CGRectMake(subView2.width, 20 + [AthTool marginBarStausX], cicleWidth, cicleWidth)];
    
    holeView.backgroundColor = [UIColor clearColor];
    
    UIView *subView3 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(holeView.frame), 20 + [AthTool marginBarStausX], maginLeft, kHeight - 20 - [AthTool marginBarStausX])];
    subView3.backgroundColor = backColor;
    
    UIView *subView4 = [[UIView alloc] initWithFrame:CGRectMake(subView2.width,CGRectGetMaxY(holeView.frame), cicleWidth , kHeight - [AthTool marginBarStausX] - 20 - cicleWidth)];
    subView4.backgroundColor = backColor;

    UIImage *subCourseImg = [UIImage imageNamed:@"cue_course_choose"];
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(SplitWidth - maginLeft - 250 - 15, CGRectGetMaxY(holeView.frame) + 10, 250, 250 * subCourseImg.size.height / subCourseImg.size.width)];
    
    imgView.image = subCourseImg;
    
    [self addSubview:subView1];
    [self addSubview:subView2];
    [self addSubview:subView3];
    [self addSubview:holeView];
    [self addSubview:subView4];

    [self addSubview:imgView];
    
    self.backgroundColor = [UIColor clearColor];
    
}


-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self removeFromSuperview];
    
}


@end
