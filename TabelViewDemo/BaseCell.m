//
//  BaseCell.m
//  TabelViewDemo
//
//  Created by Singer on 15/4/23.
//  Copyright (c) 2015年 Singer. All rights reserved.
//

#import "BaseCell.h"

@interface BaseCell ()

@end

@implementation BaseCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = [UIColor grayColor];
    NSArray *subViews =self.contentView.subviews;
    for (UIView *view in subViews) {
        if ([view isKindOfClass:[MyImageView class]]) {
//            ((MyImageView *)view).contentMode = UIViewContentModeScaleAspectFill;
            MyImageView *imageView = (MyImageView *)view;
            imageView.contentMode = UIViewContentModeScaleAspectFill;
            imageView.clipsToBounds = YES;
            imageView.layer.borderColor = [UIColor whiteColor].CGColor;
            imageView.layer.borderWidth = 5;
            imageView.backgroundColor = [UIColor whiteColor];
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageClick:)];
            
            view.userInteractionEnabled = YES;
            [view addGestureRecognizer:tap];
        }
    }
}

-(void)imageClick:(UITapGestureRecognizer*)recognizer{
    MyImageView *mv = (MyImageView *)recognizer.view;
    if (mv.image) {
        [UIView animateWithDuration:0.1 animations:^{
            mv.transform = CGAffineTransformMakeScale(0.9, 0.9);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.1 delay:0.0 usingSpringWithDamping:0.6 initialSpringVelocity:0.8 options:UIViewAnimationOptionCurveEaseOut animations:^{
                mv.transform = CGAffineTransformIdentity;
            } completion:^(BOOL finished) {
                if ([self.baseCellDelegate respondsToSelector:@selector(imageClickFor:)]) {
                    [self.baseCellDelegate imageClickFor:(mv)];
                }
            }];
        
        }];

    }
    
}


@end
