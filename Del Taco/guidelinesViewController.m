//
//  guidelinesViewController.m
//  Del Taco
//
//  Created by iOSDev on 8/10/15.
//  Copyright (c) 2015 United Tax. All rights reserved.
//

#import "guidelinesViewController.h"

@interface guidelinesViewController ()

@end

@implementation guidelinesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [Utils setupLogo:self.view];
    [self loadGuidelines];
    [self setUpLoginButton];
    NSLog(@"hi"); 
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) loadGuidelines {
    CGFloat xMargin = .35*[Utils getScreenWidth];
    CGFloat verticalPaddingGuidelines = (50/1136.0)*[Utils getScreenHeight];
    CGFloat yMarginFromTop = [Utils getYMarginLogo] + [Utils getLogoHeight];
    CGRect guidelinesRect = CGRectMake(xMargin, yMarginFromTop, [Utils getScreenWidth]-2*xMargin, [Utils getScreenHeight] - 2*verticalPaddingGuidelines - yMarginFromTop);
    UIImageView *guidelines = [[UIImageView alloc] initWithFrame:guidelinesRect];
    [guidelines setImage:[UIImage imageNamed:@"guidelines"]];
    [self.view addSubview:guidelines];
}


- (void) setUpLoginButton {
    if ([Utils getLoggedIn]) [self.loginOrOutButton setTitle:@"Log out"];
    else [self.loginOrOutButton setTitle:@"Log in"];
}




- (IBAction)loginOrOutAction:(id)sender {
    if ([Utils getLoggedIn]) {
       [self performSegueWithIdentifier:@"guidelinesToLogoutSegue" sender:self];
        [Utils setLoggedIn:NO];
    } else {
        [self performSegueWithIdentifier:@"guidelinesToLoginSegue" sender:self];
        [Utils setLoggedIn:NO];
    }
    
    
    
    
}
@end
