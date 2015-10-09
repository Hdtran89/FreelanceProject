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

@property (nonatomic, retain) NSString * day;
@property (nonatomic, retain) NSNumber * dailyactualsale;
@property (nonatomic, retain) NSNumber * dailylastyearsale;
@property (nonatomic, retain) NSNumber * weeklylastyearsale;
@property (nonatomic, retain) NSNumber * weeklyactualsale;

@end
