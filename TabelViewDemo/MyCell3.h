//
//  MyCell3.h
//  TabelViewDemo
//
//  Created by Singer on 15/4/23.
//  Copyright (c) 2015年 Singer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseCell.h"
@interface MyCell3 : BaseCell
@property (weak, nonatomic) IBOutlet MyImageView *imageLeft;
@property (weak, nonatomic) IBOutlet MyImageView *imageMid;
@property (weak, nonatomic) IBOutlet MyImageView *imageRight;

@end
