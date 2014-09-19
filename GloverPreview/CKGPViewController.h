//
//  CKGPViewController.h
//  GloverPreview
//
//  Created by Christopher Kha on 9/9/14.
//  Copyright (c) 2014 Chris Kha Apps. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CKGPColorStrobeView;

@protocol CKGPViewControllerDelegate <NSObject>
@required
- (void)delegateCallback:(NSArray *)colorArray;
@end

@interface CKGPViewController : UIViewController

//@property (nonatomic, retain) IBOutlet UIView *colorView;

- (void)setNewColors:(NSArray *)colorsArray forView:(CKGPColorStrobeView *)view;


@end
