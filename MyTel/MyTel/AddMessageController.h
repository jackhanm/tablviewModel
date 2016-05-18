//
//  AddMessageController.h
//  MyTel
//
//  Created by LHC on 16/5/16.
//  Copyright © 2016年 LHC. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^addSuccess)(NSString *passName,NSString*passWord);


@interface AddMessageController : UIViewController


@property (nonatomic,strong)addSuccess  addSuc;

@property (nonatomic,strong)NSString * passname;
@property (nonatomic,strong)NSString * passNum;
@end
