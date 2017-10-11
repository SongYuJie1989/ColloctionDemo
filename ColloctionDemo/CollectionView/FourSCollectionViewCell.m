//
//  CollectionViewCell.m
//  ColloctionDemo
//
//  Created by 宋玉杰 on 2017/9/11.
//  Copyright © 2017年 Song.Yu-Jie. All rights reserved.
//

#import "FourSCollectionViewCell.h"


@interface FourSCollectionViewCell()

@property (nonatomic, weak) UILabel *lab; /**< <#注释#> */


@end

@implementation FourSCollectionViewCell


-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.borderWidth = 2;
        self.layer.borderColor = [UIColor lightGrayColor].CGColor;
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 15.0;
        UILabel  *labTemp = [[UILabel alloc] initWithFrame:self.contentView.bounds];
        self.lab = labTemp;
        [self.lab setTextColor:[UIColor redColor]];
        [self.lab setText:self.labStr];
        [self.lab setTextAlignment:NSTextAlignmentCenter];
        [self.contentView addSubview:labTemp];

    }
    return self;
}

-(void)setLabStr:(NSString *)labStr
{
    [self.lab setText:labStr];
}
@end
