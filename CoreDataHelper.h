//
//  CoreDataHelper.h
//  Del Taco
//
//  Created by iOSDev on 10/9/15.
//  Copyright (c) 2015 United Tax. All rights reserved.
//

#import<Foundation/Foundation.h>
#import<CoreData/CoreData.h>

@interface CoreDataHelper : NSObject
@property (nonatomic, readonly) NSManagedObjectContext * context;
@property (nonatomic, readonly) NSManagedObjectModel * model;
@property (nonatomic, readonly) NSPersistentStoreCoordinator * coordinator;
@property (nonatomic, readonly) NSPersistentStore * store;
-(void)setupCoreData;
-(void)saveContext;
@end