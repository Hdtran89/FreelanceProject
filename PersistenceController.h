//
//  PersistenceController.h
//  Del Taco
//
//  Created by iOSDev on 10/7/15.
//  Copyright (c) 2015 United Tax. All rights reserved.
//
#import <CoreData/CoreData.h>
typedef void (^InitCallbackBlock)(void);

@interface PersistenceController : NSObject

@property (strong, readonly) NSManagedObjectContext *managedObjectContext;

- (id)initWithCallback:(InitCallbackBlock)callback;

- (void)save;

@end
