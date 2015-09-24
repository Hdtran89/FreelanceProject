//
//  LoginViewController.m
//  Del Taco
//
//  Created by iOSDev on 8/14/15.
//  Copyright (c) 2015 United Tax. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController () {
    CGPoint center;
}

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[Utils DT_YELLOW]]; 
    [Utils setupLogo:self.view];
    // Do any additional setup after loading the view.
    
    
    self.employeeIDField.placeholder = @"User ID";
    self.pinField.placeholder = @"Password";
    [self.pinField setSecureTextEntry:YES];
    [self.pinField setTextAlignment:NSTextAlignmentCenter];
    [self.employeeIDField setTextAlignment:NSTextAlignmentCenter];
    [self.logInButton setTitle:@"Log In" forState:UIControlStateNormal];
    [self.skipButton setTitle:@"Skip" forState:UIControlStateNormal];

    [self formatButtons: (self.logInButton)];
    [self formatButtons: (self.skipButton)];

    [self.disclaimerLabel setTextAlignment:NSTextAlignmentCenter];
    [self.disclaimerLabel setText: @"This app is exclusively for employees of Del Taco. Please refrain from using if you are not authorized to use this app from your supervisor."];
    [self.disclaimerLabel setFont:[UIFont systemFontOfSize:12]];
    [self.disclaimerLabel setLineBreakMode:NSLineBreakByWordWrapping];
    [self.disclaimerLabel setNumberOfLines:0];
    [self.disclaimerLabel setTintColor:[Utils DT_RED]];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    center = CGPointMake(self.view.center.x
                         , self.view.center.y);
    
}


- (void)keyboardDidShow:(NSNotification *)note {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.2];
    //     drinkAndTacoFrame = CGRectMake(xMargin, yMarginTop, totalEffectiveWidth, totalEffectiveHeight)
    self.view.center = CGPointMake(center.x, center.y-50);
    [UIView commitAnimations];
    /* keyboard is visible, move views */
}


- (void)keyboardDidHide:(NSNotification *)note {
    /* resign first responder, hide keyboard, move views */
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.2];
    //     drinkAndTacoFrame = CGRectMake(xMargin, yMarginTop, totalEffectiveWidth, totalEffectiveHeight)
    self.view.center = CGPointMake(center.x, center.y);
    [UIView commitAnimations];
}




- (void) formatButtons: (UIButton*) button {
    [button.titleLabel setFont:[UIFont systemFontOfSize:12]];
    [button.titleLabel setTintColor:[Utils DT_RED]];
    
    [button setBackgroundColor:[Utils DT_ORANGE]];

}

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

- (IBAction)skipClicked:(id)sender {
    [Utils setLoggedIn:NO];
}



- (IBAction)logInClicked:(id)sender {
    BOOL loginSuccessful = YES;
    if ([self.employeeIDField.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"Please input your employee ID"
                                                       delegate:nil
                                              cancelButtonTitle:@"Okay"
                                              otherButtonTitles:nil, nil];
        loginSuccessful = NO;
        [alert show];
    } else if ([self.pinField.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"Please input your PIN number. This is the last 4 digits of your SSN."
                                                       delegate:nil
                                              cancelButtonTitle:@"Okay"
                                              otherButtonTitles:nil, nil];
        loginSuccessful = NO;
        [alert show];
    } //next check to make sure that the credentials match
    else if (!([self.employeeIDField.text isEqualToString:@"admin"] && [self.pinField.text isEqualToString:@"deltacoadmin"])) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"Username did not match password. Contact supervisor or try again." delegate:nil
                                              cancelButtonTitle:@"Okay"
                                              otherButtonTitles:nil, nil];
        loginSuccessful = NO;
        [alert show];
    }
    
    [Utils setLoggedIn:loginSuccessful];
    
    if ([Utils getLoggedIn]) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isLoggedIn"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [self performSegueWithIdentifier:@"loginToMainSegue" sender:self];
    }
    
    
    
}
@end
