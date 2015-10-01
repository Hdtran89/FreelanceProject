//
//  Utils.m
//  Del Taco
//
//  Created by iOSDev on 8/10/15.
//  Copyright (c) 2015 United Tax. All rights reserved.
//

#import "Utils.h"


#define yMarginLogo .1*[Utils getScreenHeight]
#define xMarginLogo .37*[Utils getScreenWidth]
#define logoHeight 1.6*(184.0/1136.0)*[Utils getScreenHeight]


@implementation Utils
BOOL isAdmin;


+ (CGFloat) getScreenWidth {
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    return screenRect.size.width;
}

+ (CGFloat) getScreenHeight {
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    return screenRect.size.height;
}

+ (CGFloat) getYMarginLogo {
    return yMarginLogo;
}

+ (CGFloat) getLogoHeight {
    return logoHeight;
}

+ (void) setupLogo: (UIView *)view {
    CGRect logoRect = CGRectMake(xMarginLogo, yMarginLogo, [Utils getScreenWidth]-2*xMarginLogo, logoHeight);
    UIImageView *logo = [[UIImageView alloc] initWithFrame:logoRect];
    [logo setImage:[UIImage imageNamed:@"logo"]];
    [view addSubview:logo];
}


+ (UIColor *) DT_ORANGE {
    return [UIColor colorWithRed:248/255.0 green:152/255.0 blue:31/255.0 alpha:1];

}


+ (UIColor *) DT_GREEN {
    return [UIColor colorWithRed:157/255.0 green:166/255.0 blue:56/255.0 alpha:1];

}
+ (UIColor *) DT_GREEN_LIGHT {
    return [UIColor colorWithRed:157/255.0 green:186/255.0 blue:56/255.0 alpha:1];
    
}
+ (UIColor *) DT_GREEN_DARK {
    return [UIColor colorWithRed:157/255.0 green:156/255.0 blue:56/255.0 alpha:1];
    
}
+ (UIColor *) DT_GREEN_MEDIUM {
    return [UIColor colorWithRed:157/255.0 green:176/255.0 blue:56/255.0 alpha:1];
    
}
+ (UIColor *) DT_RED {
    return [UIColor colorWithRed:238/255.0 green:48/255.0 blue:37/255.0 alpha:1];

}

+ (UIColor *) DT_WHITE {
    return [UIColor whiteColor];
}

+ (UIColor *) DT_YELLOW {
    return [UIColor colorWithRed:253/255.0 green:209/255.0 blue:8/255.0 alpha:1];
}

+ (UIColor *) DT_YELLOW_LIGHT {
    return [UIColor colorWithRed:253/255.0 green:255/255.0 blue:8/255.0 alpha:1];
}



+ (BOOL) getLoggedIn {
    return isAdmin;
}

+ (void) setLoggedIn: (BOOL)isLoggedIn {
    isAdmin = isLoggedIn;
}
//CRUD TO USE FOR CORE DATA
@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

+ (void)createRedTimeRecord: (NSString *) item
         setDateTime:(NSDate *) dateTime
          checkOther:(BOOL) isOther;{
    NSManagedObjectContext * context = [[NSManagedObjectContext alloc] init];
    RedTimes * redtimes = [NSEntityDescription insertNewObjectForEntityForName:@"RedTimes" inManagedObjectContext:context];
    
    redtimes.date = dateTime;
    redtimes.itemName = item;
    if(isOther == 1)
        redtimes.other = [NSNumber numberWithBool:YES];
    else
        redtimes.other = [NSNumber numberWithBool:NO];

    NSError * error = nil;
    if([context save: &error]) {
        NSLog(@ "New record has been save:");
    } else {
        NSLog(@"New record was not save!: %@",[error userInfo]);
    }
    
}
+ (void)updateRedTimeRecord: (BOOL)isSpeed
         setDateTime:(NSDate *) dateTime
         setItemName:(NSString *) item
          checkOther:(BOOL) isOther
             setGoal:(NSNumber *) goalNum
     setLastYearSale:(NSNumber *) lastYearSales ; {
    NSManagedObjectContext * context = [[NSManagedObjectContext alloc] init];
    NSFetchRequest * fetchRequest = [[NSFetchRequest alloc]init];
    NSEntityDescription * entity = [NSEntityDescription entityForName:@"RedTimes" inManagedObjectContext:context];
    [fetchRequest entity];
    NSError * error = nil;
    NSArray * fetchObjects = [context executeFetchRequest:fetchRequest error:&error];
    for (RedTimes * redtime in fetchObjects) {
        //TODO update the RedTime item;
        
    }
}
+ (void)deleteRedTimeRecord: (BOOL)isSpeed
         setDateTime:(NSDate *) dateTime
         setItemName:(NSString *) item
          checkOther:(BOOL) isOther
             setGoal:(NSNumber *) goalNum
     setLastYearSale:(NSNumber *) lastYearSales ; {
    NSManagedObjectContext * context = [[NSManagedObjectContext alloc] init];
    NSFetchRequest * fetchRequest = [[NSFetchRequest alloc]init];
    //TODO if needed to delete record
    //use NSPredicate * predicate
    //[fetchRequest setPredicate: predicate]
    //Set NSError and fetch the Object form array
    //loop through the array
    //Grab the record and delete
    //[context deleleObject:Speed]
    //Check for error and save the change with [context save:&error]
    //Log
    
}
+(void)readRedTimeRecord: (BOOL)isSpeed
      setDateTime:(NSDate *) dateTime
      setItemName:(NSString *) item
       checkOther:(BOOL) isOther
          setGoal:(NSNumber *) goalNum
  setLastYearSale:(NSNumber *) lastYearSales ; {
    NSManagedObjectContext * context =  [[NSManagedObjectContext alloc] init];
    NSFetchRequest * fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription * entity = [NSEntityDescription entityForName:@"RedTimes" inManagedObjectContext:context];
    
    [fetchRequest setEntity:entity];
   
    NSError * error = nil;
    
    NSArray * fetchObjects = [context executeFetchRequest:fetchRequest error:&error];
    
    for(RedTimes * redtime in fetchObjects){
        //TODO save RedTime item to be use for the view later
    }
}
+ (void)updateSpeedRecord:(NSString *) day
            setweeklyGoal:(NSNumber *) weeklyGoal
          setWeeklyActual:(NSNumber *) weeklyActual
             setDailyGoal:(NSNumber *) dailyGoal
          setDailyActual:(NSNumber *) dailyActual
          setLastYearSale:(NSNumber *) lastYearSales {
    NSManagedObjectContext * context = [[NSManagedObjectContext alloc] init];
    NSFetchRequest * fetchRequest = [[NSFetchRequest alloc]init];
    NSEntityDescription * entity = [NSEntityDescription entityForName:@"Speed" inManagedObjectContext:context];
    [fetchRequest entity];
    NSError * error = nil;
    NSArray * fetchObjects = [context executeFetchRequest:fetchRequest error:&error];
    for (Speed * speed in fetchObjects) {
        //TODO update the RedTime item;
        
    }
}
+ (void)createSpeedRecord:(NSString *) day
            setweeklyGoal:(NSNumber *) weeklyGoal
          setWeeklyActual:(NSNumber *) weeklyActual
             setDailyGoal:(NSNumber *) dailyGoal
          setDailyActual:(NSNumber *) dailyActual
          setLastYearSale:(NSNumber *) lastYearSales {
    NSManagedObjectContext * context = [[NSManagedObjectContext alloc] init];
    Speed * speed = [NSEntityDescription insertNewObjectForEntityForName:@"Speed" inManagedObjectContext:context];
    
    speed.day = day;
    speed.weeklygoal = weeklyGoal;
    speed.weeklyactual = weeklyActual;
    speed.dailyactual = dailyActual;
    speed.dailygoal = dailyGoal;
    speed.lastYearSale = lastYearSales;
    
    NSError * error = nil;
    if([context save: &error]) {
        NSLog(@ "New record has been save:");
    } else {
        NSLog(@"New record was not save!: %@",[error userInfo]);
    }
}
+ (void)readRedTimeRecord:(NSString *) day
            setweeklyGoal:(NSNumber *) weeklyGoal
          setWeeklyActual:(NSNumber *) weeklyActual
             setDailyGoal:(NSNumber *) dailyGoal
          setDailyActual:(NSNumber *) dailyActual
          setLastYearSale:(NSNumber *) lastYearSales {
    NSManagedObjectContext * context =  [[NSManagedObjectContext alloc] init];
    NSFetchRequest * fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription * entity = [NSEntityDescription entityForName:@"Speed" inManagedObjectContext:context];
    
    [fetchRequest setEntity:entity];
    
    NSError * error = nil;
    
    NSArray * fetchObjects = [context executeFetchRequest:fetchRequest error:&error];
    
    for(Speed * speed in fetchObjects){
        //TODO save RedTime item to be use for the view later
    }
}
+ (void)deleteRedTimeRecord:(NSString *) day
              setweeklyGoal:(NSNumber *) weeklyGoal
            setWeeklyActual:(NSNumber *) weeklyActual
               setDailyGoal:(NSNumber *) dailyGoal
            setDailyActual:(NSNumber *) dailyActual
            setLastYearSale:(NSNumber *) lastYearSales {
    NSManagedObjectContext * context = [[NSManagedObjectContext alloc] init];
    NSFetchRequest * fetchRequest = [[NSFetchRequest alloc]init];
    //TODO if needed to delete record
    //use NSPredicate * predicate
    //[fetchRequest setPredicate: predicate]
    //Set NSError and fetch the Object form array
    //loop through the array
    //Grab the record and delete
    //[context deleleObject:Speed]
    //Check for error and save the change with [context save:&error]
    //Log
}
@end
