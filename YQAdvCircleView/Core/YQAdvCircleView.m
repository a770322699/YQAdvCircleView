//
//  YQAdvCircleView.m
//  maygolf
//
//  Created by maygolf on 16/5/23.
//  Copyright © 2016年 maygolf. All rights reserved.
//

#import <Masonry/Masonry.h>

#import <SDWebImage/SDWebImageManager.h>
#import <SDWebImage/UIImageView+WebCache.h>

#import "YQAdvCircleView.h"
#import "YQAdvCircleCollectionViewCell.h"

@interface YQAdvCircleView ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UIImageView *bgImageView;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) UICollectionView *conllectionView;

@property (nonatomic, strong) NSArray *groups;                        //
@property (nonatomic, strong) NSMutableArray *downLoadedAdvs;

@property (nonatomic, strong) NSTimer *playTimer;                        //

@end

@implementation YQAdvCircleView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self step];
    }
    return self;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    
    [self step];
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)step{
    self.clipsToBounds = YES;
    
    [self addSubview:self.bgImageView];
    [self addSubview:self.conllectionView];
    [self addSubview:self.pageControl];
    [self.pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@0);
        make.centerX.equalTo(self);
        make.width.lessThanOrEqualTo(self);
    }];
    
    self.playTimeSpace = 2;
    self.autoPlay = YES;
}

#pragma mark - getter
- (UIImageView *)bgImageView
{
    if (!_bgImageView) {
        _bgImageView = [[UIImageView alloc] initWithFrame:self.bounds];
        _bgImageView.backgroundColor = [UIColor clearColor];
        _bgImageView.image = self.bgImage;
        _bgImageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    }
    return _bgImageView;
}

- (UICollectionView *)conllectionView
{
    if (!_conllectionView) {
        
        UICollectionViewFlowLayout *collectionViewLayout = [[UICollectionViewFlowLayout alloc] init];
        collectionViewLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        collectionViewLayout.minimumLineSpacing = 0;
        collectionViewLayout.sectionInset = UIEdgeInsetsZero;
        
        _conllectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:collectionViewLayout];
        _conllectionView.backgroundColor = [UIColor clearColor];
        _conllectionView.directionalLockEnabled = YES;
        _conllectionView.showsHorizontalScrollIndicator = NO;
        _conllectionView.showsVerticalScrollIndicator = NO;
        _conllectionView.pagingEnabled = YES;
        _conllectionView.dataSource = self;
        _conllectionView.delegate = self;
        _conllectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        
        [_conllectionView registerClass:[YQAdvCircleCollectionViewCell class] forCellWithReuseIdentifier:YQAdvCircleCollectionViewCellIdentity];
    }
    return _conllectionView;
}

- (UIPageControl *)pageControl
{
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] init];
        _pageControl.backgroundColor = [UIColor clearColor];
        _pageControl.pageIndicatorTintColor = [UIColor colorWithRed:102.0/255 green:102.0/255 blue:102.0/255 alpha:0.8];
        _pageControl.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _pageControl;
}


- (NSMutableArray *)downLoadedAdvs{
    if (!_downLoadedAdvs) {
        _downLoadedAdvs = [NSMutableArray array];
    }
    return _downLoadedAdvs;
}

- (NSArray *)groups{
    if (!_groups) {
        _groups = [NSMutableArray arrayWithObjects:self.downLoadedAdvs, self.downLoadedAdvs, self.downLoadedAdvs, self.downLoadedAdvs, self.downLoadedAdvs, nil];
    }
    return _groups;
}

#pragma mark - setting
- (void)setBgImage:(UIImage *)bgImage{
    _bgImage = bgImage;
    self.bgImageView.image = bgImage;
}

- (void)setAdvs:(NSArray<NSString *> *)advs{
    _advs = [advs copy];
    [self.downLoadedAdvs removeAllObjects];
    [self reloadData];
    
    for (NSString *adv in advs) {
        [[SDWebImageManager sharedManager] downloadImageWithURL:[NSURL URLWithString:adv] options:SDWebImageLowPriority progress:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
            if (image && [self.advs containsObject:adv]) {
                [self insertDownLoadedAdv:adv];
            }
        }];
    }
}

- (void)setCurrentIndex:(NSInteger)currentIndex{
    [self setCurrentIndex:currentIndex animation:NO];
}

- (void)setAutoPlay:(BOOL)autoPlay{
    _autoPlay = autoPlay;
    
    if (autoPlay) {
        [self.playTimer invalidate];
        self.playTimer = [NSTimer scheduledTimerWithTimeInterval:self.playTimeSpace target:self selector:@selector(playTimerAction:) userInfo:nil repeats:YES];
    }else{
        [self.playTimer invalidate];
    }
}

#pragma mark - private
- (NSInteger)centerSection{
    return self.groups.count / 2;
}

- (void)insertDownLoadedAdv:(NSString *)adv{
    NSInteger index = [self.advs indexOfObject:adv];
    if (index != NSNotFound) {
        NSInteger insertIndex = self.downLoadedAdvs.count;
        for (NSString *downloadedAdv in self.downLoadedAdvs) {
            NSInteger downLoadIndex = [self.advs indexOfObject:downloadedAdv];
            if (downLoadIndex > index) {
                insertIndex = [self.downLoadedAdvs indexOfObject:downloadedAdv];
                break;
            }
        }
        //[self insertDownLoadedAdv:adv atIndex:insertIndex];
        [self.downLoadedAdvs insertObject:adv atIndex:insertIndex];
        [self reloadData];
    }
}

- (void)setCurrentIndex:(NSInteger)currentIndex animation:(BOOL)animation{
    if (currentIndex >= 0 && currentIndex < self.advs.count) {
        NSString *adv = [self.advs objectAtIndex:currentIndex];
        
        if ([self.downLoadedAdvs containsObject:adv]) {
            _currentIndex = currentIndex;
            [self updatePageControlValue];
            
            NSIndexPath *shouldDisplayIndexPath = [NSIndexPath indexPathForRow:[self.downLoadedAdvs indexOfObject:adv] inSection:[self centerSection]];
            [self scrollToItemAtIndexPath:shouldDisplayIndexPath atScrollPosition:UICollectionViewScrollPositionRight animated:NO];
        }
    }
}

- (void)updatePageControlValue{
    self.pageControl.numberOfPages = self.downLoadedAdvs.count;
    
    NSString *currentAdv = nil;
    if (self.currentIndex >= 0 && self.currentIndex < self.advs.count) {
        currentAdv = [self.advs objectAtIndex:self.currentIndex];
    }
    NSInteger currentPage = [self.downLoadedAdvs indexOfObject:currentAdv];
    if (currentPage != NSNotFound) {
        self.pageControl.hidden = NO;
        self.pageControl.currentPage = currentPage;
    }else{
        self.pageControl.hidden = YES;
    }
}

- (void)scrollToItemAtIndexPath:(NSIndexPath *)indexPath atScrollPosition:(UICollectionViewScrollPosition)scrollPosition animated:(BOOL)animated{
    [self.conllectionView scrollToItemAtIndexPath:indexPath atScrollPosition:scrollPosition animated:animated];
    
    // ios7需要刷新，否则，不会回调cell，也不会改变visitleIndex
    if ([UIDevice currentDevice].systemVersion.floatValue < 8.0) {
        [self.conllectionView reloadItemsAtIndexPaths:[NSArray arrayWithObject:indexPath]];
    }
}

#pragma mark - publik
- (void)reloadData{
    [self.conllectionView reloadData];
    self.currentIndex = self.currentIndex;
}

#pragma mark - action
- (void)playTimerAction:(NSTimer *)timer{
    NSIndexPath *displayingIndexPath = [[self.conllectionView indexPathsForVisibleItems] lastObject];
    if (displayingIndexPath) {
        NSIndexPath *shouldDiaplayIndexPath = nil;
        if (displayingIndexPath.item != self.downLoadedAdvs.count - 1) {
            shouldDiaplayIndexPath = [NSIndexPath indexPathForItem:displayingIndexPath.item + 1 inSection:displayingIndexPath.section];
        }else{
            if (displayingIndexPath.section != self.groups.count - 1) {
                shouldDiaplayIndexPath = [NSIndexPath indexPathForItem:0 inSection:displayingIndexPath.section + 1];
            }else{
                shouldDiaplayIndexPath = [NSIndexPath indexPathForItem:0 inSection:[self centerSection]];
            }
        }
        
        [self scrollToItemAtIndexPath:shouldDiaplayIndexPath atScrollPosition:UICollectionViewScrollPositionRight animated:YES];
    }
}

#pragma mark - UICollectionViewDelegate
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return collectionView.bounds.size;
}

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    // 显示着的indextPath
    NSIndexPath *displayingIndexPath = [[collectionView indexPathsForVisibleItems] lastObject];
    if (displayingIndexPath) {
        NSString *displayAdv = nil;
        if (displayingIndexPath.item >= 0 && displayingIndexPath.item < self.downLoadedAdvs.count) {
            displayAdv = [self.downLoadedAdvs objectAtIndex:displayingIndexPath.item];
        }
        NSInteger currentIndex = [self.advs indexOfObject:displayAdv];
        if (displayingIndexPath.section != [self centerSection] || self.currentIndex != currentIndex) {
            self.currentIndex = currentIndex;
        }
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    if (self.didClickAdv) {
        self.didClickAdv(self.downLoadedAdvs[indexPath.item ]);
    }
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.groups.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.downLoadedAdvs.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    YQAdvCircleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:YQAdvCircleCollectionViewCellIdentity forIndexPath:indexPath];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:self.downLoadedAdvs[indexPath.item]]];
    
    return cell;
}

#pragma mark - UIScrollerViewDelegate

- (void)scrollViewDidEndDecelerating:(UICollectionView *)scrollView
{
    [self.playTimer setFireDate:[NSDate dateWithTimeIntervalSinceNow:self.playTimeSpace]];
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    [self.playTimer setFireDate:[NSDate distantFuture]];
}

@end
