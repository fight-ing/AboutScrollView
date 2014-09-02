//
//  LFViewController.m
//  ScrollViewTestDemo
//
//  Created by fei on 14-7-7.
//  Copyright (c) 2014年 self. All rights reserved.
//

#import "LFViewController.h"
#import "LFDrawView.h"
@interface LFViewController ()

@end

@implementation LFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadView];
    
}
- (void)loadView {
    
    mScrollView = [[UIScrollView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    mScrollView.backgroundColor = [UIColor whiteColor];
    mScrollView.delegate = self;
//    imageView = [[LFDrawView alloc] initWithFrame:mScrollView.frame];
//    imageView.backgroundColor = [UIColor greenColor];
    mScrollView.contentSize = CGSizeMake(320*5,480);
    mScrollView.pagingEnabled = YES;
//    imageView.frame = CGRectMake(0, 0, 320*5, 480);
//    [mScrollView addSubview:imageView];
    for (int i = 0; i < 4;  i ++) {
        UIImageView *imageViews = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString  stringWithFormat:@"guidepage%d.jpg",i+1]]];
        imageView.frame = CGRectMake(320*i, 0, 220, 280);
        imageView.userInteractionEnabled = YES;
        imageViews.tag = 300 + i;
        [mScrollView addSubview:imageViews];
        
    }
    mScrollView.minimumZoomScale = 1.0;
    mScrollView.maximumZoomScale = 3.0;
    [mScrollView setZoomScale:mScrollView.minimumZoomScale];
    self.view = mScrollView;
}
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    int index = (int)(scrollView.contentOffset.x/320);
    UIImageView *imgV = (UIImageView *)[mScrollView viewWithTag:300+index];
    return imgV;
}
-(void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale {
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
