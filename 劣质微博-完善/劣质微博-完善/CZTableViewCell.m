//
//  CZTableViewwCell.m
//  劣质微博-完善
//
//  Created by czbk on 16/5/22.
//  Copyright © 2016年 王帅龙. All rights reserved.
//

#import "CZTableViewCell.h"
#import "CZStatuFrame.h"
#import "CZTableViewModel.h"

@interface CZTableViewCell()

@property(weak,nonatomic)UIImageView *oldIcon;
@property(weak,nonatomic)UILabel *oldName;
@property(weak,nonatomic)UIImageView *oldVip;
@property(weak,nonatomic)UILabel *oldCont;
@property(weak,nonatomic)UIImageView *oldPicture;

@end

@implementation CZTableViewCell

//复习这个方法
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    //
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        //缓存池中没有的时候,会调用这个方法穿件cell,那么久可以写一系列的东西
        
        //创建子控件,创建的时候,会需要中间变量接受一下,因为后面会用到,在类延展中
        //头像
        UIImageView *iconView = [[UIImageView alloc]init];
        self.oldIcon = iconView;
        [self.contentView addSubview:iconView];
        
        //姓名
        UILabel *userName = [[UILabel alloc]init];
        self.oldName = userName;
        userName.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:userName];
        
        //vip
        UIImageView *vipView = [[UIImageView alloc]init];
        self.oldVip = vipView;
        [self.contentView addSubview:vipView];
        
        //内容
        UILabel *contLabel = [[UILabel alloc]init];
        self.oldCont = contLabel;
        contLabel.font = [UIFont systemFontOfSize:17];
        contLabel.numberOfLines = 0;                //注意,新方法
        [self.contentView addSubview:contLabel];
        
        //图片
        UIImageView *pictureView = [[UIImageView alloc]init];
        self.oldPicture = pictureView;
        [self.contentView addSubview:pictureView];
        
    }
    return self;
}

//set方法来设置每个子控件的frame
-(void)setStatusFrame:(CZStatuFrame *)statusFrame{
    self.oldIcon.frame = statusFrame.iconFrame;
    self.oldName.frame = statusFrame.nameFrame;
    self.oldVip.frame = statusFrame.vipFrame;
    self.oldCont.frame = statusFrame.contFrame;
    self.oldPicture.frame = statusFrame.pictureFrame;
    
    //取出model
    CZTableViewModel *model = statusFrame.model;
    
    //设置
    //头像
    self.oldIcon.image = [UIImage imageNamed:model.icon];
    //姓名
    self.oldName.text = model.name;
    //会员
    if(model.vip){
        self.oldVip.image = [UIImage imageNamed:@"vip"];
        self.oldName.textColor = [UIColor redColor];
    }else{
        self.oldName.textColor = [UIColor blackColor];
    }
    self.oldCont.text = model.text;
    self.oldPicture.image = [UIImage imageNamed:model.picture];
}





@end
