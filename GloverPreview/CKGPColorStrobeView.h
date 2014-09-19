//
//  CKGPColorStrobeView.h
//  GloverPreview
//
//  Created by Christopher Kha on 9/10/14.
//  Copyright (c) 2014 Chris Kha Apps. All rights reserved.
//

#import <UIKit/UIKit.h>

// Class forward declaration
@class CKGPColorSet;

@interface CKGPColorStrobeView : UIView


@property (nonatomic) double strobeTime;
@property (nonatomic) CKGPColorSet *colorSet;

- (void)changeColor;

@end
