//
//  TableViewModel.h
//  MyTel
//
//  Created by LHC on 16/4/28.
//  Copyright © 2016年 LHC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SectionManager.h"
#import "CellItemModel.h"




@protocol TabViewModelDelegate <NSObject>

@required

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath sectionModel:(SectionManager*)sectionModel;

@optional
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath cellModel:(CellItemModel*)InfoModel;



@end


@interface TableViewModel : NSObject<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,weak)id <TabViewModelDelegate> delegate;

@property(nonatomic,strong)NSMutableArray<SectionManager*> *dataSource;

// return a UITableView
+(UITableView*)tableViewWithFrame:(CGRect)frame style:(UITableViewStyle)style hideHeadView:(BOOL)isHide;


@end
