//
//  YQAdvCircleView.h
//  maygolf
//
//  Created by maygolf on 16/5/23.
//  Copyright © 2016年 maygolf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YQAdvCircleView : UIView

// 播放时间间隔,默认为2s
@property (nonatomic, assign) NSTimeInterval playTimeSpace;
// 背景图片
@property (nonatomic, strong) UIImage *bgImage;
// 广告图片数组
@property (nonatomic, copy) NSArray<NSString *> *advs;
// 当前显示的广告索引(必须在advs之后设置)
@property (nonatomic, assign) NSInteger currentIndex;
// 自动播放(对象销毁前必须设置为NO，否则该对象无法销毁，造成内存泄露), 默认为yes
@property (nonatomic, assign, getter=isAutoPlay) BOOL autoPlay;

@property (nonatomic, copy) void(^didClickAdv)(NSString *adv);                       

- (void)reloadData;

@end
