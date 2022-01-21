//
//  AthPromptView.h
//  Athena_iOS
//
//  Created by 郝忠良 on 2019/3/18.
//  Copyright © 2019年 haozhongliang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AthPromptView : UIView

//+(void)creatViewWithSuperView:(UIView*)superView withPromptImg:(NSString*)imageName;

+(void)creatPromptViewInMySubCourse;
+(void)creatPromptViewInCourse;
+(void)creatPromptViewInExam;
+(AthPromptView *)creatPromptViewInVideo;

@end

