//
//  PDOverlayView.m
//  Pashadelic
//
//  Created by TungNT2 on 8/7/13.
//
//

#import "OverlayView.h"

@implementation OverlayView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setContentForView];
    }
    return self;
}


- (void)setContentForView
{
    self.backgroundColor = [UIColor clearColor];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(self.delegate && [self.delegate respondsToSelector:@selector(didTouchesToOverlayView)]){
        [self.delegate didTouchesToOverlayView];
    }
}

@end
