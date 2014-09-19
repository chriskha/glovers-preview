//
//  CKGPColorSet.m
//  GloverPreview
//
//  Created by Christopher Kha on 9/9/14.
//  Copyright (c) 2014 Chris Kha Apps. All rights reserved.
//

#import "CKGPColorSet.h"

@implementation CKGPColorSet

- (instancetype)init
{
    self = [self initRGB];
    return self;
}

- (instancetype)initRGB
{
    
    self = [self initWithColor1:[UIColor colorWithRed:237.0/255.0 green:10.0/255.0 blue:21.0/255.0 alpha:1.0] // Red
                        color2:[UIColor colorWithRed:6.0/255.0 green:247.0/255.0 blue:108.0/255.0 alpha:1.0] // Green
                         color3:[UIColor colorWithRed:6.0/255.0 green:137.0/255.0 blue:255.0/255.0 alpha:1.0]]; // Blue
    return self;
}

- (instancetype)initWithColor1:(UIColor *)color1 color2:(UIColor *)color2 color3:(UIColor *)color3
{
    self = [super init];
    if (self) {
        self.colorSetArray = [[NSMutableArray alloc] initWithObjects:color1, [UIColor blackColor],
                              color2, [UIColor blackColor],
                              color3, [UIColor blackColor],
                              nil];
    }
    return self;
}

- (UIColor *)firstColor
{
    return self.colorSetArray[0];
}

- (UIColor *)secondColor
{
    return self.colorSetArray[2];
}

- (UIColor *)thirdColor
{
    return self.colorSetArray[4];
}

- (void)setFirstColor:(UIColor *)firstColor
{
    self.colorSetArray[0] = firstColor;
}

- (void)setSecondColor:(UIColor *)secondColor
{
    self.colorSetArray[2] = secondColor;
}

- (void)setThirdColor:(UIColor *)thirdColor
{
    self.colorSetArray[4] = thirdColor;
}

- (void)setWithColorArray:(NSArray *)colorArray
{
    [self setFirstColor:colorArray[0]];
    [self setSecondColor:colorArray[1]];
    [self setThirdColor:colorArray[2]];
}

- (void)setWithColorSet:(CKGPColorSet *)colorSet
{
    self.firstColor = colorSet.firstColor;
    self.secondColor = colorSet.secondColor;
    self.thirdColor = colorSet.thirdColor;
}


@end
