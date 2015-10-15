//
//  displayScreenViewController.h
//  Del Taco
//
//  Created by iOSDev on 9/25/15.
//  Copyright (c) 2015 United Tax. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Utils.h"
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
@property (weak, nonatomic) IBOutlet UILabel *drinkTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *drinkTimeEndingSoon1;
@property (weak, nonatomic) IBOutlet UILabel *drinkTimeEndingSoon2;
@property (weak, nonatomic) IBOutlet UILabel *drinkTimeEndingSoon3;
@property (weak, nonatomic) IBOutlet UILabel *drinkTimeEndingSoon4;
@property (weak, nonatomic) IBOutlet UILabel *drinkTimeEndingSoon5;
@property (weak, nonatomic) IBOutlet UILabel *tacoBarLabel;
@property (weak, nonatomic) IBOutlet UILabel *tacoBarEndingSoon1;
@property (weak, nonatomic) IBOutlet UILabel *tacoBarEndingSoon2;
@property (weak, nonatomic) IBOutlet UILabel *tacoBarEndingSoon3;
@property (weak, nonatomic) IBOutlet UILabel *tacoBarEndingSoon4;
@property (weak, nonatomic) IBOutlet UILabel *tacoBarEndingSoon5;
@property (weak, nonatomic) IBOutlet UILabel *tacoBarEndingSoon6;
@property (weak, nonatomic) IBOutlet UILabel *tacoBarEndingSoon7;
@property (weak, nonatomic) IBOutlet UILabel *tacoBarEndingSoon8;
@property (weak, nonatomic) IBOutlet UILabel *tacoBarEndingSoon9;
@property (weak, nonatomic) IBOutlet UILabel *tacoBarEndingSoon10;
@property (weak, nonatomic) IBOutlet UILabel *tacoBarEndingSoon11;
@property (weak, nonatomic) IBOutlet UILabel *tacoBarEndingSoon12;
@property (weak, nonatomic) IBOutlet UILabel *tacoBarEndingSoon13;
@property (weak, nonatomic) IBOutlet UILabel *tacoBarEndingSoon14;
@property (weak, nonatomic) IBOutlet UILabel *tacoBarEndingSoon15;

@property (strong, nonatomic) NSString * goalText;
@property (strong, nonatomic) NSString * winLoseText;
@property (strong, nonatomic) NSString * lunchText;
@property (strong, nonatomic) NSString * dayText;
@property (strong, nonatomic) NSString * dinnerText;
@property (strong, nonatomic) NSString * graveyardText;
@property (strong, nonatomic) NSString * lastYearSaleText;
@property (strong, nonatomic) NSString * itemName;
@property (strong, nonatomic) NSString * itemDate;
@end
