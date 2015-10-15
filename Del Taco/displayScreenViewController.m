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
@synthesize redTimeItems = _redTimeItems;
@synthesize redTime = _redTime;

-(void)viewDidLoad {
    [super viewDidLoad ];
    UITabBarItem * tabBarItem = [[UITabBarItem alloc]initWithTitle:@"" image:[UIImage imageNamed:@"displayTab"] tag:1];
    self.tabBarItem = tabBarItem;
    
    [self loadTitle];
    [self hideLabels];
  }

-(void)loadTitle
{
    self.speedLabel.text = @"Speed";
    self.speedLabel.font = [UIFont systemFontOfSize:30];
    self.speedLabel.adjustsFontSizeToFitWidth = YES;

    self.serviceLabel.text = @"Service";
    self.serviceLabel.font = [UIFont systemFontOfSize:30];
    self.serviceLabel.adjustsFontSizeToFitWidth = YES;
    
    self.saleLabel.text = @"Sale";
    self.saleLabel.font = [UIFont systemFontOfSize:30];
    self.saleLabel.adjustsFontSizeToFitWidth = YES;
    
    self.drinkTimeLabel.text = @"Drink Times";
    self.drinkTimeLabel.font = [UIFont systemFontOfSize:40];
    self.drinkTimeLabel.adjustsFontSizeToFitWidth = YES;
    
    self.tacoBarLabel.text = @"Taco Bar";
    self.tacoBarLabel.font = [UIFont systemFontOfSize:30];
    self.tacoBarLabel.adjustsFontSizeToFitWidth = YES;
}
-(void)calculateEndingTime:(NSString *)time
{
    
}
-(void)saveTacoItem
{
    
}
-(void)loadSpeedColumn;
{
    NSLog(@"goal text in display: %@", _goalText);
    if(_goalText == NULL){
        self.goalLabel.hidden = YES;
        self.winLoseLabel.hidden = YES;
    }
    else{
        self.goalLabel.text = _goalText;
        self.winLoseLabel.text = _winLoseText;
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
-(void)hideLabels
{
    self.goalLabel.hidden = YES;
    self.winLoseLabel.hidden = YES;
    self.lunchLabel.hidden = YES;
    self.dayLabel.hidden = YES;
    self.dinnerLabel.hidden = YES;
    self.graveyardLabel.hidden = YES;
    self.lastYearSaleLabel.hidden = YES;
    self.drinkTimeEndingSoon1.hidden = YES;
    self.drinkTimeEndingSoon2.hidden = YES;
    self.drinkTimeEndingSoon3.hidden = YES;
    self.drinkTimeEndingSoon4.hidden = YES;
    self.drinkTimeEndingSoon5.hidden = YES;
    self.tacoBarEndingSoon1.hidden = YES;
    self.tacoBarEndingSoon2.hidden = YES;
    self.tacoBarEndingSoon3.hidden = YES;
    self.tacoBarEndingSoon4.hidden = YES;
    self.tacoBarEndingSoon5.hidden = YES;
    self.tacoBarEndingSoon6.hidden = YES;
    self.tacoBarEndingSoon7.hidden = YES;
    self.tacoBarEndingSoon8.hidden = YES;
    self.tacoBarEndingSoon9.hidden = YES;
    self.tacoBarEndingSoon10.hidden = YES;
    self.tacoBarEndingSoon11.hidden = YES;
    self.tacoBarEndingSoon12.hidden = YES;
    self.tacoBarEndingSoon13.hidden = YES;
    self.tacoBarEndingSoon14.hidden = YES;
    self.tacoBarEndingSoon15.hidden = YES;
}
-(void)loadTacoBarColumn:(NSString *) itemName
                 setDate:(NSString *)date
{
    if ([itemName isEqualToString:@"Steak"]) {
        self.tacoBarEndingSoon1.hidden = NO;
        self.tacoBarEndingSoon1.text = [itemName stringByAppendingString:date];
        self.tacoBarEndingSoon1.font = [UIFont systemFontOfSize:18];
        self.tacoBarEndingSoon1.adjustsFontSizeToFitWidth = YES;
    }
    else if ([itemName isEqualToString:@"TacoMeat"]){
        self.tacoBarEndingSoon2.hidden = NO;
        self.tacoBarEndingSoon2.text = [itemName stringByAppendingString:date];
        self.tacoBarEndingSoon2.font = [UIFont systemFontOfSize:18];
        self.tacoBarEndingSoon2.adjustsFontSizeToFitWidth = YES;
    }
    else if ([itemName isEqualToString:@"Chicken"]){
        self.tacoBarEndingSoon3.hidden = NO;
        self.tacoBarEndingSoon3.text = [itemName stringByAppendingString:date];
        self.tacoBarEndingSoon3.font = [UIFont systemFontOfSize:18];
        self.tacoBarEndingSoon3.adjustsFontSizeToFitWidth = YES;
    }
    else if ([itemName isEqualToString:@"Rice"] ){
        self.tacoBarEndingSoon4.hidden = NO;
        self.tacoBarEndingSoon4.text = [itemName stringByAppendingString:date];
        self.tacoBarEndingSoon4.font = [UIFont systemFontOfSize:18];
        self.tacoBarEndingSoon4.adjustsFontSizeToFitWidth = YES;
    }
    else if ([itemName isEqualToString:@"Red Sauce"] ){
        self.tacoBarEndingSoon5.hidden = NO;
        self.tacoBarEndingSoon5.text = [itemName stringByAppendingString:date];
        self.tacoBarEndingSoon5.font = [UIFont systemFontOfSize:18];
        self.tacoBarEndingSoon5.adjustsFontSizeToFitWidth = YES;
    }
    else if ([itemName isEqualToString:@"Green Sauce"] ){
        self.tacoBarEndingSoon6.hidden = NO;
        self.tacoBarEndingSoon6.text = [itemName stringByAppendingString:date];
        self.tacoBarEndingSoon6.font = [UIFont systemFontOfSize:18];
        self.tacoBarEndingSoon6.adjustsFontSizeToFitWidth = YES;
    }
    else if ([itemName isEqualToString:@"Red Chilli Topping"] ){
        self.tacoBarEndingSoon7.hidden = NO;
        self.tacoBarEndingSoon7.text = [itemName stringByAppendingString:date];
        self.tacoBarEndingSoon7.font = [UIFont systemFontOfSize:18];
        self.tacoBarEndingSoon7.adjustsFontSizeToFitWidth = YES;
    }
    else if ([itemName isEqualToString:@"Turkey"] ){
        self.tacoBarEndingSoon8.hidden = NO;
        self.tacoBarEndingSoon8.text = [itemName stringByAppendingString:date];
        self.tacoBarEndingSoon8.font = [UIFont systemFontOfSize:18];
        self.tacoBarEndingSoon8.adjustsFontSizeToFitWidth = YES;
    }
    else if ([itemName isEqualToString:@"Black Beans"] ) {
        self.tacoBarEndingSoon9.hidden = NO;
        self.tacoBarEndingSoon9.text = [itemName stringByAppendingString:date];
        self.tacoBarEndingSoon9.font = [UIFont systemFontOfSize:18];
        self.tacoBarEndingSoon9.adjustsFontSizeToFitWidth = YES;
    }
    else if ([itemName isEqualToString:@"Pinto Beans"] ) {
        self.tacoBarEndingSoon10.hidden = NO;
        self.tacoBarEndingSoon10.text = [itemName stringByAppendingString:date];
        self.tacoBarEndingSoon10.font = [UIFont systemFontOfSize:18];
        self.tacoBarEndingSoon10.adjustsFontSizeToFitWidth = YES;
    }
    else if ([itemName isEqualToString:@"Nacho Cheese"]){
        self.tacoBarEndingSoon11.hidden = NO;
        self.tacoBarEndingSoon11.text = [itemName stringByAppendingString:date];
        self.tacoBarEndingSoon11.font = [UIFont systemFontOfSize:18];
        self.tacoBarEndingSoon11.adjustsFontSizeToFitWidth = YES;
    }
    else if ([itemName isEqualToString:@"Veg Blend"]){
        self.tacoBarEndingSoon12.hidden = NO;
        self.tacoBarEndingSoon12.text = [itemName stringByAppendingString:date];
        self.tacoBarEndingSoon12.font = [UIFont systemFontOfSize:18];
        self.tacoBarEndingSoon12.adjustsFontSizeToFitWidth = YES;
    }
    else if ([itemName isEqualToString:@"Tomatoes - Sliced"] ){
        self.tacoBarEndingSoon13.hidden = NO;
        self.tacoBarEndingSoon13.text = [itemName stringByAppendingString:date];
        self.tacoBarEndingSoon13.font = [UIFont systemFontOfSize:18];
        self.tacoBarEndingSoon13.adjustsFontSizeToFitWidth = YES;
    }
    else if ([itemName isEqualToString:@"Tomatoes - Diced"] ){
        self.tacoBarEndingSoon14.hidden = NO;
        self.tacoBarEndingSoon14.text = [itemName stringByAppendingString:date];
        self.tacoBarEndingSoon14.font = [UIFont systemFontOfSize:18];
        self.tacoBarEndingSoon14.adjustsFontSizeToFitWidth = YES;
    }
    else if ([itemName isEqualToString:@"Pico De Gallo Salsa"] ){
        self.tacoBarEndingSoon15.hidden = NO;
        self.tacoBarEndingSoon15.text = [itemName stringByAppendingString:date];
        self.tacoBarEndingSoon15.font = [UIFont systemFontOfSize:18];
        self.tacoBarEndingSoon15.adjustsFontSizeToFitWidth = YES;
    }
}
-(void)loadDrinkTimeColumn:(NSString *)itemName
                   setDate:(NSString *)date

{
    if ([itemName isEqualToString:@"Coffee"]) {
        self.drinkTimeEndingSoon1.hidden = NO;
        self.drinkTimeEndingSoon1.text = [itemName stringByAppendingString:date];
        self.drinkTimeEndingSoon1.font = [UIFont systemFontOfSize:24];
        self.drinkTimeEndingSoon1.adjustsFontSizeToFitWidth = YES;
    }
    else if ([itemName isEqualToString:@"Lemons"]) {
        self.drinkTimeEndingSoon2.hidden = NO;
        self.drinkTimeEndingSoon2.text = [itemName stringByAppendingString:date];
        self.drinkTimeEndingSoon2.font = [UIFont systemFontOfSize:24];
        self.drinkTimeEndingSoon2.adjustsFontSizeToFitWidth = YES;
    }
    else if ([itemName isEqualToString:@"Strawberries"]) {
        self.drinkTimeEndingSoon3.hidden = NO;
        self.drinkTimeEndingSoon3.text = [itemName stringByAppendingString:date];
        self.drinkTimeEndingSoon3.font = [UIFont systemFontOfSize:24];
        self.drinkTimeEndingSoon3.adjustsFontSizeToFitWidth = YES;
    }
    else if ([itemName isEqualToString:@"Iced Tea"]) {
        self.drinkTimeEndingSoon4.hidden = NO;
        self.drinkTimeEndingSoon4.text = [itemName stringByAppendingString:date];
        self.drinkTimeEndingSoon4.font = [UIFont systemFontOfSize:24];
        self.drinkTimeEndingSoon4.adjustsFontSizeToFitWidth = YES;
    }
    else if ([itemName isEqualToString:@"Sweet Tea"]) {
        self.drinkTimeEndingSoon5.hidden = NO;
        self.drinkTimeEndingSoon5.text = [itemName stringByAppendingString:date];
        self.drinkTimeEndingSoon5.font = [UIFont systemFontOfSize:24];
        self.drinkTimeEndingSoon5.adjustsFontSizeToFitWidth = YES;
    }
}
-(void)viewWillAppear:(BOOL)animated
{
    [self loadServiceColumn];
    [self loadSpeedColumn];
    [self loadSaleColumn];
 //   [self loadTacoBarColumn:_itemName
 //                   setDate:_itemDate];
 //   [self loadDrinkTimeColumn:_itemName
  //                    setDate:_itemDate];
}
- (IBAction)back:(id)sender {
    [self performSegueWithIdentifier:@"back" sender:self];
}
@end