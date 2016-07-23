//
//  CZTableViewModel.h
//  劣质微博-完善
//
//  Created by czbk on 16/5/22.
//  Copyright © 2016年 王帅龙. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZTableViewModel : NSObject

@property(copy, nonatomic) NSString *text;
@property(copy, nonatomic) NSString *icon;
@property(copy, nonatomic) NSString *name;
@property(assign, nonatomic) NSInteger vip;
@property(copy, nonatomic) NSString *picture;

-(instancetype)initWithStatModel:(NSDictionary*)dict;
+(instancetype)StatModel:(NSDictionary*)dict;

@end
