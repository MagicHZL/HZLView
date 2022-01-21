//
//  AthPhoneField.m
//  Athena_iOS
//
//  Created by 郝忠良 on 2019/5/15.
//  Copyright © 2019年 haozhongliang. All rights reserved.
//

#import "AthPhoneField.h"

@implementation AthPhoneField


-(void)setPhoneText:(NSString*)text{
    
    
    NSString *oldText = [[text stringByTrimmingCharactersInSet:[[NSCharacterSet decimalDigitCharacterSet] invertedSet]] stringByReplacingOccurrencesOfString:@" " withString:@""];

//    NSMutableString *phoneText =  [NSMutableString stringWithString:oldText];
 
//
//    if (phoneText.length > 3 && ![[phoneText substringWithRange:NSMakeRange(3, 1)] isEqualToString:@" "]) {
//
//        [phoneText insertString:@" " atIndex:3];
//
////        self.text = phoneText;
//    }
//
//    if (phoneText.length > 8 && ![[phoneText substringWithRange:NSMakeRange(8, 1)] isEqualToString:@" "]) {
//
//        [phoneText insertString:@" " atIndex:8];
//
////        self.text = phoneText;
//    }
    
    self.text = oldText;
    
    
}


-(NSString*)getPhoneText{
    
    return [self.text stringByReplacingOccurrencesOfString:@" " withString:@""];
    
}

@end
