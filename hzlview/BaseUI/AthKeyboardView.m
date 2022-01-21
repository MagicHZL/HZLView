//
//  AthKeyboardView.m
//  Athena_iOS
//
//  Created by 郝忠良 on 2020/3/31.
//  Copyright © 2020 haozhongliang. All rights reserved.
//

#import "AthKeyboardView.h"


@implementation AthKeyboardView

-(void)awakeFromNib{
    
    [super awakeFromNib];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keybordWillChangeFrame:)name:UIKeyboardWillChangeFrameNotification object:nil];
    
    
    
}

#pragma mark -keybordWillChange

-(void)keybordWillChangeFrame:(NSNotification*)noti
{
    NSDictionary*userInfo = noti.userInfo;
    
    float duration = [[userInfo objectForKey:@"UIKeyboardAnimationDurationUserInfoKey"]floatValue];
    
    CGFloat keybordHeight = 0;
    if ([userInfo objectForKey:@"UIKeyboardBoundsUserInfoKey"]) {
        keybordHeight =[[userInfo objectForKey:@"UIKeyboardBoundsUserInfoKey"]CGRectValue].size.height;
    } else {
        keybordHeight =[[userInfo objectForKey:@"UIKeyboardFrameEndUserInfoKey"]CGRectValue].size.height;
    }
    
    CGFloat keybordEndY =0;
    
    if ([userInfo objectForKey:@"UIKeyboardFrameEndUserInfoKey"]) {
        keybordEndY = [[userInfo objectForKey:@"UIKeyboardFrameEndUserInfoKey"]CGRectValue].origin.y;
    }
    
    
    if (keybordEndY == kHeight) {
        //键盘收起
//        chatInputViewFrame.origin.y = self.view.frame.size.height;
        
        [UIView animateWithDuration:duration animations:^{
                
            self.transform = CGAffineTransformIdentity;
            
        }];
        
    } else {
        //键盘显示
//        chatInputViewFrame.origin.y = self.view.frame.size.height - keybordHeight - chatInputViewFrame.size.height;
        [UIView animateWithDuration:duration animations:^{
            
            self.transform = CGAffineTransformMakeTranslation(0, -keybordHeight + [AthTool landMarginX]);
            
        }];
        
        
    }
    

}

-(void)dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
