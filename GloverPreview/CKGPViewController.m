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

    [self.colorsCopyButton setHidden:YES];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat topOffset = (screenRect.size.height * .05);
    CGFloat bottomOffset = (screenRect.size.height * .05);
    CGFloat height = (screenRect.size.height * .15);
    CGFloat x_position = (screenRect.size.width / 2) - (height / 2);
    CGFloat circleOffset = (screenRect.size.height * .015);
    CGFloat y_position = topOffset + circleOffset;
    
    CGRect rect = CGRectMake(x_position, y_position, height, height);
    CKGPColorStrobeView *colorStrobeView = [[CKGPColorStrobeView alloc] initWithFrame:rect];
    [self.colorViewsArray addObject:colorStrobeView];
    [self.view addSubview:colorStrobeView];
    
    y_position = y_position + (2*circleOffset) + height;
    rect = CGRectMake(x_position, y_position, height, height);
    colorStrobeView = [[CKGPColorStrobeView alloc] initWithFrame:rect];
    [self.colorViewsArray addObject:colorStrobeView];
    [self.view addSubview:colorStrobeView];
    
    y_position = y_position + (2*circleOffset) + height;
    rect = CGRectMake(x_position, y_position, height, height);
    colorStrobeView = [[CKGPColorStrobeView alloc] initWithFrame:rect];
    [self.colorViewsArray addObject:colorStrobeView];
    [self.view addSubview:colorStrobeView];
    
    y_position = y_position + (2*circleOffset) + height;
    rect = CGRectMake(x_position, y_position, height, height);
    colorStrobeView = [[CKGPColorStrobeView alloc] initWithFrame:rect];
    [self.colorViewsArray addObject:colorStrobeView];
    [self.view addSubview:colorStrobeView];

    y_position = y_position + (2*circleOffset) + height;
    rect = CGRectMake(x_position, y_position, height, height);
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
//        [self.colorViewsArray[i] setBackgroundColor:[UIColor whiteColor]];
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
