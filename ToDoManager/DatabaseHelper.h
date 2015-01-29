//
//  RRDatabaseHelper.h
//  RashRecord
//
//  Created by LongPD on 4/23/14.
//  Copyright (c) 2014 LongPD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ToDo.h"
#import "Global.h"

@interface DatabaseHelper : NSObject

+ (DatabaseHelper *)shareMyInstance;

- (NSMutableArray *)getAllRecordObjectsFromDatabase:(NSString *)tableName;
- (BOOL)insertObjectToDataBase:(NSString *)tableName withDictionnary:(NSDictionary *)dictionnary;
- (BOOL)updateObjectToDatabase:(ToDo *)todoEntity withDictionnary:(NSDictionary *)dictionnary;
- (BOOL)saveCoreDataInContext:(NSManagedObjectContext *)context;

@end
