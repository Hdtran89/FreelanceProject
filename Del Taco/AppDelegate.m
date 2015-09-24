//
//  AppDelegate.m
//  Del Taco
//
//  Created by iOSDev on 8/7/15.
//  Copyright (c) 2015 United Tax. All rights reserved.
//

#import "AppDelegate.h"
#import "Utils.h"
#import "UIKit/UIKit.h"
#import "Parse/Parse.h"
#import <Fabric/Fabric.h>
#import <Crashlytics/Crashlytics.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [Fabric with:@[[Crashlytics class]]];

    //assign tab bar item with titles
    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
    
    UIColor *DT_ORANGE = [Utils DT_ORANGE];
    UIColor *DT_GREEN = [Utils DT_GREEN];
    UIColor *DT_RED = [Utils DT_RED];
    UIColor *DT_YELLOW = [Utils DT_YELLOW];
    UIColor *DT_WHITE = [Utils DT_WHITE];
    
    [[UITabBar appearance] setBarTintColor:DT_ORANGE];
    [[UITabBar appearance] setTintColor:DT_RED];
    [[UITabBar appearance] setTranslucent:NO]; 
    [[UINavigationBar appearance] setBarTintColor:DT_ORANGE];
//    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor blackColor] }
//                                             forState:UIControlStateNormal];
//    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor blackColor] }
//                                             forState:UIControlStateSelected];
//    
//    UITabBarItem *item = [tabBarController.tabBar.items objectAtIndex:0];
//    UIImage *image = [UIImage imageNamed:@"guidelinesOn"];
//    image = [self imageWithImage:image scaledToSize:CGSizeMake(30, 30)];
//    [item setImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
//    [item setSelectedImage:image];
//    
//    item = [tabBarController.tabBar.items objectAtIndex:1];
//    image = [UIImage imageNamed:@"deployTab"];
//    image = [self imageWithImage:image scaledToSize:CGSizeMake(30, 30)];
//    [item setImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
//    [item setSelectedImage:image];
//    
//    item = [tabBarController.tabBar.items objectAtIndex:2];
//    image = [UIImage imageNamed:@"cleaningTab"];
//    image = [self imageWithImage:image scaledToSize:CGSizeMake(30, 30)];
//    [item setImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
//    [item setSelectedImage:image];
//    
//    item = [tabBarController.tabBar.items objectAtIndex:3];
//    image = [UIImage imageNamed:@"redTimeTab"];
//    image = [self imageWithImage:image scaledToSize:CGSizeMake(30, 30)];
//    [item setImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
//    [item setSelectedImage:image];
//    
//    item = [tabBarController.tabBar.items objectAtIndex:4];
//    image = [UIImage imageNamed:@"statisticsTab"];
//    image = [self imageWithImage:image scaledToSize:CGSizeMake(30, 30)];
//    [item setImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
//    [item setSelectedImage:image];
//
    
    //    UITabBarItem *tabBarItem1 = [tabBar.items objectAtIndex:0];
//    UITabBarItem *tabBarItem2 = [tabBar.items objectAtIndex:1];
//    UITabBarItem *tabBarItem3 = [tabBar.items objectAtIndex:2];
//    UITabBarItem *tabBarItem4 = [tabBar.items objectAtIndex:3];
//    UITabBarItem *tabBarItem5 = [tabBar.items objectAtIndex:4];
//    
//    UIImage *cleaningIcon = [[UIImage imageNamed:@"cleaningTab"] renderingMode: UIImageRenderingModeAlwaysTemplate];
//    tabBarItem1 = [tabBarItem1 initWithTitle:@"Cleaning" image:[UIImage imageNamed:@"cleaningTab"] selectedImage:[UIImage imageNamed:@"cleaningTab"]];
//
    
    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"isLoggedIn"]) {
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"IsLoggedIn"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        self.window = [[UIWindow alloc] initWithFrame: [UIScreen mainScreen].bounds];
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        LoginViewController *login = [sb instantiateViewControllerWithIdentifier:NSStringFromClass([ LoginViewController class])];
        self.window.rootViewController = login;
        [self.window makeKeyAndVisible];
    }
    
    
    
    return YES;
}

//- (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
//    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
//    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
//    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    return newImage;
//}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
