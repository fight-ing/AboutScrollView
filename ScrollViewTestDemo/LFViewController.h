//
//  LFViewController.h
//  ScrollViewTestDemo
//
//  Created by fei on 14-7-7.
//  Copyright (c) 2014年 self. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LFDrawView.h"
@interface LFViewController : UIViewController <UIScrollViewDelegate>
{
    UIScrollView *mScrollView;
    LFDrawView *imageView;
}
@end
