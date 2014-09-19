//
//  CKGPViewController.m
//  GloverPreview
//
//  Created by Christopher Kha on 9/9/14.
//  Copyright (c) 2014 Chris Kha Apps. All rights reserved.
//

#import "CKGPViewController.h"
#import "CKGPColorPickerViewController.h"
#import "CKGPColorSet.h"
#import "CKGPColorStrobeView.h"

@interface CKGPViewController ()
@property (weak, nonatomic) IBOutlet UIButton *colorsCopyButton;
@property (nonatomic, strong) NSMutableArray *colorViewsArray;
@end

@implementation CKGPViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.colorViewsArray = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    NSThread *strobeThread = [[NSThread alloc] initWithTarget:self selector:@selector(doStrobe) object:nil];
//    [strobeThread start];
    
//    UISwipeGestureRecognizer *swipeRightRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(respondToSwipeGesture:)];
//    swipeRightRecognizer.numberOfTouchesRequired = 1;
//    swipeRightRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
//    [self.view addGestureRecognizer:swipeRightRecognizer];
//    
//    UISwipeGestureRecognizer *swipeLeftRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(respondToSwipeGesture:)];
//    swipeLeftRecognizer.numberOfTouchesRequired = 1;
//    swipeLeftRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
//    [self.view addGestureRecognizer:swipeLeftRecognizer];

    [self.colorsCopyButton setHidden:YES];
    
    
    CGRect rect = CGRectMake(150, 50, 50, 50);
    CKGPColorStrobeView *colorStrobeView = [[CKGPColorStrobeView alloc] initWithFrame:rect];
    [self.colorViewsArray addObject:colorStrobeView];
    [self.view addSubview:colorStrobeView];
    
    rect = CGRectMake(150, 150, 50, 50);
    colorStrobeView = [[CKGPColorStrobeView alloc] initWithFrame:rect];
    [self.colorViewsArray addObject:colorStrobeView];
    [self.view addSubview:colorStrobeView];
    
    rect = CGRectMake(150, 250, 50, 50);
    colorStrobeView = [[CKGPColorStrobeView alloc] initWithFrame:rect];
    [self.colorViewsArray addObject:colorStrobeView];
    [self.view addSubview:colorStrobeView];
    
    rect = CGRectMake(150, 350, 50, 50);
    colorStrobeView = [[CKGPColorStrobeView alloc] initWithFrame:rect];
    [self.colorViewsArray addObject:colorStrobeView];
    [self.view addSubview:colorStrobeView];
    
    rect = CGRectMake(150, 450, 50, 50);
    colorStrobeView = [[CKGPColorStrobeView alloc] initWithFrame:rect];
    [self.colorViewsArray addObject:colorStrobeView];
    [self.view addSubview:colorStrobeView];
    
    for (int i = 0; i < [self.colorViewsArray count]; i++) {
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(respondToTapGesture:)];
        tapGestureRecognizer.numberOfTouchesRequired = 1;

        [self.colorViewsArray[i] addGestureRecognizer:tapGestureRecognizer];
    }
    
    for (int i = 0; i < [self.colorViewsArray count]; i++) {
        NSTimeInterval timeInterval = ((CKGPColorStrobeView *)self.colorViewsArray[i]).strobeTime;
        NSTimer *strobeTimer =  [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self.colorViewsArray[i] selector:@selector(changeColor) userInfo:nil repeats:YES];
        [strobeTimer fire];
    }
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(mainViewTapped)];
    [self.view addGestureRecognizer:tapGestureRecognizer];
    
}

- (void)mainViewTapped
{
    NSLog(@"Main View Tapped");
    if ([self.colorsCopyButton isHidden]) {
        [self.colorsCopyButton setHidden:NO];
    } else {
        [self.colorsCopyButton setHidden:YES];
    }
}

- (void)respondToTapGesture:(UITapGestureRecognizer *)recognizer
{    
    CKGPColorPickerViewController *colorPickerVC = [[CKGPColorPickerViewController alloc] initWithNibName:@"CKGPColorPickerViewController" bundle:nil];
    colorPickerVC.delegate = self;
    colorPickerVC.viewObjectToModify = (CKGPColorStrobeView *)recognizer.view;
    [self presentViewController:colorPickerVC animated:YES completion:nil];
    
}

//- (void)respondToSwipeGesture:(UISwipeGestureRecognizer *)recognizer
//{
//    if (recognizer.direction == UISwipeGestureRecognizerDirectionLeft) {
//        NSLog(@"Swiped Left");
//        CKGPColorPickerViewController *colorPickerVC = [[CKGPColorPickerViewController alloc] init];
//        [self presentViewController:colorPickerVC animated:YES completion:nil];
//    } else if (recognizer.direction == UISwipeGestureRecognizerDirectionRight) {
//        NSLog(@"Swiped Right");
//    }
//}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)doStrobe2
{
    NSTimeInterval timeInterval = .05;
    NSTimer *strobeTimer =  [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(changeColor) userInfo:nil repeats:YES];
    [strobeTimer fire];
}

- (void)setNewColors:(NSArray *)colorsArray forView:(CKGPColorStrobeView *)view
{
    [view.colorSet setWithColorArray:colorsArray];
//    [view.colorSet setFirstColor:colorsArray[0]];
//    [view.colorSet setSecondColor:colorsArray[1]];
//    [view.colorSet setThirdColor:colorsArray[2]];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (IBAction)didTapCopyColorsButton:(id)sender
{
    NSLog(@"Copy Colors");
    CKGPColorSet *colorSet = [self.colorViewsArray[0] colorSet];
    for (CKGPColorStrobeView *colorStrobeView in self.colorViewsArray) {
        [colorStrobeView.colorSet setWithColorSet:colorSet];
    }
}

@end
