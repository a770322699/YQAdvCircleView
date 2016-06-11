//
//  YQAdvCircleTableViewCell.h
//  YQAdvCircleViewDemo
//
//  Created by maygolf on 16/6/11.
//  Copyright © 2016年 yiquan. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "YQAdvCircleView.h"

@interface YQAdvCircleTableViewCell : UITableViewCell

@property (nonatomic, readonly) YQAdvCircleView *advView;
@property (nonatomic, assign) CGFloat image_w_h;                        // 图片宽高比

@end
