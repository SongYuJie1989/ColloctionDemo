//
//  CollectionVC.m
//  ColloctionDemo
//
//  Created by 宋玉杰 on 2017/9/11.
//  Copyright © 2017年 Song.Yu-Jie. All rights reserved.
//

#import "FourSCollectionVC.h"
#import "FourSCollectionViewCell.h"
#import "CollectionHeaderReusableView.h"


//test
@interface FourSCollectionVC ()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    UICollectionView *mCollectionView;
    UICollectionViewFlowLayout *layout;
    BOOL change;
}

@end
static NSString *cellID = @"FourSCollectionCell";

@implementation FourSCollectionVC


-(void)doClickBackAction:(UIButton *)btn
{
    NSLog(@"doClickBackAction");
    if (change) {
        
        layout.itemSize = CGSizeMake((self.view.frame.size.width-40)/2, 100);
        [mCollectionView reloadData];
        change = NO;
        
    }else{
        
        layout.itemSize = CGSizeMake(self.view.frame.size.width-40, 100);
        [mCollectionView reloadData];
        change = YES;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"change" style:UIBarButtonItemStyleDone target:self action:@selector(doClickBackAction:)];
   
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
    
    layout = [[UICollectionViewFlowLayout alloc]init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    // 设置内边距
    CGFloat inset = 10;
    layout.sectionInset = UIEdgeInsetsMake(20, inset, 20, inset);
    layout.itemSize = CGSizeMake((self.view.frame.size.width-40)/2, 100);
    
    mCollectionView = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:layout];
    [mCollectionView setBackgroundColor:[UIColor whiteColor]];
    mCollectionView.delegate = self;
    mCollectionView.dataSource = self;
    [self.view addSubview:mCollectionView];
    
    [mCollectionView registerClass:[FourSCollectionViewCell class] forCellWithReuseIdentifier:cellID];
    
    [mCollectionView registerClass:[CollectionHeaderReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView"];
    layout.headerReferenceSize = CGSizeMake(self.view.frame.size.width, 160);

    
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader){
        
        CollectionHeaderReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
        [headerView setBackgroundColor:[UIColor brownColor]];
        reusableview = headerView;
    }
    
    return reusableview;
    
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 18;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FourSCollectionViewCell *collectionCell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    
    [collectionCell setLabStr:[NSString stringWithFormat:@"%ld",indexPath.row]];
    
    return collectionCell;
}


@end
