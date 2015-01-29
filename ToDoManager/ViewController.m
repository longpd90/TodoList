//
//  ViewController.m
//  ToDoManager
//
//  Created by LongPD-PC on 1/29/15.
//  Copyright (c) 2015 LongPD-PC. All rights reserved.
//

#import "ViewController.h"
#import "TodoTableViewCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)resetContentTodoList
{
    NSArray *allRecords = [[DatabaseHelper shareMyInstance] getAllRecordObjectsFromDatabase:kToDoTableName];
    [self.todoListTableView reloadData];
}

- (void)insertRecord
{

    
    NSMutableDictionary *dataRecord = [[NSMutableDictionary alloc] init];
//    [dataRecord setValue:self.dateSelected forKey:kRRRashRecordDate];
//    [dataRecord setValue:self.rightHandString forKey:kRRRashRecordPtRightHand];
//    [dataRecord setValue:self.leftHandString forKey:kRRRashRecordPtLeftHand];
//    [dataRecord setValue:self.rightLegString forKey:kRRRashRecordPtRightLeg];
//    [dataRecord setValue:self.leftLegString forKey:kRRRashRecordPtLeftLeg];
//    [dataRecord setValue:self.viewCalendarDetail.txtDiseaseName.text forKey:kRRRashRecordTile];
//    [dataRecord setValue:[NSString stringWithFormat:@"%d", self.viewCalendarDetail.numAM] forKey:kRRRashRecordNumAmPin];
//    [dataRecord setValue:[NSString stringWithFormat:@"%d", self.viewCalendarDetail.numPM] forKey:kRRRashRecordNumPmPin];
//    
//    [dataRecord setValue:dateExamination forKey:kRRRashRecordHosTime];
//    [dataRecord setValue:self.viewCalendarDetail.txtExaminationPlace.text forKey:kRRRashRecordHosAddress];
//    [dataRecord setValue:self.viewCalendarDetail.textViewNote.text forKey:kRRRashRecordDes];
//    NSMutableArray *result = [[RRDatabaseHelper shareMyInstance] getRecordObjectsFromDate:self.dateSelected.dayBegin toDate:self.dateSelected.dayEnd withTableName:kRRRashRecordTableName];
//    if ([result count] == 0)
//    {
//        [[RRDatabaseHelper shareMyInstance] insertObjectToDataBase:kRRRashRecordTableName withDictionnary:dataRecord];
//    }
//    else
//    {
//        ToDo *updateTodo = [result objectAtIndex:0];
//        updateTodo.des = self.viewCalendarDetail.textViewNote.text;
//        updateTodo.title = self.viewCalendarDetail.txtDiseaseName.text;
//        [[updateTodo shareMyInstance] updateObjectToDatabase:updateRashRecord withDictionnary:dataRecord];
//    }
    /*
     if (touchedView != nil)
     {
     [touchedView drawRect:CGRectMake(touchedView.frame.origin.x, touchedView.frame.origin.y, touchedView.frame.size.width, touchedView.frame.size.height)];
     }
     else
     {*/
//    RRCalendarMonthView *monthView = [activeMonthViews objectAtIndex:2];
//    NSDateComponents *dateComponents = [[NSCalendar currentCalendar] components:NSCalendarCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit fromDate:self.dateSelected];
//    
//    for (RRCalendarDayView *dayView in monthView.dayViews)
//    {
//        if (dayView.day.day == dateComponents.day && dayView.day.month == dateComponents.month && dayView.day.year == dateComponents.year)
//        {
//            [dayView drawRect:CGRectMake(dayView.frame.origin.x, dayView.frame.origin.y, dayView.frame.size.width, dayView.frame.size.height)];
//        }
//    }
    //}
    
}


- (id)loadFromNibNamed:(NSString *)nibName
{
    if (![[NSBundle mainBundle] pathForResource:nibName ofType:@"nib"]) {
        nibName = [nibName stringByAppendingString:@"_iPhone"];
    }
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:nibName owner:nil options:nil];
    return [nib objectAtIndex:0];
}

#pragma mark - table view

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _todoLists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *todoCellIdentifier = @"TodoTableViewCell";
        TodoTableViewCell *todoCell = (TodoTableViewCell *)[tableView dequeueReusableCellWithIdentifier:todoCellIdentifier];
        if (todoCell == nil) {
            todoCell = [self loadFromNibNamed:todoCellIdentifier];
        }
//        expandRcordCell.rashRecord = [_todoLists objectAtIndex:indexPath.row - 1];
        return todoCell;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return indexPath.row == _currentExpandedCell ? EXPANDED_CELL_HEIGHT : [self collapsedCellHeight];
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


@end
