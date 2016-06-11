//
//  YQAdvCircleTableViewCell.m
//  YQAdvCircleViewDemo
//
//  Created by maygolf on 16/6/11.
//  Copyright © 2016年 yiquan. All rights reserved.
//

#import <Masonry/Masonry.h>

#import "YQAdvCircleTableViewCell.h"

@interface YQAdvCircleTableViewCell ()

@property (nonatomic, strong) YQAdvCircleView *advView;
@property (nonatomic, strong) MASConstraint *constraint_w_h;

@end

@implementation YQAdvCircleTableViewCell

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self step];
    }
    return self;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    [self step];
}

- (void)step{
    [self.contentView addSubview:self.advView];
    [self.advView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
        self.constraint_w_h = make.width.equalTo(self.advView.mas_height).multipliedBy(self.image_w_h);
    }];
}

#pragma mark - getter
- (YQAdvCircleView *)advView{
    if (!_advView) {
        _advView = [[YQAdvCircleView alloc] init];
        _advView.backgroundColor = [UIColor blackColor];
        _advView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _advView;
}

#pragma mark - setting
- (void)setImage_w_h:(CGFloat)image_w_h{
    _image_w_h = image_w_h;
    [self.constraint_w_h uninstall];
    [self.advView mas_makeConstraints:^(MASConstraintMaker *make) {
        self.constraint_w_h = make.width.equalTo(self.advView.mas_height).multipliedBy(self.image_w_h);
    }];
}

@end
