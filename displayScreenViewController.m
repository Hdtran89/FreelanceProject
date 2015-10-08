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
    
    [self loadSpeedColumn];
  //  [self loadRedTimeColumn];
}

-(void) loadConstraintArray {
//    NSNumber *y1 = [NSNumber numberWithFloat: yOffSetR1];
//    NSNumber *y2 = [NSNumber numberWithFloat: yOffSetR2];
//    
//    yOffSets = [[NSMutableArray alloc] initWithObjects:y1,y2, nil];
//    
//    NSNumber *x1 = [NSNumber numberWithFloat:xOffSetC1];
//    NSNumber *x2 = [NSNumber numberWithFloat:xOffSetC2];
//    NSNumber *x3 = [NSNumber numberWithFloat:xOffSetC3];
//    
//    xOffSets = [[NSMutableArray alloc]initWithObjects:x1,x2,x3, nil];
}

-(void)loadSpeedColumn {
    self.speedLabel.text = @"Speed";
    self.goalLabel.text = (NSString*)_speed.dailygoal;
    
  //  [self.speedLabel setFont:[UIFont systemFontOfSize:30]];
    self.speedLabel.adjustsFontSizeToFitWidth = YES;
//    if(_speed.dailygoal != NULL)
//    {
//        self.goalLabel.text = [@"Daily Goal: " stringByAppendingString:(NSString*)_speed.dailygoal];
//        self.goalLabel.adjustsFontSizeToFitWidth = YES;
//    }
   // [self.goalLabel setFont:[UIFont systemFontOfSize:24]];
    
    //TODO Set the Goal from the item input;
    self.serviceLabel.text = @"Service";
  //  [self.serviceLabel setFont:[UIFont systemFontOfSize:24]];
    self.serviceLabel.adjustsFontSizeToFitWidth = YES;
    
    //TODO Set Service for Day dinner graveyard
    self.saleLabel.text = @"Sale";
  //  [self.saleLabel setFont:[UIFont systemFontOfSize:24]];
    self.saleLabel.adjustsFontSizeToFitWidth = YES;
    
    //TODO Set Sale from last year
}

-(void)loadRedTimeColumn {
    self.prepTimeLabel.text = @"Prep Times";
   // [self.prepTimeLabel setFont:[UIFont systemFontOfSize:30]];
    //TODO Set top 5 Preptime that is about to end;
}

-(void)CalculateEndingTime {
    
}

-(void)loadTacoBarColumn {
    self.tacoBarLabel.text = @"Taco Bar";
  //  [self.tacoBarLabel setFont:[UIFont systemFontOfSize:30]];
    //TODO Set the top 5 Taco Time about to end;
}
-(void)viewWillAppear:(BOOL)animated
{
//    if(_redtimes != NULL && _speed != NULL && _sale != NULL)
//    {
//        [self dataRedTimeFromController: _redtimes];
//        [self speedDataFromController:_speed];
//        [self saleDataFromController:_sale];
//    }
//    else{
//        NSLog(@"All object are NULL");
//    }
}
-(RedTimes *)dataRedTimeFromController
{
   // redTimeViewController * red = [[redTimeViewController alloc]init];
  //  red.redTimeDelegate = self;
    NSLog(@"method call redtime");
    return self.redTime;
   // self.prepTimeEndingSoon1.text = [@"Time Ending: " stringByAppendingString:(NSString *)record.date];
}
-(Speed *)speedDataFromController
{
   // StatisticsViewController * stat = [[StatisticsViewController alloc]init];
  //  stat.statisticDelegate = self;
    NSLog(@"method call speeed");
    
    return self.speed;
    //self.goalLabel.text = [@"Daily Goal: " stringByAppendingString:(NSString*)record.dailygoal];
}
-(Sales *)saleDataFromController
{
   // StatisticsViewController * stat = [[StatisticsViewController alloc]init];
   // stat.statisticDelegate = self;
    NSLog(@"method call sale");
    return self.sale;
    //self.lastYearSaleLabel.text = [@"Last Year Daily Sale: " stringByAppendingString:(NSString*)record.dailylastyearsale];
}
@end