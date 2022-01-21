//
//  AthTableView.m
//  Athena_iOS
//
//  Created by 郝忠良 on 2018/1/15.
//  Copyright © 2018年 haozhongliang. All rights reserved.
//

#import "AthTableView.h"

@implementation AthTableView

-(instancetype)initWithFrame:(CGRect)frame registCell:(NSString *)cellClass isNib:(BOOL)isNib reuseIdentifier:(NSString *)identifier delgate:(id<UITableViewDataSource,UITableViewDelegate>)delgate{
    
    if (self = [super initWithFrame:frame style:UITableViewStylePlain]) {
        
        self.delegate = delgate;
        self.dataSource = delgate;
        if (isNib) {
           
          [self  registerNib:[UINib nibWithNibName:cellClass bundle:nil] forCellReuseIdentifier:identifier];
        }else{
            
            [self registerClass:NSClassFromString(cellClass) forCellReuseIdentifier:identifier];
        }
        
        self.tableFooterView = [UIView new];
        
    }
    
    return self;
}

-(instancetype)initWithGroupFrame:(CGRect)frame registCell:(NSString *)cellClass isNib:(BOOL)isNib reuseIdentifier:(NSString *)identifier delgate:(id<UITableViewDataSource,UITableViewDelegate>)delgate{
    
    if (self = [super initWithFrame:frame style:UITableViewStyleGrouped]) {
        
        self.delegate = delgate;
        self.dataSource = delgate;
        if (isNib) {
            
            [self  registerNib:[UINib nibWithNibName:cellClass bundle:nil] forCellReuseIdentifier:identifier];
        }else{
            
            [self registerClass:NSClassFromString(cellClass) forCellReuseIdentifier:identifier];
        }
        
        self.tableFooterView = [UIView new];
        
    }
    
    return self;
}


-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    
}

@end
