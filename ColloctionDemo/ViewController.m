//
//  ViewController.m
//  ColloctionDemo
//
//  Created by 宋玉杰 on 2017/8/21.
//  Copyright © 2017年 Song.Yu-Jie. All rights reserved.
//

#import "ViewController.h"
#import "FourSCollectionVC.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *mTable;
    NSArray *arr;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    arr = @[@"collectionview"];
    mTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    mTable.delegate = self;
    mTable.dataSource = self;
    [self.view addSubview:mTable];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma UITableView delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    [cell.textLabel setText:arr[indexPath.row]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
        {
            FourSCollectionVC *next = [[FourSCollectionVC alloc]init];
            [self.navigationController pushViewController:next animated:YES];
        }
            break;
            
        default:
            break;
    }
}


@end
