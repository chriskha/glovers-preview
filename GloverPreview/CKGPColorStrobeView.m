//
//  CKGPColorStrobeView.m
//  GloverPreview
//
//  Created by Christopher Kha on 9/10/14.
//  Copyright (c) 2014 Chris Kha Apps. All rights reserved.
//

#import "CKGPColorStrobeView.h"
#import "CKGPColorSet.h"

float const COLOR_STROBE_VIEW_WIDTH = 70;
float const COLOR_STROBE_VIEW_HEIGHT = 70;
float const STROBE_TIME_60HZ = 0.0167;

@interface CKGPColorStrobeView () {
    int _currentColorIndex;
    int _threshold;
    double _nowTime;
}

@end

@implementation CKGPColorStrobeView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.strobeTime = STROBE_TIME_60HZ;
        self.colorSet = [[CKGPColorSet alloc] initRGB];
        _currentColorIndex = 0;
        _threshold = 1; // 1 second
        _nowTime = CACurrentMediaTime();
        
        // Clip strobe view into a circle
        self.layer.cornerRadius = self.frame.size.height / 2;
        self.clipsToBounds = YES;
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}


- (void)changeColor
{
    NSInteger countColors = [self.colorSet.colorSetArray count];
    
    self.backgroundColor = self.colorSet.colorSetArray[_currentColorIndex % countColors];
    _currentColorIndex++;
}

@end
