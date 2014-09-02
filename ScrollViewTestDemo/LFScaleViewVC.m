//
//  LFScaleViewVC.m
//  ScrollViewTestDemo
//
//  Created by fei on 14-7-7.
//  Copyright (c) 2014年 self. All rights reserved.
//

#import "LFScaleViewVC.h"

@interface LFScaleViewVC ()
{

}
@end

@implementation LFScaleViewVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITapGestureRecognizer *doubleTap =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTap:)];
    [doubleTap setNumberOfTapsRequired:2];
    
    self.imageScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    self.imageScrollView.backgroundColor = [UIColor clearColor];
    self.imageScrollView.scrollEnabled = YES;
    self.imageScrollView.pagingEnabled = YES;
    self.imageScrollView.delegate = self;
    
    self.imageScrollView.contentSize = CGSizeMake(320*5, 480);
    
    for (int i = 0; i < 4; i ++){
         UITapGestureRecognizer *doubleTap =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTap:)];
         [doubleTap setNumberOfTapsRequired:2];
         
         UIScrollView *s = [[UIScrollView alloc] initWithFrame:CGRectMake(320*i, 0, 320, 480)];
         s.backgroundColor = [UIColor clearColor];
         s.contentSize = CGSizeMake(320, 480);
         s.delegate = self;
         s.minimumZoomScale = 1.0;
         s.maximumZoomScale = 3.0;
         //        s.tag = i+1;
         [s setZoomScale:1.0];
         
         UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
         NSString *imageName = [NSString stringWithFormat:@"guidepage%d.png",i + 1];
         imageview.image = [UIImage imageNamed:imageName];
         imageview.userInteractionEnabled = YES;
         imageview.tag = i+1;
         [imageview addGestureRecognizer:doubleTap];
         [s addSubview:imageview];
         [self.imageScrollView addSubview:s];
         
        
         }
         
         [self.view addSubview:self.imageScrollView];
         
         
}
#pragma mark - ScrollView delegate
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
 
     for (UIView *v in scrollView.subviews){
         return v;
     }
     return nil;
}

- (void)viewDidUnload
{
[super viewDidUnload];
// Release any retained subviews of the main view.
//nameArray =nil;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if(interfaceOrientation ==UIInterfaceOrientationPortrait||interfaceOrientation ==UIInterfaceOrientationPortraitUpsideDown)
    {
        return YES;
    }
    return NO;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
 
 if (scrollView == self.imageScrollView){
     CGFloat x = scrollView.contentOffset.x;
     if (x==offSet){
         
     }
     else {
         offSet = x;
         for (UIScrollView *s in scrollView.subviews){
             if ([s isKindOfClass:[UIScrollView class]]){
                 [s setZoomScale:1.0];
             }
         }
     }
 }
}

//- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(float)scale {
//    [scrollView setZoomScale:scale+1.0 animated:YES];
//    [scrollView setZoomScale:scale animated:YES];
//}
#pragma mark -
-(void)handleDoubleTap:(UIGestureRecognizer *)gesture{
 
//     float newScale = [(UIScrollView*)gesture.view.superview zoomScale] * 1.5;
//     CGRect zoomRect = [self zoomRectForScale:newScale  inView:(UIScrollView*)gesture.view.superview withCenter:[gesture locationInView:gesture.view]];
//     [(UIScrollView*)gesture.view.superview zoomToRect:zoomRect animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
