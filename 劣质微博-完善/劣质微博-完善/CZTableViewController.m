//
//  CZTableViewController.m
//  劣质微博-完善
//
//  Created by czbk on 16/5/22.
//  Copyright © 2016年 王帅龙. All rights reserved.
//

#import "CZTableViewController.h"
#import "CZTableViewModel.h"
#import "CZStatuFrame.h"
#import "CZTableViewCell.h"

static NSString *cellID = @"cellID";

@interface CZTableViewController ()

@property (strong, nonatomic) NSArray *StatusList;  //数组

@end

@implementation CZTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //行高,这里是没行的行高都是300,微博的内容有的小于300,所以按alt+rowHeight,实现哪个方法
    //self.tableView.rowHeight = 300;
    
    //注册cell
    [self.tableView registerClass:[CZTableViewCell class] forCellReuseIdentifier:cellID];
}

#pragma mark -tableView数据源方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.StatusList.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //这时候发现系统的cell,无法实现哪个界面,所以这里要自定义cell
    CZTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    //frame
    CZStatuFrame *statuFrame = self.StatusList[indexPath.row];
    
    //自定义cell接受外面计算的Frame
    cell.statusFrame = statuFrame;
    
    return cell;
}

#pragma mark -自动行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CZStatuFrame *statuFrame = self.StatusList[indexPath.row];
    return statuFrame.rowHeight;
}
//tableView:heightForRowAtIndexPath:

#pragma mark -隐藏状态栏
-(BOOL)prefersStatusBarHidden{
    return YES;
}

#pragma mark -懒加载
-(NSArray *)StatusList{
    //
    if(nil == _StatusList){
        //路径, 内容
        NSString *path = [[NSBundle mainBundle]pathForResource:@"statuses.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        
        //遍历,保存
        NSMutableArray * arrayM = [NSMutableArray arrayWithCapacity:array.count];
        for (NSDictionary *dict in array) {
            //model
            CZTableViewModel *model = [CZTableViewModel StatModel:dict];
            
            //建立frame,接受model
            CZStatuFrame *statuFrame = [[CZStatuFrame alloc]init];
            statuFrame.model = model;
            
            //数组添加frame
            [arrayM addObject:statuFrame];
        }
        _StatusList = arrayM.copy;
    }
    return _StatusList;
}

@end
