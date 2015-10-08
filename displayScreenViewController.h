//
//  displayScreenViewController.h
//  Del Taco
//
//  Created by iOSDev on 9/25/15.
//  Copyright (c) 2015 United Tax. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Utils.h"
#import "RedTimes.h"
#import "Speed.h"
#import "Sales.h"
#import <QuartzCore/QuartzCore.h>
#import "redTimeViewController.h"
#import "StatisticsViewController.h"

@interface displayScreenViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *speedLabel;
@property (weak, nonatomic) IBOutlet UILabel *goalLabel;
@property (weak, nonatomic) IBOutlet UILabel *winLoseLabel;
@property (weak, nonatomic) IBOutlet UILabel *serviceLabel;
@property (weak, nonatomic) IBOutlet UILabel *lunchLabel;
@property (weak, nonatomic) IBOutlet UILabel *dayLabel;
@property (weak, nonatomic) IBOutlet UILabel *dinnerLabel;
@property (weak, nonatomic) IBOutlet UILabel *graveyardLabel;
@property (weak, nonatomic) IBOutlet UILabel *saleLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastYearSaleLabel;
@property (weak, nonatomic) IBOutlet UILabel *prepTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *prepTimeEndingSoon1;
@property (weak, nonatomic) IBOutlet UILabel *prepTimeEndingSoon2;
@property (weak, nonatomic) IBOutlet UILabel *prepTimeEndingSoon3;
@property (weak, nonatomic) IBOutlet UILabel *prepTimeEndingSoon4;
@property (weak, nonatomic) IBOutlet UILabel *prepTimeEndingSoon5;
@property (weak, nonatomic) IBOutlet UILabel *tacoBarLabel;
@property (weak, nonatomic) IBOutlet UILabel *tacoBarEndingSoon1;
@property (weak, nonatomic) IBOutlet UILabel *tacoBarEndingSoon2;
@property (weak, nonatomic) IBOutlet UILabel *tacoBarEndingSoon3;
@property (weak, nonatomic) IBOutlet UILabel *tacoBarEndingSoon4;
@property (weak, nonatomic) IBOutlet UILabel *tacoBarEndingSoon5;

-(RedTimes *)dataRedTimeFromController;
-(Speed *)speedDataFromController;
-(Sales *)saleDataFromController;

@end
