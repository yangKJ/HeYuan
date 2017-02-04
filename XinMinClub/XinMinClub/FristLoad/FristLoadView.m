//
//  FristLoadView.m
//  XinMinClub
//
//  Created by 杨科军 on 2017/2/4.
//  Copyright © 2017年 yangkejun. All rights reserved.
//

#import "FristLoadView.h"
#import "UIImage+GIF.h"

@interface FristLoadView()<UIGestureRecognizerDelegate>

@property(nonatomic,strong) UIImageView *kj_imageView;

@end

@implementation FristLoadView

- (void)useToWhere:(NSString*)where{
    [[self appRootViewController].view addSubview:self.kj_imageView];
    if ([where isEqualToString:@"bagua"]) {
        NSURL *url = [NSURL URLWithString:@"http://www.kingwant.com/Images/ba_gua.gif"];
        NSData *kj_data = [NSData dataWithContentsOfURL:url];
        UIImage *kj_image = [UIImage sd_animatedGIFWithData:kj_data];
        self.kj_imageView.image = kj_image;
    }
    if ([where isEqualToString:@"rushidao"]) {
        NSURL *url = [NSURL URLWithString:@"http://www.kingwant.com/Images/ru_shi_dao.gif"];
        NSData *kj_data = [NSData dataWithContentsOfURL:url];
        UIImage *kj_image = [UIImage sd_animatedGIFWithData:kj_data];
        self.kj_imageView.image = kj_image;
    }
    if ([where isEqualToString:@"jiugongge"]) {
        NSURL *url = [NSURL URLWithString:@"http://www.kingwant.com/Images/jiu_gong_ge.gif"];
        NSData *kj_data = [NSData dataWithContentsOfURL:url];
        UIImage *kj_image = [UIImage sd_animatedGIFWithData:kj_data];
        self.kj_imageView.image = kj_image;
    }
}

- (UIViewController *)appRootViewController{
    UIViewController *appRootVC=[UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *topVC=appRootVC;
    while(topVC.presentedViewController) {
        topVC = topVC.presentedViewController;
    }
    return topVC;
}

- (UIImageView*)kj_imageView{
    if (!_kj_imageView) {
        _kj_imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _kj_imageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *ges = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backTap)];
        ges.delegate = self;
        [_kj_imageView addGestureRecognizer:ges];
    }
    return _kj_imageView;
}

#pragma mark Action
- (void)backTap {
    // 动画效果
    [UIView animateWithDuration:0.45 delay:0.1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.kj_imageView.alpha = 0;
    } completion:^(BOOL finished) {
//        NSLog(@"%d",finished);
        if (finished) {
            [self.kj_imageView removeFromSuperview];
        }else{
            self.kj_imageView.alpha = 1;
        }
    }];
    
}

@end
