//
//  DeploymentViewController.m
//  Del Taco
//
//  Created by iOSDev on 8/26/15.
//  Copyright (c) 2015 United Tax. All rights reserved.
//

#import "DeploymentViewController.h"

@interface DeploymentViewController ()

@end

@implementation DeploymentViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    UIImage* image = [UIImage imageNamed:@"deployment"];
    
    NSAssert(image, @"image must not be nil."
             "Check that you added the image to your bundle and that "
             "the filename above matches the name of your image.");
    
    self.imageView.image = image;
    //[self.imageView sizeToFit];
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;

    //_background = [[UIView alloc] initWithFrame:CGRectMake(0,0,[UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    //self.scrollView.contentSize = image.size;
    //self.scrollView.delegate = self;
    //self.scrollView.minimumZoomScale = 1.0;
   // self.scrollView.maximumZoomScale = 6.0;
    NSLog(@"hi");

}

//- (void)view:(UIView*)view setCenter:(CGPoint)centerPoint
//{
//    CGRect vf = view.frame;
//    CGPoint co = self.scrollView.contentOffset;
//    
//    CGFloat x = centerPoint.x - vf.size.width / 2.0;
//    CGFloat y = centerPoint.y - vf.size.height / 2.0;
//    
//    if(x < 0)
//    {
//        co.x = -x;
//        vf.origin.x = 0.0;
//    }
//    else
//    {
//        vf.origin.x = x;
//    }
//    if(y < 0)
//    {
//        co.y = -y;
//        vf.origin.y = 0.0;
//    }
//    else
//    {
//        vf.origin.y = y;
//    }
//    
//    view.frame = vf;
//    self.scrollView.contentOffset = co;
//}
//
//
//- (UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView
//{
//    return self.imageView;
//}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
//    CGPoint centerPoint = CGPointMake(CGRectGetMidX(self.scrollView.bounds),
//                                      CGRectGetMidY(self.scrollView.bounds));
//    [self view:self.imageView setCenter:centerPoint];
}

//- (void)scrollViewDidZoom:(UIScrollView *)sv
//{
//    UIView* zoomView = [sv.delegate viewForZoomingInScrollView:sv];
//    CGRect zvf = zoomView.frame;
//    if(zvf.size.width < sv.bounds.size.width)
//    {
//        zvf.origin.x = (sv.bounds.size.width - zvf.size.width) / 2.0;
//    }
//    else
//    {
//        zvf.origin.x = 0.0;
//    }
//    if(zvf.size.height < sv.bounds.size.height)
//    {
//        zvf.origin.y = (sv.bounds.size.height - zvf.size.height) / 2.0;
//    }
//    else
//    {
//        zvf.origin.y = 0.0;
//    }
//    zoomView.frame = zvf;
//}

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

- (IBAction)home:(id)sender {
    [self performSegueWithIdentifier:@"deployment.modal.segue" sender:self];
}
@end
