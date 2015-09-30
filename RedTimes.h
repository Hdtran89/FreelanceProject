//
//  RedTimes.h
//  Del Taco
//
//  Created by iOSDev on 9/30/15.
//  Copyright (c) 2015 United Tax. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface RedTimes : NSManagedObject

@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSString * itemName;
@property (nonatomic, retain) NSNumber * other;

@end
