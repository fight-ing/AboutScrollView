//
//  LFScaleViewVC.h
//  ScrollViewTestDemo
//
//  Created by fei on 14-7-7.
//  Copyright (c) 2014年 self. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LFScaleViewVC : UIViewController <UIScrollViewDelegate,UIGestureRecognizerDelegate>
{
    float offSet;
}
@property (nonatomic,retain) UIScrollView *imageScrollView;

@end
