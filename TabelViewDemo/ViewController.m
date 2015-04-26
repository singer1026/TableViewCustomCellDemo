//
//  ViewController.m
//  TabelViewDemo
//
//  Created by Singer on 15/4/23.
//  Copyright (c) 2015年 Singer. All rights reserved.
//

#import "ViewController.h"
#import "Shop.h"
#import "MJExtension.h"
#import "MyCell1.h"
#import "MyCell2.h"
#import "MyCell3.h"
#import "MyCell4.h"
#import "UIImageView+WebCache.h"

@interface ViewController ()<BaseCellDelegate>
@property (nonatomic, strong) NSMutableArray *shops;

@property (nonatomic, strong) NSArray *dataList;

@end

@implementation ViewController


//用static 只会初始化一次
static NSString *ID1 = @"cell1";
static NSString *ID2 = @"cell2";
static NSString *ID3 = @"cell3";
static NSString *ID4 = @"cell4";


- (void)viewDidLoad {
    [super viewDidLoad];

    NSArray *array = [Shop objectArrayWithFilename:@"1.plist"];
    self.shops = [NSMutableArray arrayWithArray:array];
    [self.shops removeObjectAtIndex:10];
    [self.shops removeObjectAtIndex:20];
    self.dataList = [self shopArrays];
   
    [self.tableView registerNib:[UINib nibWithNibName:@"MyCell1" bundle:nil] forCellReuseIdentifier:ID1];
    [self.tableView registerNib:[UINib nibWithNibName:@"MyCell2" bundle:nil] forCellReuseIdentifier:ID2];
    [self.tableView registerNib:[UINib nibWithNibName:@"MyCell3" bundle:nil] forCellReuseIdentifier:ID3];
    [self.tableView registerNib:[UINib nibWithNibName:@"MyCell4" bundle:nil] forCellReuseIdentifier:ID4];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger i = (_shops.count-2)/3;
    if ((_shops.count -2) % 3 > 0) {
        i=i+1;
    }
    return i+1;
}

-(NSArray *)shopArrays{
    NSMutableArray *data = [NSMutableArray array];
   
    if (_shops.count > 0) {
        NSMutableDictionary *dict0 = [NSMutableDictionary dictionary];
        [data addObject:dict0];
        [dict0 setObject:_shops[0] forKey:@"a"];
        if (_shops.count >= 2) {
            [dict0 setValue:_shops[1] forKey:@"b"];
            
            int j = 1;
            NSMutableDictionary *dict = nil;
            for (int i = 2; i<_shops.count; i++) {
                if (j==1) {
                    dict = [NSMutableDictionary dictionary];
                    [data addObject:dict];
                    [dict setValue:_shops[i] forKey:@"a"];
                }else if (j == 2){
                    [dict setValue:_shops[i] forKey:@"b"];
                }else if(j == 3){
                    [dict setValue:_shops[i] forKey:@"c"];
                }
                j=j+1;
                if (j>3) {
                    j=1;
                }
            }
        }
        
        
    }
    return data;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellid = ID1;
    if (indexPath.row!=0) {
        if (indexPath.row%2 == 0) {
            cellid = ID3;
        }else{
            if(indexPath.row%4 == 1){
                cellid = ID2;
            }
            else if(indexPath.row%4 == 3){
                cellid = ID4;
            }
        }

    }else{
        cellid = ID1;
    }
    
    BaseCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    
    CGFloat h = 100.0f;
   
   if([cell isKindOfClass:[MyCell2 class]] || [cell isKindOfClass:[MyCell4 class]]){
        h=200.0f;
        
    }
    return h;
}


#pragma mark 每当有一个cell进入屏幕视野范围内就会被调用 返回当前这行显示的cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    NSString *cellid = ID1;
    //拿到一个标示符先去缓存池中查找对应的cell
    BaseCell *cell = nil;
    if (indexPath.row != 0 ) {
        if (indexPath.row%2 == 0) {
            cellid = ID3;
        }else{
            if(indexPath.row%4 == 1){
                cellid = ID2;
            }
            else if(indexPath.row%4 == 3){
                cellid = ID4;
            }
        }
    }else{
        cellid = ID1;
    }
  
    cell = [tableView dequeueReusableCellWithIdentifier:cellid];

    NSDictionary *dict = _dataList[indexPath.row];
    if ([cell isKindOfClass:[MyCell1 class]]) {
        MyCell1 *cell1 = (MyCell1 *)cell;
        
        Shop *shopLeft = dict[@"a"];
        Shop *shopRight = dict[@"b"];
        [cell1.imageLeft sd_setImageWithURL:[NSURL URLWithString:shopLeft.img]];
        cell1.imageLeft.shop = shopLeft;
        [cell1.imageRight sd_setImageWithURL:[NSURL URLWithString:shopRight.img]];
        cell1.imageRight.shop = shopRight;
    }else if([cell isKindOfClass:[MyCell2 class]]){
        
        Shop *shopa = dict[@"a"];
        Shop *shopb = dict[@"b"];
        Shop *shopc = dict[@"c"];
        MyCell2 *cell2 = (MyCell2 *)cell;
        [cell2.bigImage sd_setImageWithURL:[NSURL URLWithString:shopa.img]];
        [cell2.upImage sd_setImageWithURL:[NSURL URLWithString:shopb.img]];
        [cell2.downImage sd_setImageWithURL:[NSURL URLWithString:shopc.img]];
        
        cell2.bigImage.shop = shopa;
        cell2.upImage.shop = shopb;
        cell2.downImage.shop = shopc;
        
    }else if ([cell isKindOfClass:[MyCell3 class]]){
        
        Shop *shopa = dict[@"a"];
        Shop *shopb = dict[@"b"];
        Shop *shopc = dict[@"c"];
        MyCell3 *cell3 = (MyCell3 *)cell;
        [cell3.imageLeft sd_setImageWithURL:[NSURL URLWithString:shopa.img]];
        [cell3.imageMid sd_setImageWithURL:[NSURL URLWithString:shopb.img]];
        [cell3.imageRight sd_setImageWithURL:[NSURL URLWithString:shopc.img]];
        
        cell3.imageLeft.shop = shopa;
        cell3.imageMid.shop = shopb;
        cell3.imageRight.shop = shopc;
        
    }else if ([cell isKindOfClass:[MyCell4 class]]){
        Shop *shopa = dict[@"a"];
        Shop *shopb = dict[@"b"];
        Shop *shopc = dict[@"c"];
        MyCell4 *cell4 = (MyCell4 *)cell;
        [cell4.bigImage sd_setImageWithURL:[NSURL URLWithString:shopa.img]];
        [cell4.upImage sd_setImageWithURL:[NSURL URLWithString:shopb.img]];
        [cell4.downImage sd_setImageWithURL:[NSURL URLWithString:shopc.img]];
        
        cell4.bigImage.shop = shopa;
        cell4.upImage.shop = shopb;
        cell4.downImage.shop = shopc;
    }
    cell.imageDict = dict;
    cell.baseCellDelegate = self;
    
    return cell;
}

-(void)imageClickFor:(MyImageView *)imageView{
    NSLog(@"——————————————%@",imageView.shop.price);
}
@end
