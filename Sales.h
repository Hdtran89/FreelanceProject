//
//  Sales.h
//  Del Taco
//
//  Created by iOSDev on 10/1/15.
//  Copyright (c) 2015 United Tax. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Sales : NSManagedObject

@property (nonatomic, retain) UNKNOWN_TYPE day;
@property (nonatomic, retain) UNKNOWN_TYPE dailyactualsale;
@property (nonatomic, retain) UNKNOWN_TYPE dailylastyearsale;
@property (nonatomic, retain) UNKNOWN_TYPE weeklygoalsale;
@property (nonatomic, retain) UNKNOWN_TYPE dailygoalsale;

@end
