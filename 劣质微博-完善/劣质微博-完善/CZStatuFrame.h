//
//  CZStatuFrame.h
//  劣质微博-完善
//
//  Created by czbk on 16/5/22.
//  Copyright © 2016年 王帅龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CZTableViewModel;
@interface CZStatuFrame : NSObject

@property(assign, nonatomic, readonly) CGRect iconFrame;
@property(assign, nonatomic, readonly) CGRect nameFrame;
@property(assign, nonatomic, readonly) CGRect vipFrame;
@property(assign, nonatomic, readonly) CGRect contFrame;
@property(assign, nonatomic, readonly) CGRect pictureFrame;

//每行的行高
@property(assign,nonatomic,readonly) CGFloat rowHeight;

//接受外部的model
@property(strong, nonatomic) CZTableViewModel *model;

@end
