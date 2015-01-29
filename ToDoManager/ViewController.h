//
//  ViewController.h
//  ToDoManager
//
//  Created by LongPD-PC on 1/29/15.
//  Copyright (c) 2015 LongPD-PC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Global.h"
#import "DatabaseHelper.h"
#import "ToDo.h"

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *todoListTableView;
@property (strong, nonatomic) NSArray *todoLists;

@end

