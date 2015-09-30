//
//  Speed.h
//  Del Taco
//
//  Created by iOSDev on 9/30/15.
//  Copyright (c) 2015 United Tax. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Speed : NSManagedObject

@property (nonatomic, retain) NSNumber * lastYearSale;
@property (nonatomic, retain) NSNumber * goal;

@end
