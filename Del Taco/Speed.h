//
//  Speed.h
//  Del Taco
//
//  Created by iOSDev on 10/1/15.
//  Copyright (c) 2015 United Tax. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Speed : NSManagedObject

@property (nonatomic, retain) NSNumber * weeklygoal;
@property (nonatomic, retain) NSNumber * dailygoal;
@property (nonatomic, retain) NSNumber * weeklyactual;
@property (nonatomic, retain) NSNumber * dailyactual;
@property (nonatomic, retain) NSString * day;
@property (nonatomic, retain) NSNumber * islunch;
@property (nonatomic, retain) NSNumber * iscounter;

@end
