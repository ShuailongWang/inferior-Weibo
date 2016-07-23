//
//  CZStatuFrame.m
//  劣质微博-完善
//
//  Created by czbk on 16/5/22.
//  Copyright © 2016年 王帅龙. All rights reserved.
//

#import "CZStatuFrame.h"
#import "CZTableViewModel.h"

#define kSpane 8

@implementation CZStatuFrame


//复习model 的set方法
-(void)setModel:(CZTableViewModel *)model{
    //赋值
    _model = model;
    
    //设置frame
    //头像
    CGFloat iconWidth = 40;
    CGFloat iconHeight = 40;
    CGFloat iconX = kSpane;
    CGFloat iconY = kSpane;
    //
    _iconFrame = CGRectMake(iconX, iconY, iconWidth, iconHeight);
    
    //用户名
    CGFloat nameHeight = 20;
    CGFloat nameX = CGRectGetMaxX(_iconFrame) + kSpane; //图片最大x + 间距
    CGFloat nameY = (iconHeight - nameHeight) / 2 + kSpane; //(图片高 - 文字高)/2 + 上间距
    //这里会多处用到boundingRectWith,我们写了一个分类,给谁呢,字符串
    CGFloat nameWidth = [model.name boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, nameHeight) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]} context:nil].size.width;
    //
    _nameFrame = CGRectMake(nameX, nameY, nameWidth, nameHeight);
    
    //会员
    CGFloat vipWidth = 10;
    CGFloat vipHeight = vipWidth;
    CGFloat vipX = CGRectGetMaxX(_nameFrame) + kSpane;   //name最大x + 间距
    CGFloat vipY = (nameHeight - vipHeight) / 2 + 2*kSpane;   //(name高-vip高)/2 + 间距
    //是否会员
    if(model.vip){
        _vipFrame = CGRectMake(vipX, vipY, vipWidth, vipHeight);
    }
    
    //内容
    CGFloat contWidth = [UIScreen mainScreen].bounds.size.width-kSpane;  //屏幕的宽度,
    CGFloat contX = kSpane;
    CGFloat contY = CGRectGetMaxY(_iconFrame) + kSpane;  //图片最大Y+间距
    //
    CGFloat contHeight = [model.text boundingRectWithSize:CGSizeMake(contWidth, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil].size.height;
    //
    _contFrame = CGRectMake(contX, contY, contWidth, contHeight);
    
    //图片
    CGFloat pictureWidth = 200;
    CGFloat pictureHeight = 200;
    CGFloat pictureX = kSpane;
    CGFloat pictureY = CGRectGetMaxY(_contFrame) + kSpane;//内容的最大Y + 间距
    //是否有图片
    if(model.picture){
        _pictureFrame = CGRectMake(pictureX, pictureY, pictureWidth, pictureHeight);
    }
    
    //行高
    _rowHeight = MAX(CGRectGetMaxY(_contFrame), CGRectGetMaxY(_pictureFrame)) + kSpane;  //判断(图片 文字)哪个大[大就代表是否有图片] + 间距

}

@end
