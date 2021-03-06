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
#import <CoreData/CoreData.h>

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

@end
