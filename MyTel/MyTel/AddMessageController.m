//
//  AddMessageController.m
//  MyTel
//
//  Created by LHC on 16/5/16.
//  Copyright © 2016年 LHC. All rights reserved.
//

#import "AddMessageController.h"

@interface AddMessageController ()

@property(nonatomic,strong)UITableView *userINfolist;

@end

@implementation AddMessageController

{
    UITextField *namecontent;
    UITextField *passwordContent;
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor=[UIColor whiteColor];
   
    [self addUIContent];
     [self setPassName:self.passname number:self.passNum];
}

-(void)setPassName:(NSString *)name number:(NSString *)number{
    
    namecontent.text=name;
    passwordContent.text=number;
}
-(void)addUIContent{
    
    UILabel *nameLabel=[[UILabel alloc]initWithFrame:CGRectMake(12, 84, 100, 40)];
    nameLabel.text=@"输入12账号";
    namecontent=[[UITextField alloc]initWithFrame:CGRectMake(114, 84, 200, 40)];
    namecontent.placeholder=@"输入账号";
    namecontent.borderStyle=UITextBorderStyleRoundedRect;
    
    [self.view addSubview:namecontent];
    [self.view addSubview:nameLabel];
    
    UILabel *password=[[UILabel alloc]initWithFrame:CGRectMake(12, 134, 100, 40)];
    password.text=@"输入密码";
    passwordContent=[[UITextField alloc]initWithFrame:CGRectMake(114, 134, 200, 40)];
    passwordContent.placeholder=@"输入密码";
    passwordContent.borderStyle=UITextBorderStyleRoundedRect;
    
    [self.view addSubview:passwordContent];
    [self.view addSubview:password];
    
    UIButton *sureButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    sureButton.frame=CGRectMake([UIScreen mainScreen].bounds.size.width/2-50,194, 100, 40);
    [sureButton setTitle:@"确定" forState:UIControlStateNormal];
    
    [sureButton addTarget:self action:@selector(addFinish) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:sureButton];
}
-(void)addFinish{
    
    if (namecontent.text.length<=0||passwordContent.text.length<=0) {
        
        UIAlertView *aleart=[[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"白痴填全了吗" delegate:nil cancelButtonTitle:@"我错了" otherButtonTitles:nil, nil];
        [aleart show];
        
    }else{
        
        self.addSuc(namecontent.text,passwordContent.text);
        [self.navigationController popViewControllerAnimated:YES];
    }
    
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
}

-(UITableView*)userINfolist{
    
    if (!_userINfolist) {
        
        _userINfolist=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
        _userINfolist.tableHeaderView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, CGFLOAT_MIN)];
    }
    
    return _userINfolist;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
