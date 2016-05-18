//
//  SectionManager.m
//  MyTel
//
//  Created by LHC on 16/4/28.
//  Copyright © 2016年 LHC. All rights reserved.
//

#import "SectionManager.h"

@implementation SectionManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        _ModelData=[[NSMutableArray alloc]init];
    }
    return self;
}
+(instancetype)sectionWithHeadTitle:(NSString *)headtitle
                          footTitle:(NSString *)footTitle
                         headHeight:(CGFloat)headHeight
                         footHeight:(CGFloat)footHeight{
    
    SectionManager *manager=[[SectionManager alloc]init];
    manager.l_headTitle=headtitle;
    manager.l_footTitle=footTitle;
    manager.l_HeadHeight=headHeight;
    manager.l_footHeight=footHeight;
    return manager;
}


@end


