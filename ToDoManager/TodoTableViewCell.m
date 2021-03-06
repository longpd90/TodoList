//
//  TodoTableViewCell.m
//  ToDoManager
//
//  Created by LongPD-PC on 1/29/15.
//  Copyright (c) 2015 LongPD-PC. All rights reserved.
//

#import "TodoTableViewCell.h"

@implementation TodoTableViewCell

- (void)awakeFromNib {
    self.backgroundColor = [UIColor clearColor];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (void)setTodoEntity:(ToDo *)todoEntity{
    CGSize maximumLabelSize = CGSizeMake(_contentLabel.frame.size.width, FLT_MAX);
    _contentLabel.text = todoEntity.des;
        CGSize contentLabelSize = [todoEntity.des boundingRectWithSize:maximumLabelSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:_contentLabel.font} context:NSLineBreakByWordWrapping].size;
    CGRect newRect = _contentLabel.frame;
    newRect.size.height	= contentLabelSize.height;
    _contentLabel.frame = newRect;
}

@end
