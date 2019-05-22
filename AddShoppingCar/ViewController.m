//
//  ViewController.m
//  AddShoppingCar
//
//  Created by 洪陪 on 2019/5/22.
//  Copyright © 2019 洪陪. All rights reserved.
//

#import "ViewController.h"
#import "AddShoppingCartAnimation.h"
#import "UIImage+GIF.h"

#define viewW self.view.frame.size.width
#define viewH self.view.frame.size.height

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIImageView *shoppingCarImg;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatUI];
}

-(void)creatUI
{
    [self.view addSubview:self.tableView];
    
    [self.view addSubview:self.shoppingCarImg];
    
}

#pragma mark ----------UITableViewDelegate,UITableViewDataSource---------------

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    UIButton *addShopButton = [UIButton buttonWithType:UIButtonTypeCustom];
    addShopButton.frame = CGRectMake(viewW - 200, 10, 160, 30);
    [addShopButton setTitle:@"加入购物车" forState:UIControlStateNormal];
    addShopButton.backgroundColor = [UIColor purpleColor];
    [addShopButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    addShopButton.tag = indexPath.row+1;
    [addShopButton addTarget:self action:@selector(addShopButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [cell addSubview:addShopButton];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

-(void)addShopButtonClick:(UIButton *)button
{
    NSInteger btnTag = button.tag;
    UIButton *btn = (UIButton *)[self.view viewWithTag:btnTag];
    CGRect startR = [btn convertRect:button.bounds toView:self.view];
    //起点位置
    CGPoint  startPoint = CGPointMake(startR.origin.x + 30, startR.origin.y);
    
    //    贝塞尔曲线的重点位置
    CGPoint endPoint = CGPointMake(self.shoppingCarImg.center.x, self.shoppingCarImg.center.y);
    
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(hideGif) object:nil];
    self.shoppingCarImg.image = [UIImage sd_animatedGIFNamed:@"shopcart"];
    [self performSelector:@selector(hideGif) withObject:nil afterDelay:0.9];
    
    [AddShoppingCartAnimation addToShoppingCartWithGoodsImage:[UIImage imageNamed:@"add"] startPoint:startPoint endPoint:endPoint completion:^(BOOL finished) {
        NSLog(@"动画结束了");
        
    }];
}


- (void)hideGif
{
    self.shoppingCarImg.image = [UIImage imageNamed:@"购物车"];
}

#pragma mark ----------懒加载---------------

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, viewW, viewH-64) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}

-(UIImageView *)shoppingCarImg
{
    if (!_shoppingCarImg) {
        _shoppingCarImg = [[UIImageView alloc] initWithFrame:CGRectMake(30,viewH - 80, 60, 60)];
        _shoppingCarImg.image = [UIImage imageNamed:@"购物车"];
    }
    return _shoppingCarImg;
}

@end
