//
//  AthTimeView.m
//  Athena_iOS
//
//  Created by 郝忠良 on 2018/2/2.
//  Copyright © 2018年 haozhongliang. All rights reserved.
//

#import "AthTimeView.h"

@implementation AthTimeView{
    
    dispatch_source_t mytimer;
   
}

+(instancetype)timeAction:(NSInteger)time{
    
    
    AthTimeView *timeView = [[AthTimeView alloc] init];
    
    timeView.time = time;
    [timeView creatUI];
    [timeView creatTimer];
    
    return timeView;
    
}


-(void)creatTimer{
    
    mytimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0));
    
    kWeakSelf(self);
    dispatch_source_set_timer(mytimer, DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(mytimer, ^{
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (weakself.second) {
                
                weakself.second();
            }
            
            if (!weakself.isnoBegin) {
                
                if (self.isDown) {
                    
                    weakself.time -- ;
                    
                    if (weakself.time == 0 || weakself.time < 0) {
                        
                        if (self.endExam) {
                            
                            self.endExam();
                            [self cancelTime];
                        }
                        
                    }
                    
                }else{
                    
                    weakself.time ++ ;
                }
               
                
                [weakself.show setTitle:AthStrAppend(@"%.2ld:%.2ld",self.time/60,self.time%60) forState:UIControlStateNormal];
            }
           
           
        });
        
    });
    


}


-(void)start{
    
    dispatch_resume(mytimer);
    
}

-(void)creatUI{
    
    self.show= [[UIButton alloc] initWithFrame:CGRectMake(0, 5, 100, 30)];
    [self.show setTitle:AthStrAppend(@"%.2ld:%.2ld",self.time/60,self.time%60) forState:UIControlStateNormal];
    self.show.titleLabel.font = [AthTool normalFontWithType:0 size:16];
    
    [self.show setTitleColor:COLOR_WITH_HEX(0x333333) forState:UIControlStateNormal] ;
//    [self.show setImage:[UIImage imageNamed:@"button_time_default"] forState:UIControlStateNormal];
//    [self.show setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, -65)];
    self.show.titleLabel.font = [AthTool normalFontWithType:0 size:15];
    [self addSubview:self.show];
    self.frame = CGRectMake(0, 0, 100, 30);
    
}

-(void)refreshUI{
    
    
    if ([AthUserDefaults integerForKey:IsSun] == 0) {
        
        [self.show setTitleColor:COLOR_WITH_HEX(0x333333) forState:UIControlStateNormal];
        
    }else if([AthUserDefaults integerForKey:IsSun] == 1){
        
        [self.show setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
    }else{
        
        [self.show setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        
    }
    
    
}


-(void)setNewTime:(NSInteger)time{
    
    self.time = time;
    
}


-(void)cancelTime{
    
    if (mytimer) {
        
        dispatch_source_cancel(mytimer);
    }
    
    
}


@end
