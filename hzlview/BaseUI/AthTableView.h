//
//  AthTableView.h
//  Athena_iOS
//
//  Created by 郝忠良 on 2018/1/15.
//  Copyright © 2018年 haozhongliang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AthTableView : UITableView

-(instancetype)initWithFrame:(CGRect)frame registCell:(NSString*)cellClass isNib:(BOOL)isNib reuseIdentifier:(NSString*)identifier delgate:(id<UITableViewDataSource,UITableViewDelegate>)delgate;

-(instancetype)initWithGroupFrame:(CGRect)frame registCell:(NSString *)cellClass isNib:(BOOL)isNib reuseIdentifier:(NSString *)identifier delgate:(id<UITableViewDataSource,UITableViewDelegate>)delgate;

@end
