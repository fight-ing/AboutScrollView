//
//  LFDrawView.m
//  ScrollViewTestDemo
//
//  Created by fei on 14-7-7.
//  Copyright (c) 2014年 self. All rights reserved.
//

#import "LFDrawView.h"

@implementation LFDrawView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        imgArray = [[NSMutableArray alloc] initWithCapacity:0];
        for (int i = 0; i<5; i++) {
            
            NSString *imgName = [[NSString alloc] initWithFormat:@"%d",i+1];
            imgName = [imgName stringByAppendingString:@".jpg"];
            UIImage * img = [UIImage imageNamed:imgName];
            [imgArray addObject:img];
        }
    }
    return self;
}
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGContextRotateCTM(context, M_PI);
    CGContextTranslateCTM(context, -320*5, -480);
    for(int i = 0; i< 5 ;i++)
    {
        UIImage * img = [imgArray objectAtIndex:i];
        CGImageRef image = img.CGImage;
        CGRect touchRect = CGRectMake(320*i, 0, 320, 480);
        if (image != nil) {
            CGContextDrawImage(context, touchRect, image);
        }
    }
    CGContextRestoreGState(context);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
