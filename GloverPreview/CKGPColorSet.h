//
//  CKGPColorSet.h
//  GloverPreview
//
//  Created by Christopher Kha on 9/9/14.
//  Copyright (c) 2014 Chris Kha Apps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CKGPColorSet : NSObject

@property (nonatomic) NSMutableArray *colorSetArray;
@property (nonatomic, readonly) UIColor *firstColor;
@property (nonatomic, readonly) UIColor *secondColor;
@property (nonatomic, readonly) UIColor *thirdColor;

- (instancetype)initRGB;
- (instancetype)initWithColor1:(UIColor *)color1 color2:(UIColor *)color2 color3:(UIColor *)color3;

- (void)setFirstColor:(UIColor *)firstColor;
- (void)setSecondColor:(UIColor *)secondColor;
- (void)setThirdColor:(UIColor *)thirdColor;

- (void)setWithColorArray:(NSArray *)colorArray;
- (void)setWithColorSet:(CKGPColorSet *)colorSet;

@end
