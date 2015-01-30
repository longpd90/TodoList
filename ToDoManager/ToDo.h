//
//  RashRecord.h
//  RashRecord
//
//  Created by LongPD on 4/23/14.
//  Copyright (c) 2014 LongPD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ToDo : NSManagedObject

@property (nonatomic, retain) NSNumber * identifier;
@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSString * des;
@property (nonatomic, retain) NSString * title;

@end
