//
//  CellItemModel.h
//  MyTel
//
//  Created by LHC on 16/4/28.
//  Copyright © 2016年 LHC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface CellItemModel : NSObject


@property (nonatomic,assign)CGFloat  l_cellHeight;
@property (nonatomic,strong)NSString *reuserId;
@property (nonatomic,strong)id  modelData;
@property (nonatomic,strong)NSString *l_cellClass;
@property (nonatomic,strong)NSString *l_ImageName;
@property (nonatomic,strong)NSString *l_cellTitle;
@property (nonatomic,strong)UIColor *l_backGroundColor;
@property (nonatomic,strong)NSString * l_subTitle;


+(instancetype)cellWithIdentifier:(NSString*)identifier cellClass:(NSString*)cellClass;


+(instancetype)BaseCellModelWithResuerId:(NSString*)resuerId cellClass:(NSString*)cellClass cellHeight:(CGFloat)cellHeight;




-(CGFloat)cellHeightWithModelData:(id)Data;

@end
