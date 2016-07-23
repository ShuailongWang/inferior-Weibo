//
//  CZTableViewModel.m
//  劣质微博-完善
//
//  Created by czbk on 16/5/22.
//  Copyright © 2016年 王帅龙. All rights reserved.
//

#import "CZTableViewModel.h"

@implementation CZTableViewModel

-(instancetype)initWithStatModel:(NSDictionary*)dict{
    if(self = [super init]){
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+(instancetype)StatModel:(NSDictionary*)dict{
    return [[self alloc]initWithStatModel:dict];
}

@end
