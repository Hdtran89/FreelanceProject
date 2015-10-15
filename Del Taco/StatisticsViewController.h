//
//  StatisticsViewController.h
//  Del Taco
//
//  Created by iOSDev on 8/28/15.
//  Copyright (c) 2015 United Tax. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Utils.h"
#import <MessageUI/MessageUI.h>
#import "AppDelegate.h"
#import "displayScreenViewController.h"
@class Speed, Sales;

@protocol StatisticDelegate <NSObject>
-(Speed *)speedDataFromController;
-(Sales *)saleDataFromController;
@end

@interface StatisticsViewController : UIViewController <UIGestureRecognizerDelegate, UITextFieldDelegate, MFMailComposeViewControllerDelegate, UIAlertViewDelegate,UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
- (IBAction)segmentSwitch:(id)sender;
- (IBAction)sendReport:(id)sender;
@property (strong, nonatomic) UIWindow *window;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *reportButton;
- (IBAction)refreshAction:(id)sender;

@property(nonatomic, strong) id<StatisticDelegate> statisticDelegate;

@end
