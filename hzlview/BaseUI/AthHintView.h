//
//  AthHintView.h
//  Athena_iOS
//
//  Created by 郝忠良 on 2018/3/9.
//  Copyright © 2018年 haozhongliang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AthHintView : UIView


@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UIImageView *statusImgh;

@property (weak, nonatomic) IBOutlet AthButton *actionBtn;

-(void)addTarget:(id)owner selectAction:(SEL)action;

@end
