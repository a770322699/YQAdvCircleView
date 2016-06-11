//
//  YQAdvCircleViewController.m
//  YQAdvCircleViewDemo
//
//  Created by maygolf on 16/6/11.
//  Copyright © 2016年 yiquan. All rights reserved.
//

#import "YQAdvCircleViewController.h"

#import "YQAdvCircleView.h"

@interface YQAdvCircleViewController ()

@property (weak, nonatomic) IBOutlet YQAdvCircleView *advView;

@end

@implementation YQAdvCircleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSMutableArray *advs = [NSMutableArray array];
    [advs addObject:@"http://pic.qiantucdn.com/images/slideshow/575688bd4c963.png"];
    [advs addObject:@"http://pic.qiantucdn.com/images/slideshow/57563b83efaa5.jpg"];
    [advs addObject:@"http://pic.qiantucdn.com/images/slideshow/574b9de29342c.jpg"];
    [advs addObject:@"http://pic.qiantucdn.com/images/slideshow/5750fd4db2206.jpg"];
    [advs addObject:@"http://pic.qiantucdn.com/images/slideshow/567b4c8bbc861.png"];
    [advs addObject:@"http://pic.qiantucdn.com/images/slideshow/5732916b55a93.jpg"];
    [advs addObject:@"http://pic.qiantucdn.com/images/slideshow/574e40db14289.jpg"];
    [advs addObject:@"http://pic.qiantucdn.com/images/slideshow/574fea0095e3d.png"];
    [advs addObject:@"http://pic.qiantucdn.com/images/slideshow/5750fd4db2206.jpg"];
    [advs addObject:@"http://img1.imgtn.bdimg.com/it/u=2754020538,457070563&fm=21&gp=0.jpg"];
    
    self.advView.advs = advs;
    [self.advView setDidClickAdv:^(NSString *adv) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
