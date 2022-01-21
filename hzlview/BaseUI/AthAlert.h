//
//  AthAlert.h
//  Athena_iOS
//
//  Created by 郝忠良 on 2018/1/23.
//  Copyright © 2018年 haozhongliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BannerModel.h"

@interface AthAlert : NSObject

+(void)alertWithTitle:(NSString*)title message:(NSString*)mesg vc:(id)vc str:(NSArray*)str, ...;

+(void)showError:(NSString*)str;

+(void)showSuccess:(NSString*)str;


+(void)alertDelRemind:(void(^)(void))del;

+(void)alertDelRemind:(void(^)(void))del withTitle:(NSString*)title;



/**自定义提示视图**/
+(void)showAthSucess:(NSString*)str dissmiss:(float)miss;

+(void)showAthSucess:(NSString*)str withBtn:(NSString*)btnStr target:(id)t action:(SEL)sel dissmiss:(float)miss completion:(void(^)(void))dissmiss;

+(void)showAthError:(NSString*)str dissmiss:(float)miss;

+(void)dismiss:(UIButton*)btn;

/** 插播广告*/
+(void)showWithBanner:(BannerModel*)model target:(id)t action:(SEL)sel;


/** 显示通知消息*/
+(void)showNotification:(NSDictionary*)info dismiss:(NSInteger)time;


@end

