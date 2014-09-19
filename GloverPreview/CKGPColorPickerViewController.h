//
//  CKGPColorPickerViewController.h
//  GloverPreview
//
//  Created by Christopher Kha on 9/9/14.
//  Copyright (c) 2014 Chris Kha Apps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CKGPColorSet.h"
#import "CKGPViewController.h"
#import "CKGPColorStrobeView.h"

@interface CKGPColorPickerViewController : UIViewController <CKGPViewControllerDelegate, UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) CKGPViewController *delegate;
@property (weak, nonatomic) CKGPColorStrobeView *viewObjectToModify;

@property (weak, nonatomic) IBOutlet UICollectionView *colorCollectionView1;
@property (weak, nonatomic) IBOutlet UICollectionView *colorCollectionView2;
@property (weak, nonatomic) IBOutlet UICollectionView *colorCollectionView3;


@end
