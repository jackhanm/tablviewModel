//
//  AuthenCodeController.m
//  MyTel
//
//  Created by LHC on 16/5/16.
//  Copyright © 2016年 LHC. All rights reserved.
//

#import "AuthenCodeController.h"
#import <LocalAuthentication/LocalAuthentication.h>
#import "ViewController.h"

@implementation AuthenCodeController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     [self autheenticateUser];
     [self addUI];
  
    [[NSNotificationCenter defaultCenter]
     addObserver:self selector:@selector(autheenticateUser) name:UIApplicationWillEnterForegroundNotification object:nil];
    
}
-(void)addUI{
    self.view.backgroundColor=[UIColor whiteColor];
    
    UIImageView *imageview=[[UIImageView alloc]init];
    imageview.bounds=CGRectMake(0, 0,80, 80);
    imageview.center=CGPointMake(self.view.center.x,self.view.center.y-160);
    
    imageview.image=[UIImage imageNamed:@"temp"];
    [self.view addSubview:imageview];
    
    UIButton *imageButton=[UIButton buttonWithType:UIButtonTypeCustom];
    imageButton.bounds=CGRectMake(0, 0, 50, 50);
    imageButton.center=self.view.center;
    [imageButton setBackgroundImage:[UIImage imageNamed:@"touch"] forState:UIControlStateNormal];
    [imageButton addTarget:self action:@selector(authodLogin) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:imageButton];
}
-(void)authodLogin{
    
    [self autheenticateUser];
    
}

-(void)autheenticateUser{
    
    LAContext *context=[[LAContext alloc]init];
    NSError *error=nil;
    NSString *result =@"密码本验证touchId";
    
    if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) {
        
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:result reply:^(BOOL success, NSError * _Nullable error) {
            
            if (success) {

                ViewController *vc=[[ViewController alloc]init];
                UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:vc];
                
                self.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
    
                [self presentViewController:nav animated:YES completion:nil];
            
            }else{
                
                NSLog(@"%@",error.localizedDescription);
                
                switch (error.code) {
                    case LAErrorSystemCancel:
                        
                        NSLog(@"切换到其他App，系统取消验证");
                        break;
                    case LAErrorUserCancel:
                        
                        NSLog(@"用户取消验证");
                        break;
                    case LAErrorUserFallback:
                        
                        NSLog(@"用户选择输入密码");
                        break;
                        
                    default:
                        [[NSOperationQueue mainQueue]addOperationWithBlock:^{
                            
                            NSLog(@"到主线程");
                        }];
                        
                        
                        break;
                }
                
                
            }
            
            
        }];
        
        
        
    }else{
        
        
        switch (error.code) {
            case LAErrorTouchIDNotEnrolled:
                
                NSLog(@"不支持TouchId");
                break;
            case LAErrorPasscodeNotSet:
                NSLog(@"touchId 未设定");
                
            default:
                NSLog(@"不支持TouchId");
                
                
                break;
        }
        
        
        
    }
    
    
}

-(void)dealloc{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    
}

@end
