//
//  BaseCell.m
//  TabelViewDemo
//
//  Created by Singer on 15/4/23.
//  Copyright (c) 2015年 Singer. All rights reserved.
//

#import "BaseCell.h"

@implementation BaseCell

- (void)awakeFromNib {
    
    NSArray *subViews =self.contentView.subviews;
    for (UIView *view in subViews) {
        if ([view isKindOfClass:[MyImageView class]]) {
            ((MyImageView *)view).contentMode = UIViewContentModeScaleAspectFit;
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageClick:)];
            view.userInteractionEnabled = YES;
            [view addGestureRecognizer:tap];
        }
    }
}

-(void)imageClick:(UITapGestureRecognizer*)recognizer{
    MyImageView *mv = (MyImageView *)recognizer.view;
    NSLog(@"%@",mv.shop.price);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
