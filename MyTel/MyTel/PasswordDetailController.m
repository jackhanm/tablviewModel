//
//  PasswordDetailController.m
//  MyTel
//
//  Created by LHC on 16/5/16.
//  Copyright © 2016年 LHC. All rights reserved.
//

#import "PasswordDetailController.h"
#import "AddMessageController.h"
#import "PassWord.h"
#import "TableViewModel.h"
#import "SectionManager.h"
#import "CellItemModel.h"

@interface PasswordDetailController ()<TabViewModelDelegate>

@property(nonatomic,strong)NSArray *dataSource;

@property(nonatomic,strong)UITableView *userINfolist;

@end

@implementation PasswordDetailController
{
    TableViewModel *dataModel1;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    
    [self setNavigationRightBar];
    
    [self.view addSubview:self.userINfolist];
    
    dataModel1=[[TableViewModel alloc]init];
    self.userINfolist.dataSource=dataModel1;
    self.userINfolist.delegate=dataModel1;
    dataModel1.delegate=self;
    [self loadDataSouce];
    
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(reloadUserAuthod) name:UIApplicationDidEnterBackgroundNotification object:nil];
    
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath cellModel:(CellItemModel *)InfoModel{
    
    AddMessageController *avc=[[AddMessageController alloc]init];
    avc.passNum=InfoModel.l_subTitle;
    avc.passname=InfoModel.l_cellTitle;
    __weak __typeof__(self) weakSelf = self;
   avc.addSuc = ^(NSString *passwordName,NSString*password){
       
        PassWord *model=[[PassWord alloc]init];
        model.passName=passwordName;
        model.passNumber=password;
        [weakSelf SaveKey:self.title Value:model];
        [weakSelf loadDataSouce];
    };
    
    [self.navigationController pushViewController:avc animated:YES];
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath sectionModel:(SectionManager *)sectionModel{
    
    CellItemModel *cellItem=[sectionModel.ModelData objectAtIndex:indexPath.row];
    cell.textLabel.text=cellItem.l_cellTitle;
    cell.detailTextLabel.text=cellItem.l_subTitle;
    
}

//-(void)reloadUserAuthod{
//    
//    [self dismissViewControllerAnimated:YES completion:^{
//        NSLog(@"返回了页面");
//    }];
//}

-(void)AddNewPassword{
    
    
    AddMessageController *addmessage=[[AddMessageController alloc]init];
    addmessage.title=@"添加安全数据";
    
    __weak __typeof__(self) weakSelf = self;
    addmessage.addSuc = ^(NSString *passwordName,NSString*password){
        
       
       PassWord *model=[[PassWord alloc]init];
       
       model.passName=passwordName;
       model.passNumber=password;
       
        [weakSelf SaveKey:self.title Value:model];
        [weakSelf loadDataSouce];
    };
    
    [self.navigationController pushViewController:addmessage animated:YES];
    
    
    
}
-(void)SaveKey:(NSString*)key Value:(PassWord*)Value{
    
    NSUserDefaults *user=[NSUserDefaults standardUserDefaults];
    NSData *data=[NSKeyedArchiver archivedDataWithRootObject:Value];
    NSMutableArray *arry=[NSMutableArray array];

    if (![user objectForKey:key]) {
        
        [arry addObject:data];
        
    }else{
        
        
        [arry addObjectsFromArray:(NSArray*)[user objectForKey:key]];
        
        if (![arry containsObject:data]) {
            
            [arry addObject:data];
        }
       
       
    }
    [user setObject:arry forKey:key];
    [user synchronize];
}
//获取数据源
-(void)loadDataSouce{
    
      NSUserDefaults *user=[NSUserDefaults standardUserDefaults];
    
     self.dataSource=[user objectForKey:self.title];
    
     if (self.dataSource!=nil) {
        
        SectionManager *section=[[SectionManager alloc]init];
        for (int i=0; i<_dataSource.count; i++) {
            
            PassWord *model=(PassWord*)[NSKeyedUnarchiver unarchiveObjectWithData:[_dataSource objectAtIndex:i]];
            CellItemModel *cell=[CellItemModel BaseCellModelWithResuerId:@"hello" cellClass:nil cellHeight:64];
            cell.l_cellTitle=model.passName;
            cell.l_subTitle=model.passNumber;
            [section.ModelData addObject:cell];
        }
        [dataModel1.dataSource removeAllObjects];
        [dataModel1.dataSource addObject:section];
        [self.userINfolist reloadData];
    }
    else{
        
        NSLog(@"暂时没有数据");
        
    }


}
-(void)setNavigationRightBar{
    
    UIButton *addButton=[UIButton buttonWithType:UIButtonTypeContactAdd];
    addButton.frame=CGRectMake(0, 0, 40, 40);
    [addButton addTarget:self action:@selector(AddNewPassword) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightBar=[[UIBarButtonItem alloc]initWithCustomView:addButton];
    [self.navigationItem setRightBarButtonItem:rightBar];
    
}
-(UITableView*)userINfolist{
    
    if (!_userINfolist) {
        
        _userINfolist=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
        _userINfolist.tableHeaderView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, CGFLOAT_MIN)];
    }
    
    return _userINfolist;
}
//-(void)dealloc{
//    
//    [[NSNotificationCenter defaultCenter]removeObserver:self];
//}
@end
