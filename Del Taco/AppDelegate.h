//
//  AppDelegate.h
//  Del Taco
//
//  Created by iOSDev on 8/7/15.
//  Copyright (c) 2015 United Tax. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginViewController.h"
#import "CoreDataHelper.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong, readonly) CoreDataHelper *coreDataHelper;
@end

