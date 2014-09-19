//
//  CKGPColorStrobeView.m
//  GloverPreview
//
//  Created by Christopher Kha on 9/10/14.
//  Copyright (c) 2014 Chris Kha Apps. All rights reserved.
//

#import "CKGPColorStrobeView.h"
#import "CKGPColorSet.h"

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
        self.strobeTime = 0.0167;
        self.colorSet = [[CKGPColorSet alloc] initRGB];
        _currentColorIndex = 0;
        _threshold = 1; // 1 second
        _nowTime = CACurrentMediaTime();
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)changeColor
{
//
    NSInteger countColors = [self.colorSet.colorSetArray count];
//    _nowTime = CACurrentMediaTime();
    
//    if ((CACurrentMediaTime() - _nowTime) > _threshold) {
//        NSLog(@"1 second passed: %d calls", _currentColorIndex);
//        _nowTime = CACurrentMediaTime();
//        _currentColorIndex = 0;
//    }
    
    self.backgroundColor = self.colorSet.colorSetArray[_currentColorIndex % countColors];
    _currentColorIndex++;
}

@end
