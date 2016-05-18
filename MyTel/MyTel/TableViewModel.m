//
//  TableViewModel.m
//  MyTel
//
//  Created by LHC on 16/4/28.
//  Copyright © 2016年 LHC. All rights reserved.
//

#import "TableViewModel.h"


@implementation TableViewModel

{
    UITableViewStyle _tbStyle;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.dataSource=[NSMutableArray array];
    }
    return self;
}

+(UITableView*)tableViewWithFrame:(CGRect)frame
                            style:(UITableViewStyle)style
                     hideHeadView:(BOOL)isHide
{
    
    UITableView *tableView=[[UITableView alloc]initWithFrame:frame style:style];
    if (isHide) {
        
        tableView.tableHeaderView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, CGFLOAT_MIN)];
    }
    return tableView;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
   
    return self.dataSource.count;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    SectionManager *Msection=[self.dataSource objectAtIndex:section];
    return Msection.ModelData.count;
    
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SectionManager *Msection=[self.dataSource objectAtIndex:indexPath.section];
    
    CellItemModel *model=[Msection.ModelData objectAtIndex:indexPath.row];
    if (model.l_cellClass==nil) {
        
        model.l_cellClass=@"UITableViewCell";
    }
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:model.reuserId];
    if (!cell) {
        
        cell=[(UITableViewCell*)[NSClassFromString(model.l_cellClass) alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:model.reuserId];
        
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([self.delegate respondsToSelector:@selector(tableView:willDisplayCell:forRowAtIndexPath:sectionModel:)]) {
        SectionManager *Msection=[self.dataSource objectAtIndex:indexPath.section];
        
        [self.delegate tableView:tableView willDisplayCell:cell forRowAtIndexPath:indexPath sectionModel:Msection];
        
    }
    
    
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    SectionManager *Msection=[self.dataSource objectAtIndex:section];
    
    return Msection.l_footHeight;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    SectionManager *Msection=[self.dataSource objectAtIndex:section];
    
    return Msection.l_HeadHeight;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([self.delegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:cellModel:)]) {
        SectionManager *Msection=[self.dataSource objectAtIndex:indexPath.section];
        CellItemModel *model=[Msection.ModelData objectAtIndex:indexPath.row];
        
        [self.delegate tableView:tableView didSelectRowAtIndexPath:indexPath cellModel:model];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SectionManager *Msection=[self.dataSource objectAtIndex:indexPath.section];
    
    CellItemModel *model=[Msection.ModelData objectAtIndex:indexPath.row];
    
    return [model cellHeightWithModelData:model];

}

@end
