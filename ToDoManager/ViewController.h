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
#import "OverlayView.h"

@interface ViewController : UIViewController<OverlayViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *todoListTableView;
@property (strong, nonatomic) NSMutableArray *todoLists;
@property (weak, nonatomic) IBOutlet UITextField *todoTextField;
@property (weak, nonatomic) IBOutlet UIButton *editButton;
@property (assign, nonatomic) BOOL editing;
@property (assign, nonatomic) int indexEditing;
@property (strong, nonatomic) OverlayView *overlayView;
- (IBAction)editTodoEvent:(id)sender;

@end

