//
//  YQAdvCircleCollectionViewCell.m
//  maygolf
//
//  Created by maygolf on 16/5/23.
//  Copyright © 2016年 maygolf. All rights reserved.
//

#import "YQAdvCircleCollectionViewCell.h"

@interface YQAdvCircleCollectionViewCell ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation YQAdvCircleCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self.contentView addSubview:self.imageView];
    }
    return self;
}

#pragma mark - getter
- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:self.contentView.bounds];
        _imageView.backgroundColor = [UIColor clearColor];
        _imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    return _imageView;
}

@end
