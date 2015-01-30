//
//  TodoTableViewCell.h
//  ToDoManager
//
//  Created by LongPD-PC on 1/29/15.
//  Copyright (c) 2015 LongPD-PC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDo.h"

@interface TodoTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (strong, nonatomic) ToDo *todoEntity;
@end
