//
//  ViewController.m
//  DYLottieDemo
//
//  Created by DanielYK on 2017/8/22.
//  Copyright © 2017年 DanielYK. All rights reserved.
//

#import "ViewController.h"
#import "DYAnimationVC.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView  *tableView;
@property(nonatomic,strong)NSArray      *titleArr;

@end

@implementation ViewController
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
        _tableView.dataSource       = self;
        _tableView.delegate         = self;
        _tableView.tableFooterView  = [[UIView alloc]init];
        _tableView.separatorStyle   = UITableViewCellSeparatorStyleSingleLine;
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.titleArr = [NSArray arrayWithObjects:@"Animation - Ⅰ",@"Animation - Ⅱ",@"Animation - Ⅲ",@"Animation - Ⅳ",@"Animation - Ⅴ",@"Animation - Ⅵ",@"Animation - Ⅶ",@"Animation - Ⅷ",@"Animation - Ⅸ",@"Animation - Ⅹ", nil];
    [self.view addSubview:self.tableView];
    
}

#pragma mark - UITableViewDataSource/UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identify      = @"CellID";
    UITableViewCell *cell   = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identify];
    }
    cell.textLabel.text = self.titleArr[indexPath.row];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DYAnimationVC *animationVC = [[DYAnimationVC alloc]initWithAnimationType:indexPath.row+1];
    [self presentViewController:animationVC animated:YES completion:NULL];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
