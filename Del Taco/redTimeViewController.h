//
//  redTimeViewController.h
//  Del Taco
//
//  Created by iOSDev on 8/11/15.
//  Copyright (c) 2015 United Tax. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Utils.h" 
#import <MessageUI/MessageUI.h>
#import "RedTimes.h"
#import "displayScreenViewController.h"
//@protocol sendDataProtocol <NSObject>
//-(void) sendDataToDisplayScreen:(NSMutableDictionary *) redData;
//@end
@class RedTimes;
@protocol RedTimeDelegate <NSObject>
-(RedTimes *) dataRedTimeFromController;
@end

@interface redTimeViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, UIGestureRecognizerDelegate, UIApplicationDelegate, MFMailComposeViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
- (IBAction)segmentSwitch:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *table;
@property (copy, nonatomic) NSArray *prepRedTimeChartItems;
@property (copy, nonatomic) NSArray *prepRedTimeChartTimes;
@property (strong, nonatomic) UIWindow *window;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *refreshBtn;

- (IBAction)sendReport:(id)sender;
- (IBAction)refreshAction:(id)sender;

@property (strong, nonatomic)NSManagedObjectContext * managedObjectContext;

@property (nonatomic, strong) id<RedTimeDelegate> redTimeDelegate;

//-(void)passDataBackward;
@end
