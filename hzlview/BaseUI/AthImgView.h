//
//  AthImgView.h
//  Athena_iOS
//
//  Created by 郝忠良 on 2020/6/16.
//  Copyright © 2020 haozhongliang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AthImgView : UIImageView

@property (nonatomic, assign) IBInspectable CGFloat connerRadius;
@property (nonatomic, assign) IBInspectable CGFloat borderWidth;
@property (nonatomic, assign) IBInspectable UIColor *borderColor;

@end

NS_ASSUME_NONNULL_END
