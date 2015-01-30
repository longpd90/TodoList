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
    _todoTextField.placeholder = @"+ add a new event";
    [_todoTextField setReturnKeyType:UIReturnKeyDone];
    _editButton.layer.cornerRadius = 4;
    [self resetContentTodoList];
}
# pragma mark - action

- (void)resetContentTodoList
{
    _todoLists = [[DatabaseHelper shareMyInstance] getAllRecordObjectsFromDatabase:kToDoTableName];
    [self.todoListTableView reloadData];
}

- (IBAction)editTodoEvent:(id)sender {
    if(!self.todoListTableView.editing){
        [self.editButton setTitle:@"Done" forState:UIControlStateNormal];
        [self.editButton setTitle:@"Done" forState:UIControlStateNormal];
        _todoTextField.text = nil;
        [_todoTextField resignFirstResponder];
        _editing = NO;

        [self.todoListTableView setEditing:YES animated:YES];
    } else {
        [self.editButton setTitle:@"Delete" forState:UIControlStateNormal];
        [self.editButton setTitle:@"Delete" forState:UIControlStateSelected];

        [self.todoListTableView setEditing:NO animated:YES];
    }
}

#pragma mark - update data

- (void)addEvent
{
    NSMutableDictionary *dataTodo = [[NSMutableDictionary alloc] init];
    [dataTodo setValue:_todoTextField.text forKey:kToDoDes];
    [[DatabaseHelper shareMyInstance] insertObjectToDataBase:kToDoTableName withDictionnary:dataTodo];
}

- (void)editEvent:(ToDo *)todoEntity{
    NSMutableDictionary *dataTodo= [[NSMutableDictionary alloc] init];
    [dataTodo setValue:self.todoTextField.text forKey:kToDoDes];
    [[DatabaseHelper shareMyInstance] updateObjectToDatabase:todoEntity withDictionnary:dataTodo];

}
- (void)deleteEvent:(ToDo *)todoEntity{
    [[DatabaseHelper shareMyInstance] deleteTodo:todoEntity];
}

#pragma mark - private

- (id)loadFromNibNamed:(NSString *)nibName
{
    if (![[NSBundle mainBundle] pathForResource:nibName ofType:@"nib"]) {
        nibName = [nibName stringByAppendingString:@"_iPhone"];
    }
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:nibName owner:nil options:nil];
    return [nib objectAtIndex:0];
}

- (float)heightOfCellWithEntity:(ToDo *)todo{
     UIFont *fontText = [UIFont systemFontOfSize:17];
    CGSize maximumLabelSize = CGSizeMake(self.view.frame.size.width - 10, FLT_MAX);
    CGSize contentLabelSize = [todo.des boundingRectWithSize:maximumLabelSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:fontText} context:NSLineBreakByWordWrapping].size;
    return contentLabelSize.height + 10;
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self heightOfCellWithEntity:(ToDo *)[_todoLists objectAtIndex:indexPath.row]];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *todoCellIdentifier = @"TodoTableViewCell";
        TodoTableViewCell *todoCell = (TodoTableViewCell *)[tableView dequeueReusableCellWithIdentifier:todoCellIdentifier];
        if (!todoCell) {
            todoCell = [self loadFromNibNamed:todoCellIdentifier];
        }
        todoCell.todoEntity = [_todoLists objectAtIndex:indexPath.row];
        return todoCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ToDo *todoEntity = [_todoLists objectAtIndex:indexPath.row];
    _indexEditing = (int) indexPath.row;
    _todoTextField.text = todoEntity.des;
    _editing = YES;
    [_todoTextField becomeFirstResponder];
}

- (void)tableView:(UITableView*)tableView willBeginEditingRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(editingStyle == UITableViewCellEditingStyleDelete){
        ToDo *todoEntity = [_todoLists objectAtIndex:indexPath.row];
        [self deleteEvent:todoEntity];
        [_todoLists removeObjectAtIndex:indexPath.row];
        [self.todoListTableView deleteRowsAtIndexPaths:[NSMutableArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

# pragma mark - text field delegate 

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (_todoTextField.text.length == 0) {
        [_todoTextField resignFirstResponder];
        return YES;
    }
    if (_editing) {
        [self editEvent:[_todoLists objectAtIndex:_indexEditing]];
    }else {
        [self addEvent];
    }
    [self resetContentTodoList];
    self.overlayView.hidden = YES;
    _editing = NO;
    _todoTextField.text = nil;
    [_todoTextField resignFirstResponder];
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if (!self.overlayView) {
        self.overlayView = [[OverlayView alloc] initWithFrame:CGRectMake(0, self.todoListTableView.frame.origin.y + 40,self.view.frame.size.width, self.todoListTableView.frame.size.height)];
        self.overlayView.backgroundColor = [UIColor clearColor];
        self.overlayView.delegate = self;
        [self.view addSubview:self.overlayView];
    }
    self.overlayView.hidden = NO;
    return YES;
}

# pragma mark - overlay view delegate

- (void)didTouchesToOverlayView
{
    [_todoTextField resignFirstResponder];
    self.overlayView.hidden = YES;
}
@end
