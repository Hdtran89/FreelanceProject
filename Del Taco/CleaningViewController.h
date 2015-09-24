//
//  CleaningViewController.h
//  Del Taco
//
//  Created by iOSDev on 8/11/15.
//  Copyright (c) 2015 United Tax. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Utils.h" 


@interface CleaningViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate> 

@property bool isDaily;
@property bool isQuarterly;
@property (weak, nonatomic) IBOutlet UIPickerView *weekPicker;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
- (IBAction)segmentSwitch:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *showBtn;
- (IBAction)showBtnPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *cleaningTasks; 

@end
