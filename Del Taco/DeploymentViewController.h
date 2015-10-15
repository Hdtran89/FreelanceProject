//
//  DeploymentViewController.h
//  Del Taco
//
//  Created by iOSDev on 8/26/15.
//  Copyright (c) 2015 United Tax. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Utils.h"

@interface DeploymentViewController : UIViewController <UIScrollViewDelegate> 

@property (nonatomic, weak) IBOutlet UIScrollView *scrollView;
@property (nonatomic, weak) IBOutlet UIImageView *imageView;

- (void)view:(UIView*)view setCenter:(CGPoint)centerPoint;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *homeButton;
- (IBAction)home:(id)sender;

@end
