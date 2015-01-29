//
//  RRDatabaseHelper.m
//  RashRecord
//
//  Created by LongPD on 4/23/14.
//  Copyright (c) 2014 LongPD. All rights reserved.
//

#import "DatabaseHelper.h"
#import "AppDelegate.h"

@implementation DatabaseHelper

static DatabaseHelper *shareInstance;

#pragma mark - Lifecycle methods

+ (DatabaseHelper *)shareMyInstance;
{
	@synchronized([DatabaseHelper class])
	{
		if (!shareInstance)
            shareInstance = [[self alloc] init] ;
        
		return shareInstance;
	}
	return nil;
}

+ (id)alloc
{
	@synchronized([DatabaseHelper class])
	{
		NSAssert(shareInstance == nil, @"Attempted to allocate a second instance of a singleton.");
		shareInstance = [super alloc];
		return shareInstance;
	}
	return nil;
}

#pragma mark - private

- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
   
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

#pragma mark - update object

- (BOOL)insertObjectToDataBase:(NSString *)tableName withDictionnary:(NSDictionary *)dictionnary
{
    ToDo *todoEntity = [NSEntityDescription insertNewObjectForEntityForName:tableName inManagedObjectContext:[self managedObjectContext]];
    return [self updateObjectToDatabase:todoEntity withDictionnary:dictionnary];

}

- (BOOL)updateObjectToDatabase:(ToDo *)todoEntity withDictionnary:(NSDictionary *)dictionnary
{
    todoEntity.identifier = [dictionnary objectForKey:kToDoID];
    todoEntity.date = [dictionnary objectForKey:kToDoDate];
    todoEntity.des = [dictionnary objectForKey:kToDoDes];
    todoEntity.title = [dictionnary objectForKey:kToDoTile];

    return [self saveCoreDataInContext:[self managedObjectContext]];
}

#pragma mark - get objects


// get all objects
- (NSMutableArray *)getAllRecordObjectsFromDatabase:(NSString *)tableName
{
	return [self getRecordObjectsFromDatabase:tableName withRow:nil andKey:nil andSortAscending:NO];
}

// get objects with a predicate
- (NSMutableArray *)getRecordObjectsFromDatabase:(NSString *)tableName
                                         withRow:(NSPredicate *)rowName
                                          andKey:(NSString *)keySearch
                                andSortAscending:(BOOL)sortAscending
{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:tableName inManagedObjectContext:[self managedObjectContext]];
    [request setEntity:entity];
    
    if (rowName != nil)
        [request setPredicate:rowName];
    
    if (keySearch != nil) {
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:keySearch ascending:sortAscending];
        NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
        [request setSortDescriptors:sortDescriptors];
    }
    
    NSError *error = nil;
    NSMutableArray *mutableFetchResults = [[[self managedObjectContext] executeFetchRequest:request error:&error] mutableCopy];
    
    if (mutableFetchResults == nil)
        NSLog(@"Couldn't get objects for entity %@", tableName);
    
    return mutableFetchResults;
}


#pragma mark - save Data

- (BOOL)saveCoreDataInContext:(NSManagedObjectContext *)context
{
    NSError *error = nil;
    if (![context save:&error]) {
        NSLog(@"Can't save! %@ %@", error, [error localizedDescription]);
        return NO;
    }
    return YES;
}

@end
