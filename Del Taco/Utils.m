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

+ (UIColor *) DT_RED {
    return [UIColor colorWithRed:238/255.0 green:48/255.0 blue:37/255.0 alpha:1];

}

+ (UIColor *) DT_WHITE {
    return [UIColor whiteColor];
}

+ (UIColor *) DT_YELLOW {
    return [UIColor colorWithRed:253/255.0 green:209/255.0 blue:8/255.0 alpha:1];
}



+ (BOOL) getLoggedIn {
    return isAdmin;
}

+ (void) setLoggedIn: (BOOL)isLoggedIn {
    isAdmin = isLoggedIn;
}




@end
