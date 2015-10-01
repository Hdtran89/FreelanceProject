//
//  Utils.h
//  Del Taco
//
//  Created by iOSDev on 8/10/15.
//  Copyright (c) 2015 United Tax. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Parse/Parse.h"
#import <QuartzCore/QuartzCore.h>
#import "Speed.h"
#import "RedTimes.h"
#import "Sales.h"
@interface Utils : NSObject

+ (CGFloat) getScreenWidth;

+ (CGFloat) getScreenHeight;

+ (void) setupLogo: (UIView *) view;

+ (CGFloat) getYMarginLogo;
+ (CGFloat) getLogoHeight;

+ (UIColor *) DT_ORANGE;
+ (UIColor *) DT_GREEN;
+ (UIColor *) DT_GREEN_LIGHT;
+ (UIColor *) DT_GREEN_DARK;
+ (UIColor *) DT_GREEN_MEDIUM;
+ (UIColor *) DT_YELLOW;
+ (UIColor *) DT_RED;
+ (UIColor *) DT_WHITE;
+ (UIColor *) DT_YELLOW_LIGHT;

+ (BOOL) getLoggedIn;
+ (void) setLoggedIn: (BOOL)isLoggedIn;

@property (readonly, strong, nonatomic) NSManagedObjectContext * managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel * managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator * persistentStoreCoordinator;
//CRUD for RedTime Core Data
+ (void)updateRedTimeRecord:(NSString *) item
                setDateTime:(NSDate *) dateTime
                 checkOther:(BOOL) isOther;

+ (void)createRedTimeRecord:(NSString *) item
                setDateTime:(NSDate *) dateTime
                 checkOther:(BOOL) isOther;

+ (void)readRedTimeRecord:(NSString *) item
              setDateTime:(NSDate *) dateTime
               checkOther:(BOOL) isOther;

+ (void)deleteRedTimeRecord:(NSString *) item
                setDateTime:(NSDate *) dateTime
                 checkOther:(BOOL) isOther;

//CRUD for Speed Core Data
+ (void)updateSpeedRecord:(NSString *) day
            setweeklyGoal:(NSNumber *) weeklyGoal
          setWeeklyActual:(NSNumber *) weeklyActual
             setDailyGoal:(NSNumber *) dailyGoal
           setDailyActual:(NSNumber *) dailyActual
                 setLunch:(BOOL)isLunch
               setCounter:(BOOL)isCounter;

+ (void)createSpeedRecord:(NSString *) day
            setweeklyGoal:(NSNumber *) weeklyGoal
          setWeeklyActual:(NSNumber *) weeklyActual
             setDailyGoal:(NSNumber *) dailyGoal
           setDailyActual:(NSNumber *) dailyActual
                 setLunch:(BOOL)isLunch
               setCounter:(BOOL)isCounter;

+ (void)readSpeedRecord:(NSString *) day
            setweeklyGoal:(NSNumber *) weeklyGoal
          setWeeklyActual:(NSNumber *) weeklyActual
             setDailyGoal:(NSNumber *) dailyGoal
           setDailyActual:(NSNumber *) dailyActual
                 setLunch:(BOOL)isLunch
               setCounter:(BOOL)isCounter;

+ (void)deleteSpeedRecord:(NSString *) day
              setweeklyGoal:(NSNumber *) weeklyGoal
            setWeeklyActual:(NSNumber *) weeklyActual
               setDailyGoal:(NSNumber *) dailyGoal
             setDailyActual:(NSNumber *) dailyActual
                   setLunch:(BOOL)isLunch
                 setCounter:(BOOL)isCounter;

//CRUD for Sales Core Data
+ (void)updateSaleRecord:(NSString *) day
   setWeeklyLastYearSale:(NSNumber *) weeklyLastYearSale
     setWeeklyActualSale:(NSNumber *) weeklyActualSale
      setDailyActualSale:(NSNumber *) dailyActualSale
    setDailyLastYearSale:(NSNumber *) dailyLastYearSale;

+ (void)createSaleRecord:(NSString *) day
   setWeeklyLastYearSale:(NSNumber *) weeklyLastYearSale
     setWeeklyActualSale:(NSNumber *) weeklyActualSale
      setDailyActualSale:(NSNumber *) dailyActualSale
    setDailyLastYearSale:(NSNumber *) dailyLastYearSale;

+ (void)readSaleRecord:(NSString *) day
 setWeeklyLastYearSale:(NSNumber *) weeklyLastYearSale
   setWeeklyActualSale:(NSNumber *) weeklyActualSale
    setDailyActualSale:(NSNumber *) dailyActualSale
  setDailyLastYearSale:(NSNumber *) dailyLastYearSale;

+ (void)deleteSaleRecord:(NSString *) day
   setWeeklyLastYearSale:(NSNumber *) weeklyLastYearSale
     setWeeklyActualSale:(NSNumber *) weeklyActualSale
      setDailyActualSale:(NSNumber *) dailyActualSale
    setDailyLastYearSale:(NSNumber *) dailyLastYearSale;

@end
