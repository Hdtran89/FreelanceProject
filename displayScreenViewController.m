//
//  displayScreenViewController.m
//  Del Taco
//
//  Created by iOSDev on 9/25/15.
//  Copyright (c) 2015 United Tax. All rights reserved.
//
//@protocol RedTimeDelegate;
//@class redTimeViewController;

//@protocol StatisticDelegate;
//@class StatisticsViewController;


#import "displayScreenViewController.h"

@interface displayScreenViewController()<RedTimeDelegate , StatisticDelegate>{
    UILabel * speed;
    UILabel * redTimes;
    UILabel * tacoBar;
    UILabel * goal;
    UILabel * service;
    UILabel * sale;
    
    CGFloat xMargin;
    CGFloat yMargin;
    CGFloat totalEffectiveWidth;
    CGFloat totalEffectiveHeight;
    CGFloat WidthScreen;
    CGFloat HeightScreen;
    CGFloat widthOfSpeedColumn;
    CGFloat widthOfPrepColumn;
    CGFloat widthOfTacoBarColumn;
    
    CGFloat xOffSetC1;
    CGFloat xOffSetC2;
    CGFloat xOffSetC3;
    CGFloat xOffSetC4;
    
    CGFloat yOffSetR1;
    CGFloat yOffSetR2;
    CGFloat yOffSetR3;
    CGFloat yOffSetR4;
    CGRect viewFrame;
    
    NSMutableArray * yOffSets;
    NSMutableArray * xOffSets;
    
    NSMutableArray * speedColumm;
    NSMutableArray * prepTimeColumn;
    NSMutableArray * tacoBarColumn;
    //UIView * customView;
}
@end

@implementation displayScreenViewController


-(void)viewDidLoad {
//    WidthScreen = [Utils getScreenWidth];
//    HeightScreen = [Utils getScreenHeight];
//    xMargin = .02 * WidthScreen;
//    yMargin = .02 * HeightScreen;
//    totalEffectiveHeight = HeightScreen - yMargin*2;
//    totalEffectiveWidth = WidthScreen - xMargin*2;
//    
//    viewFrame = CGRectMake(xMargin, yMargin, totalEffectiveWidth, totalEffectiveHeight);
//
    UITabBarItem * tabBarItem = [[UITabBarItem alloc]initWithTitle:@"" image:[UIImage imageNamed:@"displayTab"] tag:1];
    self.tabBarItem = tabBarItem;
    self.goalLabel.hidden = YES;
    self.winLoseLabel.hidden = YES;
    self.lunchLabel.hidden = YES;
    self.dayLabel.hidden = YES;
    self.dinnerLabel.hidden = YES;
    self.graveyardLabel.hidden = YES;
    self.lastYearSaleLabel.hidden = YES;
    self.prepTimeEndingSoon1.hidden = YES;
    self.prepTimeEndingSoon2.hidden = YES;
    self.prepTimeEndingSoon3.hidden = YES;
    self.prepTimeEndingSoon4.hidden = YES;
    self.prepTimeEndingSoon5.hidden = YES;
    self.tacoBarEndingSoon1.hidden = YES;
    self.tacoBarEndingSoon2.hidden = YES;
    self.tacoBarEndingSoon3.hidden = YES;
    self.tacoBarEndingSoon4.hidden = YES;
    self.tacoBarEndingSoon5.hidden = YES;
    
    [self loadTitle];
}

-(void)loadTitle
{
    self.speedLabel.text = @"Speed";
    self.speedLabel.adjustsFontSizeToFitWidth = YES;
    self.serviceLabel.text = @"Service";
    self.serviceLabel.adjustsFontSizeToFitWidth = YES;
    self.saleLabel.text = @"Sale";
    self.saleLabel.adjustsFontSizeToFitWidth = YES;
    self.prepTimeLabel.text = @"Prep Times";
    self.prepTimeLabel.adjustsFontSizeToFitWidth = YES;
    self.tacoBarLabel.text = @"Taco Bar";
    self.tacoBarLabel.adjustsFontSizeToFitWidth = YES;
}
-(void)calculateEndingTime
{
    
}
-(void)loadSpeedColumn:(Speed *) record;
{
    self.goalLabel.text = record.dailygoal;
    if(record.dailygoal >= record.dailyactual)
    {
        self.winLoseLabel.text = @"WIN";
    }
    else
    {
        self.winLoseLabel.text = @"LOSE";
    }
    
}
-(void)loadServiceColumn:(RedTimes *)record;
{
    
}
-(void)loadSaleColumn:(Sales *)record;
{
    
}
-(void)loadTacoBarColumn
{
    
}
-(void)loadPrepTimeColumn
{
    
}
-(void)viewWillAppear:(BOOL)animated
{
    if([self speedDataFromController] != nil)
    {
        [self loadSpeedColumn: [self speedDataFromController]];
    }
    
}
-(RedTimes *)dataRedTimeFromController
{
    NSLog(@"method call redtime");
    return self.dataRedTimeFromController;
}
-(Speed *)speedDataFromController
{
    NSLog(@"method call speed");
    return self.speedDataFromController;
}
-(Sales *)saleDataFromController
{
    NSLog(@"method call sale");
    return self.saleDataFromController;
}
@end