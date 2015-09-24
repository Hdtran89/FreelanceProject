//
//  logoutConfViewController.m
//  Del Taco
//
//  Created by iOSDev on 9/3/15.
//  Copyright (c) 2015 United Tax. All rights reserved.
//

#import "logoutConfViewController.h"

@interface logoutConfViewController ()

@end

@implementation logoutConfViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[Utils DT_YELLOW]];

    
    
    UILabel *conf = [[UILabel alloc] initWithFrame:CGRectMake(0, .4*[Utils getScreenHeight], [Utils getScreenWidth], .6*[Utils getScreenHeight])];
    [conf setText:@"You have successfully signed out. Thank you for using Del Taco."];
    [conf setTextAlignment:NSTextAlignmentCenter];
    [conf setFont:[UIFont fontWithName:@"Helvetica-Light" size:16]];
    [self.view addSubview:conf];
    
    
    [self.backToAppBtn setBackgroundColor:[Utils DT_GREEN]];
    [self.backToAppBtn setTitle:@"Return to App" forState:UIControlStateNormal];
    [self.backToAppBtn setTitleColor:[Utils DT_WHITE] forState:UIControlStateNormal];
    
    
    [Utils setupLogo:self.view];
    // Do any additional setup after loading the view.
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

- (IBAction)backToAppAction:(id)sender {
    
    
    
}
@end
