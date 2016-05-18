//
//  CellItemModel.m
//  MyTel
//
//  Created by LHC on 16/4/28.
//  Copyright © 2016年 LHC. All rights reserved.
//

#import "CellItemModel.h"

@implementation CellItemModel

+(instancetype)cellWithIdentifier:(NSString *)identifier cellClass:(NSString *)cellClass
{
    
    CellItemModel *model=[CellItemModel new];
     model.l_cellClass=cellClass;
    return model;
    
}

+(instancetype)BaseCellModelWithResuerId:(NSString *)resuerId cellClass:(NSString *)cellClass cellHeight:(CGFloat)cellHeight{
    
    CellItemModel* model=[CellItemModel new];
    
    model.reuserId=resuerId;
    model.l_cellClass=cellClass;
    model.l_cellHeight=cellHeight;
    
    return model;
}

-(CGFloat)cellHeightWithModelData:(id)Data{
    
    if (self.l_cellHeight) {
        
        return _l_cellHeight;
    }else{
        
        _l_cellHeight=44;
        
        return _l_cellHeight;
    }
    
}
@end
