//
//  SectionManager.h
//  MyTel
//
//  Created by LHC on 16/4/28.
//  Copyright © 2016年 LHC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class CellItemModel;

@interface SectionManager : NSObject

@property (nonatomic,strong) NSString  *l_headTitle;
@property (nonatomic,strong) NSString  *l_footTitle;
@property (nonatomic,assign) CGFloat   l_HeadHeight;
@property (nonatomic,assign) CGFloat   l_footHeight;

@property (nonatomic,strong) NSMutableArray<CellItemModel *> *ModelData;

+(instancetype)sectionWithHeadTitle:(NSString*)headtitle
                          footTitle:(NSString*)footTitle
                         headHeight:(CGFloat)headHeight
                         footHeight:(CGFloat)footHeight;

@end

