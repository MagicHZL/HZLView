//
//  UIView+CutImg.m
//  Athena_iOS
//
//  Created by 郝忠良 on 2018/10/8.
//  Copyright © 2018年 haozhongliang. All rights reserved.
//

#import "UIView+CutImg.h"
#import <Photos/Photos.h>

@implementation UIView (CutImg)

-(UIImage*)creatOIMg:(CGFloat)fromX height:(CGFloat)toHeight{
    
//    UIGraphicsBeginImageContext(CGSizeMake(fromX, toHeight));
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(fromX, toHeight), NO, [UIScreen mainScreen].scale);
    
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    
    NSData *imgData = UIImagePNGRepresentation(img);
    
    [imgData writeToFile:[NSString stringWithFormat:@"%@/Documents/img.jpg",NSHomeDirectory()] atomically:NO];
    
//    UIImage *newImg = [UIImage imageWithData:imgData];
    
//    [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
//
//        PHAssetChangeRequest *req = [PHAssetChangeRequest creationRequestForAssetFromImage:newImg];
//
//    } completionHandler:^(BOOL success, NSError * _Nullable error) {
//        NSLog(@"success = %d, error = %@", success, error);
//    }];
    
    UIGraphicsEndImageContext();
    
    return img;
    
//    UIImageWriteToSavedPhotosAlbum(img, nil,nil,nil);
    
}


-(UIImage*)drawCreatOIMg:(CGFloat)fromX height:(CGFloat)toHeight{
    
//    UIGraphicsBeginImageContext(CGSizeMake(fromX, toHeight));
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(fromX, toHeight), NO, [UIScreen mainScreen].scale);
    
    [self drawViewHierarchyInRect:CGRectMake(0, 0, fromX, toHeight) afterScreenUpdates:YES];
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    
    NSData *imgData = UIImagePNGRepresentation(img);
    
    [imgData writeToFile:[NSString stringWithFormat:@"%@/Documents/img.jpg",NSHomeDirectory()] atomically:NO];
    
//    UIImage *newImg = [UIImage imageWithData:imgData];
    
//    [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
//
//        PHAssetChangeRequest *req = [PHAssetChangeRequest creationRequestForAssetFromImage:newImg];
//
//    } completionHandler:^(BOOL success, NSError * _Nullable error) {
//        NSLog(@"success = %d, error = %@", success, error);
//    }];
    
    UIGraphicsEndImageContext();
    
    return img;
    
//    UIImageWriteToSavedPhotosAlbum(img, nil,nil,nil);
    
}


@end
