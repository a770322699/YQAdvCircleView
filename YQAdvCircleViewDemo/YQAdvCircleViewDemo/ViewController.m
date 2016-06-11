//
//  ViewController.m
//  YQAdvCircleViewDemo
//
//  Created by maygolf on 16/6/11.
//  Copyright © 2016年 yiquan. All rights reserved.
//

#import "ViewController.h"

#import "YQAdvCircleTableViewCell.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *advGroups;
@property (nonatomic, strong) NSMutableDictionary *currentIndex;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    
//    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://pic.qiantucdn.com/58pic/20/14/71/92r58PICdTc_1024.jpg"]];
//    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
//        
//        NSError *error = nil;
//        BOOL success = [data writeToURL:[NSURL fileURLWithPath:@"/Users/yanghy/Desktop/imageTest.jpg"] options:NSDataWritingAtomic error:&error];
//        NSLog(@"%d, %@", success, error);
//    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - getter
- (NSMutableDictionary *)currentIndex{
    if (!_currentIndex) {
        _currentIndex = [NSMutableDictionary dictionary];
    }
    return _currentIndex;
}

- (NSArray *)advGroups{
    if (!_advGroups) {
        NSMutableArray *advGroups = [NSMutableArray array];
        
        NSMutableArray *advs = [NSMutableArray array];
        [advs addObject:@"http://pic.qiantucdn.com/images/slideshow/575688bd4c963.png"];
        [advs addObject:@"http://pic.qiantucdn.com/images/slideshow/57563b83efaa5.jpg"];
        [advs addObject:@"http://pic.qiantucdn.com/images/slideshow/574b9de29342c.jpg"];
        [advs addObject:@"http://pic.qiantucdn.com/images/slideshow/5750fd4db2206.jpg"];
        [advs addObject:@"http://pic.qiantucdn.com/images/slideshow/567b4c8bbc861.png"];
        [advGroups addObject:advs];
        
        advs = [NSMutableArray array];
        [advs addObject:@"http://pic.qiantucdn.com/images/slideshow/5732916b55a93.jpg"];
        [advs addObject:@"http://pic.qiantucdn.com/images/slideshow/574e40db14289.jpg"];
        [advs addObject:@"http://pic.qiantucdn.com/images/slideshow/574fea0095e3d.png"];
        [advs addObject:@"http://pic.qiantucdn.com/images/slideshow/5750fd4db2206.jpg"];
        [advs addObject:@"http://img1.imgtn.bdimg.com/it/u=2754020538,457070563&fm=21&gp=0.jpg"];
        [advGroups addObject:advs];
        
        advs = [NSMutableArray array];
        [advs addObject:@"http://pic.qiantucdn.com/images/slideshow/575688bd4c963.png"];
        [advs addObject:@"http://pic.qiantucdn.com/images/slideshow/57563b83efaa5.jpg"];
        [advs addObject:@"http://pic.qiantucdn.com/images/slideshow/574b9de29342c.jpg"];
        [advs addObject:@"http://pic.qiantucdn.com/images/slideshow/5750fd4db2206.jpg"];
        [advs addObject:@"http://pic.qiantucdn.com/images/slideshow/567b4c8bbc861.png"];
        [advGroups addObject:advs];
        
        advs = [NSMutableArray array];
        [advs addObject:@"http://pic.qiantucdn.com/images/slideshow/5732916b55a93.jpg"];
        [advs addObject:@"http://pic.qiantucdn.com/images/slideshow/574e40db14289.jpg"];
        [advs addObject:@"http://pic.qiantucdn.com/images/slideshow/574fea0095e3d.png"];
        [advs addObject:@"http://pic.qiantucdn.com/images/slideshow/5750fd4db2206.jpg"];
        [advs addObject:@"http://img1.imgtn.bdimg.com/it/u=2754020538,457070563&fm=21&gp=0.jpg"];
        [advGroups addObject:advs];
        
        advs = [NSMutableArray array];
        [advs addObject:@"http://pic.qiantucdn.com/images/slideshow/575688bd4c963.png"];
        [advs addObject:@"http://pic.qiantucdn.com/images/slideshow/57563b83efaa5.jpg"];
        [advs addObject:@"http://pic.qiantucdn.com/images/slideshow/574b9de29342c.jpg"];
        [advs addObject:@"http://pic.qiantucdn.com/images/slideshow/5750fd4db2206.jpg"];
        [advs addObject:@"http://pic.qiantucdn.com/images/slideshow/567b4c8bbc861.png"];
        [advGroups addObject:advs];
        
        advs = [NSMutableArray array];
        [advs addObject:@"http://pic.qiantucdn.com/images/slideshow/5732916b55a93.jpg"];
        [advs addObject:@"http://pic.qiantucdn.com/images/slideshow/574e40db14289.jpg"];
        [advs addObject:@"http://pic.qiantucdn.com/images/slideshow/574fea0095e3d.png"];
        [advs addObject:@"http://pic.qiantucdn.com/images/slideshow/5750fd4db2206.jpg"];
        [advs addObject:@"http://img1.imgtn.bdimg.com/it/u=2754020538,457070563&fm=21&gp=0.jpg"];
        [advGroups addObject:advs];
        
        advs = [NSMutableArray array];
        [advs addObject:@"http://pic.qiantucdn.com/images/slideshow/575688bd4c963.png"];
        [advs addObject:@"http://pic.qiantucdn.com/images/slideshow/57563b83efaa5.jpg"];
        [advs addObject:@"http://pic.qiantucdn.com/images/slideshow/574b9de29342c.jpg"];
        [advs addObject:@"http://pic.qiantucdn.com/images/slideshow/5750fd4db2206.jpg"];
        [advs addObject:@"http://pic.qiantucdn.com/images/slideshow/567b4c8bbc861.png"];
        [advGroups addObject:advs];
        
        advs = [NSMutableArray array];
        [advs addObject:@"http://pic.qiantucdn.com/images/slideshow/5732916b55a93.jpg"];
        [advs addObject:@"http://pic.qiantucdn.com/images/slideshow/574e40db14289.jpg"];
        [advs addObject:@"http://pic.qiantucdn.com/images/slideshow/574fea0095e3d.png"];
        [advs addObject:@"http://pic.qiantucdn.com/images/slideshow/5750fd4db2206.jpg"];
        [advs addObject:@"http://img1.imgtn.bdimg.com/it/u=2754020538,457070563&fm=21&gp=0.jpg"];
        [advGroups addObject:advs];
        
        advs = [NSMutableArray array];
        [advs addObject:@"http://pic.qiantucdn.com/images/slideshow/575688bd4c963.png"];
        [advs addObject:@"http://pic.qiantucdn.com/images/slideshow/57563b83efaa5.jpg"];
        [advs addObject:@"http://pic.qiantucdn.com/images/slideshow/574b9de29342c.jpg"];
        [advs addObject:@"http://pic.qiantucdn.com/images/slideshow/5750fd4db2206.jpg"];
        [advs addObject:@"http://pic.qiantucdn.com/images/slideshow/567b4c8bbc861.png"];
        [advGroups addObject:advs];
        
        _advGroups = advGroups;
    }
    return _advGroups;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [UIScreen mainScreen].bounds.size.width / 3;
}

- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    YQAdvCircleTableViewCell *advCell = (YQAdvCircleTableViewCell *)cell;
    self.currentIndex[indexPath] = @(advCell.advView.currentIndex);
    advCell.advView.autoPlay = NO;
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.advGroups.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YQAdvCircleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"identity" forIndexPath:indexPath];
    cell.image_w_h = 1 / 3;
    cell.advView.advs = self.advGroups[indexPath.row];
    NSInteger index = [self.currentIndex[indexPath] integerValue];
    cell.advView.currentIndex = index ? index : indexPath.row;
    cell.advView.autoPlay = YES;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [cell.advView setDidClickAdv:^(NSString *adv) {
        [self performSegueWithIdentifier:@"segueIdentity" sender:nil];
    }];
    
    return cell;
}

@end
