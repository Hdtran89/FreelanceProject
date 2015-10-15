//
//  guidelinesViewController.h
//  Del Taco
//
//  Created by iOSDev on 8/10/15.
//  Copyright (c) 2015 United Tax. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Utils.h"


@interface guidelinesViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIBarButtonItem *loginOrOutButton;
- (IBAction)loginOrOutAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *logo;
@property (weak, nonatomic) IBOutlet UIImageView *guideline;
- (IBAction)home:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *homeButton;


@end
