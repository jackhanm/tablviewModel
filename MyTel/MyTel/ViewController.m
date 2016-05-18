//t//
//  ViewController.m
//  MyTel
//
//  Created by LHC on 16/4/25.
//  Copyright © 2016年 LHC. All rights reserved.
//

#import "ViewController.h"
#import "SectionManager.h"
#import "TableViewModel.h"
#import "CellItemModel.h"
#import "PasswordDetailController.h"


@interface ViewController ()<TabViewModelDelegate>

@property(nonatomic,strong)UITableView *listTableView;

@end

@implementation ViewController
{
    TableViewModel *model;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor=[UIColor whiteColor];
    self.title=@"密码本";
    self.automaticallyAdjustsScrollViewInsets=YES;
    
    NSArray *titleArry=@[@"QQ密码",@"邮箱密码",@"安全密码",@"其他密码"];
    NSArray *imageNameArry=@[@"qq",@"mail",@"anquan",@"qita"];
    
    model=[[TableViewModel alloc]init];
    model.delegate=self;
    SectionManager *manger=[[SectionManager alloc]init];
    
    for (int i=0; i<titleArry.count; i++) {
        CellItemModel *lmodel=[CellItemModel BaseCellModelWithResuerId:@"cell" cellClass:nil cellHeight:74];
        lmodel.l_cellTitle=titleArry[i];
        lmodel.l_ImageName=imageNameArry[i];
        [manger.ModelData addObject:lmodel];
    }
    
    [model.dataSource addObject:manger];
    self.listTableView.dataSource=model;
    self.listTableView.delegate=model;
    [self.view addSubview:self.listTableView];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(reloadUserAuthod) name:UIApplicationDidEnterBackgroundNotification object:nil];
}
-(void)reloadUserAuthod{
    
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"返回了页面");
    }];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath cellModel:(CellItemModel *)InfoModel{
    PasswordDetailController *detaile=[[PasswordDetailController alloc]init];
    detaile.title=InfoModel.l_cellTitle;
    [self.navigationController pushViewController:detaile animated:YES];
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath sectionModel:(SectionManager *)sectionModel
{
    
    CellItemModel *cellItem=[sectionModel.ModelData objectAtIndex:indexPath.row];
    cell.imageView.image=[UIImage imageNamed:cellItem.l_ImageName];
    cell.textLabel.text=cellItem.l_cellTitle;
    
}


-(UITableView*)listTableView{
    
    if (!_listTableView) {
        
        _listTableView=[[UITableView alloc]initWithFrame:CGRectMake(0,0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)) style:UITableViewStyleGrouped];
        _listTableView.tableHeaderView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, CGFLOAT_MIN)];
        _listTableView.backgroundColor=[UIColor whiteColor];

    }
    
    return _listTableView;
}
-(void)dealloc{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}



@end
