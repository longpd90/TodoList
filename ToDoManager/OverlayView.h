//
//  PDOverlayView.h
//  Pashadelic
//
//  Created by TungNT2 on 8/7/13.
//
//

#import <UIKit/UIKit.h>

@protocol OverlayViewDelegate <NSObject>
- (void)didTouchesToOverlayView;
@end

@interface OverlayView : UIView
@property (strong, nonatomic)id<OverlayViewDelegate>delegate;

@end
