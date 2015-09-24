//
//  LoginViewController.h
//  Del Taco
//
//  Created by iOSDev on 8/14/15.
//  Copyright (c) 2015 United Tax. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Utils.h"

@interface LoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *employeeIDField;
@property (weak, nonatomic) IBOutlet UITextField *pinField;
@property (weak, nonatomic) IBOutlet UIButton *logInButton;
@property (weak, nonatomic) IBOutlet UIButton *skipButton;
- (IBAction)skipClicked:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *disclaimerLabel;
- (IBAction)logInClicked:(id)sender;
@end
