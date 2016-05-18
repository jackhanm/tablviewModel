//
//  PassWord.m
//  MyTel
//
//  Created by LHC on 16/5/16.
//  Copyright © 2016年 LHC. All rights reserved.
//

#import "PassWord.h"


@implementation PassWord



-(void)encodeWithCoder:(NSCoder *)aCoder{
    
    [aCoder encodeObject:self.passName forKey:@"name"];
    [aCoder encodeObject:self.passNumber forKey:@"number"];
    
}
-(id)initWithCoder:(NSCoder *)aDecoder{
    
    if (self=[super init]) {
        
        self.passName=[aDecoder decodeObjectForKey:@"name"];
        self.passNumber=[aDecoder decodeObjectForKey:@"number"];
    }
    return self;
    
}


@end
