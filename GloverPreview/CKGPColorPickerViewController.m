//
//  CKGPColorPickerViewController.m
//  GloverPreview
//
//  Created by Christopher Kha on 9/9/14.
//  Copyright (c) 2014 Chris Kha Apps. All rights reserved.
//

#import "CKGPColorPickerViewController.h"
#import "CKGPConstants.h"

@interface CKGPColorPickerViewController ()
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (nonatomic, strong) NSArray *allColorsArray;
@property (nonatomic, strong) NSArray *allColorsNamesArray;

@property (nonatomic, strong) UIColor *color1;
@property (nonatomic, strong) UIColor *color2;
@property (nonatomic, strong) UIColor *color3;

@property (nonatomic, weak) UICollectionViewCell *selectedColorCell1;
@property (nonatomic, weak) UICollectionViewCell *selectedColorCell2;
@property (nonatomic, weak) UICollectionViewCell *selectedColorCell3;

@end

@implementation CKGPColorPickerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    CGFloat redValue, greenValue, blueValue = 0;
//    [self.viewObjectToModify.colorSet.firstColor getRed:&redValue green:&greenValue blue:&blueValue alpha:nil];
    
    self.allColorsNamesArray = @[COLOR_STRING_WHITE, COLOR_STRING_BLANK, COLOR_STRING_RED, COLOR_STRING_GREEN,
                                 COLOR_STRING_BLUE, COLOR_STRING_SKYBLUE, COLOR_STRING_LIGHTBLUE, COLOR_STRING_SILVER,
                                 COLOR_STRING_MINT, COLOR_STRING_OFFWHITE, COLOR_STRING_PURPLE, COLOR_STRING_LAVENDAR,
                                 COLOR_STRING_HOTPINK, COLOR_STRING_PINK, COLOR_STRING_LIGHTPINK, COLOR_STRING_BLUSH,
                                 COLOR_STRING_ORANGE, COLOR_STRING_YELLOW, COLOR_STRING_WARMWHITE, COLOR_STRING_TURQUOISE];
    
    self.allColorsArray = [[NSArray alloc] initWithObjects:
                       [UIColor whiteColor], // White
                       [UIColor blackColor],// Blank (Black)
                       [UIColor colorWithRed:237.0/255.0 green:10.0/255.0 blue:21.0/255.0 alpha:1.0],// Red
                       [UIColor colorWithRed:6.0/255.0 green:247.0/255.0 blue:108.0/255.0 alpha:1.0],// Green
                       [UIColor colorWithRed:6.0/255.0 green:137.0/255.0 blue:255.0/255.0 alpha:1.0],// Blue
                       [UIColor colorWithRed:3.0/255.0 green:191.0/255.0 blue:254.0/255.0 alpha:1.0],// Sky Blue
                       [UIColor colorWithRed:8.0/255.0 green:240.0/255.0 blue:252.0/255.0 alpha:1.0],// Light Blue
                       [UIColor colorWithRed:192.0/255.0 green:191.0/255.0 blue:197.0/255.0 alpha:1.0],// Silver
                       [UIColor colorWithRed:171.0/255.0 green:211.0/255.0 blue:202.0/255.0 alpha:1.0],// Mint
                       [UIColor colorWithRed:255.0/255.0 green:239.0/255.0 blue:240.0/255.0 alpha:1.0],// Off White
                       [UIColor colorWithRed:115.0/255.0 green:111.0/255.0 blue:250.0/255.0 alpha:1.0],// Purple
                       [UIColor colorWithRed:222.0/255.0 green:190.0/255.0 blue:239.0/255.0 alpha:1.0],// Lavender
                       [UIColor colorWithRed:245.0/255.0 green:21.0/255.0 blue:154.0/255.0 alpha:1.0],// Hot Pink
                       [UIColor colorWithRed:219.0/255.0 green:57.0/255.0 blue:204.0/255.0 alpha:1.0],// Pink
                       [UIColor colorWithRed:245.0/255.0 green:194.0/255.0 blue:227.0/255.0 alpha:1.0],// Light Pink
                       [UIColor colorWithRed:201.0/255.0 green:95.0/255.0 blue:167.0/255.0 alpha:1.0],// Blush
                       [UIColor colorWithRed:212.0/255.0 green:54.0/255.0 blue:27.0/255.0 alpha:1.0],// Orange
                       [UIColor colorWithRed:222.0/255.0 green:242.0/255.0 blue:49.0/255.0 alpha:1.0],// Yellow
                       [UIColor colorWithRed:243.0/255.0 green:228.0/255.0 blue:195.0/255.0 alpha:1.0],// Warm White
                       [UIColor colorWithRed:1.0/255.0 green:220.0/255.0 blue:164.0/255.0 alpha:1.0],// Turquoise
                       nil]; // End colors
    
    UINib *cellNib = [UINib nibWithNibName:@"CKGPCollectionViewCell" bundle:nil];
    [self.colorCollectionView1 registerNib:cellNib forCellWithReuseIdentifier:@"cvCell"];
    [self.colorCollectionView2 registerNib:cellNib forCellWithReuseIdentifier:@"cvCell"];
    [self.colorCollectionView3 registerNib:cellNib forCellWithReuseIdentifier:@"cvCell"];
    
    // Initialize colors
    CKGPColorSet *colorSet = self.viewObjectToModify.colorSet;
    self.color1 = colorSet.firstColor;
    self.color2 = colorSet.secondColor;
    self.color3 = colorSet.thirdColor;

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backButtonPressed:(id)sender {
    NSArray *colorArray = @[self.color1, self.color2, self.color3];
    [self delegateCallback:colorArray];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)delegateCallback:(NSArray *)colorsArray
{
    [self.delegate setNewColors:colorsArray forView:self.viewObjectToModify];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.allColorsArray count];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cvCell" forIndexPath:indexPath];
    
    cell.backgroundColor = _allColorsArray[indexPath.row];
    NSString *colorText = _allColorsNamesArray[indexPath.row];
    
    UILabel *titleLabel = (UILabel *)[cell viewWithTag:100];
    UILabel *selectedLabel = (UILabel *)[cell viewWithTag:200];
    
    [titleLabel setText:colorText];
    [selectedLabel setHidden:YES];
    
    if (collectionView == self.colorCollectionView1) {
        if ([cell.backgroundColor isEqual:self.color1]) {
            cell.selected = YES;
            self.selectedColorCell1 = cell;
            [selectedLabel setHidden:NO];
        }
    } else if (collectionView == self.colorCollectionView2) {
        if ([cell.backgroundColor isEqual:self.color2 ]) {
            cell.selected = YES;
            self.selectedColorCell2 = cell;
            [selectedLabel setHidden:NO];

        }
    } else if (collectionView == self.colorCollectionView3) {
        if ([cell.backgroundColor isEqual:self.color3 ]) {
            cell.selected = YES;
            self.selectedColorCell3 = cell;
            [selectedLabel setHidden:NO];

        }
    }
    
    if ([colorText isEqualToString:@"Blank"]) {
        titleLabel.textColor = [UIColor whiteColor];
        selectedLabel.textColor = [UIColor whiteColor];
    } else {
        titleLabel.textColor = [UIColor blackColor];
        selectedLabel.textColor = [UIColor blackColor];
    }
    
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *oldCell;
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    UILabel *oldSelectedLabel;
    UILabel *selectedLabel = (UILabel *)[cell viewWithTag:200];
    
    
    if (collectionView == self.colorCollectionView1) {
        oldCell = self.selectedColorCell1;
        oldSelectedLabel = (UILabel *)[oldCell viewWithTag:200];
        [oldSelectedLabel setHidden:YES];
        
        NSLog(@"CollectionView1 selected Color: %@", self.allColorsNamesArray[indexPath.row]);
        self.selectedColorCell1 = cell;
        self.color1 = self.allColorsArray[indexPath.row];
    } else if (collectionView == self.colorCollectionView2) {
        oldCell = self.selectedColorCell2;
        oldSelectedLabel = (UILabel *)[oldCell viewWithTag:200];
        [oldSelectedLabel setHidden:YES];
        
        NSLog(@"CollectionView2 selected Color: %@", self.allColorsNamesArray[indexPath.row]);
        self.selectedColorCell2 = cell;
        self.color2 = self.allColorsArray[indexPath.row];
    } else if (collectionView == self.colorCollectionView3) {
        oldCell = self.selectedColorCell3;
        oldSelectedLabel = (UILabel *)[oldCell viewWithTag:200];
        [oldSelectedLabel setHidden:YES];
        
        NSLog(@"CollectionView3 selected Color: %@", self.allColorsNamesArray[indexPath.row]);
        self.selectedColorCell3 = cell;
        self.color3 = self.allColorsArray[indexPath.row];
    }
    
    [selectedLabel setHidden:NO];
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    UILabel *selectedLabel = (UILabel *)[cell viewWithTag:200];
    
    [selectedLabel setHidden:YES];
}


@end
