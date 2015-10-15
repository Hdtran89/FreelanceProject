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
}
@end

@implementation displayScreenViewController

@synthesize goalText = _goalText;
@synthesize winLoseText = _winLoseText;
@synthesize lunchText = _lunchText;
@synthesize dayText = _dayText;
@synthesize dinnerText =_dinnerText;
@synthesize graveyardText = _graveyardText;
@synthesize lastYearSaleText = _lastYearSaleText;
@synthesize itemName = _itemName;
@synthesize itemDate = _itemDate;
-(void)viewDidLoad {
    [super viewDidLoad ];
    UITabBarItem * tabBarItem = [[UITabBarItem alloc]initWithTitle:@"" image:[UIImage imageNamed:@"displayTab"] tag:1];
    self.tabBarItem = tabBarItem;
    
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
    self.drinkTimeLabel.text = @"Prep Times";
    self.drinkTimeLabel.adjustsFontSizeToFitWidth = YES;
    self.tacoBarLabel.text = @"Taco Bar";
    self.tacoBarLabel.adjustsFontSizeToFitWidth = YES;
    
}
-(void)calculateEndingTime:(NSString *)time
{
    
}
-(void)loadSpeedColumn;
{
    NSLog(@"goal text in display: %@", _goalText);
    if(_goalText == NULL){
        self.goalLabel.hidden = YES;
     //   self.winLoseLabel.hidden = YES;
    }
    else{
        self.goalLabel.text = _goalText;
     //   self.winLoseLabel.text = _winLoseText;
    }
}
-(void)loadServiceColumn
{
    if(_lunchText == NULL) {
        self.lunchLabel.hidden = YES;
    } else {
        self.lunchLabel.text = _lunchText;
    }
    if(_dayText == NULL) {
        self.dayLabel.hidden = YES;
    } else {
        self.dayLabel.text = _dayText;
    }
    if(_dinnerText == NULL) {
        self.dinnerLabel.hidden = YES;
    } else {
        self.dinnerLabel.text = _dinnerText;
    }
    if(_graveyardText == NULL) {
        self.graveyardLabel.hidden = YES;
    } else {
        self.graveyardLabel.text = _graveyardText;
    }
}
-(void)loadSaleColumn
{
    if(_lastYearSaleText == NULL){
        self.lastYearSaleLabel.hidden = YES;
    } else {
        self.lastYearSaleLabel.text = _lastYearSaleText;
    }
}
-(void)loadTacoBarColumn:(NSString *) itemName
                 setDate:(NSString *)date
{
    if ([itemName isEqualToString:@"Steak"]) {
        self.tacoBarEndingSoon1.text = [itemName stringByAppendingString:date];
        self.tacoBarEndingSoon1.adjustsFontSizeToFitWidth = YES;
    }
    else if ([itemName isEqualToString:@"TacoMeat"]){
        self.tacoBarEndingSoon2.text = [itemName stringByAppendingString:date];
    }
    else if ([itemName isEqualToString:@"Chicken"]){
        self.tacoBarEndingSoon3.text = [itemName stringByAppendingString:date];
    }
    else if ([itemName isEqualToString:@"Rice"] ){
        self.tacoBarEndingSoon4.text = [itemName stringByAppendingString:date];
    }
    else if ([itemName isEqualToString:@"Red Sauce"] ){
        self.tacoBarEndingSoon5.text = [itemName stringByAppendingString:date];
    }
    else if ([itemName isEqualToString:@"Green Sauce"] ){
        self.tacoBarEndingSoon6.text = [itemName stringByAppendingString:date];
    }
    else if ([itemName isEqualToString:@"Red Chilli Topping"] ){
        self.tacoBarEndingSoon7.text = [itemName stringByAppendingString:date];
    }
    else if ([itemName isEqualToString:@"Turkey"] ){
        self.tacoBarEndingSoon8.text = [itemName stringByAppendingString:date];
    }
    else if ([itemName isEqualToString:@"Black Beans"] ) {
        self.tacoBarEndingSoon9.text = [itemName stringByAppendingString:date];
    }
    else if ([itemName isEqualToString:@"Pinto Beans"] ) {
        self.tacoBarEndingSoon10.text = [itemName stringByAppendingString:date];
    }
    else if ([itemName isEqualToString:@"Nacho Cheese"]){
        self.tacoBarEndingSoon11.text = [itemName stringByAppendingString:date];
    }
    else if ([itemName isEqualToString:@"Veg Blend"]){
        self.tacoBarEndingSoon12.text = [itemName stringByAppendingString:date];
    }
    else if ([itemName isEqualToString:@"Tomatoes - Sliced"] ){
        self.tacoBarEndingSoon13.text = [itemName stringByAppendingString:date];
    }
    else if ([itemName isEqualToString:@"Tomatoes - Diced"] ){
        self.tacoBarEndingSoon14.text = [itemName stringByAppendingString:date];
    }
    else if ([itemName isEqualToString:@"Pico De Gallo Salsa"] ){
        self.tacoBarEndingSoon15.text = [itemName stringByAppendingString:date];
    }
}
-(void)loadDrinkTimeColumn:(NSString *)itemName
                   setDate:(NSString *)date

{
    if ([itemName isEqualToString:@"Coffee"]) {
        self.drinkTimeEndingSoon1.text = [itemName stringByAppendingString:date];
    }
    else if ([itemName isEqualToString:@"Lemons"]) {
        self.drinkTimeEndingSoon2.text = [itemName stringByAppendingString:date];
    }
    else if ([itemName isEqualToString:@"Strawberries"]) {
        self.drinkTimeEndingSoon3.text = [itemName stringByAppendingString:date];
    }
    else if ([itemName isEqualToString:@"Iced Tea"]) {
        self.drinkTimeEndingSoon4.text = [itemName stringByAppendingString:date];
    }
    else if ([itemName isEqualToString:@"Sweet Tea"]) {
        self.drinkTimeEndingSoon5.text = [itemName stringByAppendingString:date];
    }
}
-(void)viewWillAppear:(BOOL)animated
{
    [self loadServiceColumn];
    [self loadSpeedColumn];
    [self loadSaleColumn];
    [self loadTacoBarColumn:_itemName
                    setDate:_itemDate];
    [self loadDrinkTimeColumn:_itemName
                      setDate:_itemDate];
}
@end