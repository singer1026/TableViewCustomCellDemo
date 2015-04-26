//
//  BaseCell.h
//  TabelViewDemo
//
//  Created by Singer on 15/4/23.
//  Copyright (c) 2015年 Singer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyImageView.h"

@protocol BaseCellDelegate <NSObject>

-(void)imageClickFor:(MyImageView *)imageView;

@end


@class BaseCellDelegate;
@interface BaseCell : UITableViewCell
@property (nonatomic , strong) NSDictionary *imageDict;
@property (nonatomic , weak) id<BaseCellDelegate> baseCellDelegate;
@end
