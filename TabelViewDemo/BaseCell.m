//
//  BaseCell.m
//  TabelViewDemo
//
//  Created by Singer on 15/4/23.
//  Copyright (c) 2015年 Singer. All rights reserved.
//

#import "BaseCell.h"

@interface BaseCell ()<UIGestureRecognizerDelegate>

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
            UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(imageClick:)];
            view.userInteractionEnabled = YES;
            
            longPressGesture.minimumPressDuration = 0.0;
            longPressGesture.delegate = self;
            longPressGesture.cancelsTouchesInView = NO;
            [view addGestureRecognizer:longPressGesture];
        }
    }
}

-(void)imageClick:(UILongPressGestureRecognizer*)recognizer{
    MyImageView *mv = (MyImageView *)recognizer.view;
    if (mv.image) {
        if (recognizer.state == UIGestureRecognizerStateBegan) {
            [UIView animateWithDuration:0.2 delay:0.0 usingSpringWithDamping:0.6 initialSpringVelocity:0.8 options:UIViewAnimationOptionCurveEaseOut animations:^{
                mv.transform = CGAffineTransformMakeScale(0.9, 0.9);
                
            } completion:nil];
            
        } else {
            [UIView animateWithDuration:0.2 delay:0.0 usingSpringWithDamping:0.6 initialSpringVelocity:0.8 options:UIViewAnimationOptionCurveEaseOut animations:^{
                mv.transform = CGAffineTransformIdentity;
             } completion:nil];
        }
    }
    
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
