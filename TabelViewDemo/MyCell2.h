//
//  MyCell2.h
//  TabelViewDemo
//
//  Created by Singer on 15/4/23.
//  Copyright (c) 2015年 Singer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseCell.h"
@interface MyCell2 : BaseCell
@property (weak, nonatomic) IBOutlet MyImageView *bigImage;
@property (weak, nonatomic) IBOutlet MyImageView *upImage;
@property (weak, nonatomic) IBOutlet MyImageView *downImage;

@end
