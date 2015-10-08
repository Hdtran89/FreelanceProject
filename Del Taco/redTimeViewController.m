//
//  redTimeViewController.m
//  Del Taco
//
//  Created by iOSDev on 8/11/15.
//  Copyright (c) 2015 United Tax. All rights reserved.
//


//KNOWN ISSUES:
//LOCAL NOTIFICATIONS NOT WORKING
//TEXTFIELDS RESET ON SEGMENT SWITCH (PROPOSED FIX: MOVE INITIALIZATION CODE OUTSIDE OF TACOBAR BLOCK AND MAKE IT UNIVERSAL.

#import "redTimeViewController.h"


@interface redTimeViewController () {
    UIView *drinkStationView;
    UIView *tacoBarView;
    
    int xMargin;
    int yMarginTop;
    int yMarginBottom;
    CGFloat totalEffectiveWidth;
    CGFloat totalEffectiveHeight;
    
    BOOL isDrinkStation;
    BOOL isTacoBar;
    
    CGPoint drinkStationCenter;
    CGPoint tacoBarCenter;
    CGRect drinkAndTacoFrame;
    
    UIView *tut;
    
    UILabel *redTimeVegBlend;
    UILabel *redTimeTomatoes_S;
    UILabel *redTimeTomatoes_D;
    UILabel *picoDeGallo;
    
    //constraints
    CGFloat widthOfItemColumn;
    CGFloat widthOfStandardsColumn;
    CGFloat widthOfInputColumn;
    CGFloat heightOfCell;
    
    CGFloat xOffsetC1;
    CGFloat xOffsetC2;
    CGFloat xOffsetC3;
    CGFloat xOffsetC4;
    
    CGFloat yOffsetR1;
    CGFloat yOffsetR2;
    CGFloat yOffsetR3;
    CGFloat yOffsetR4;
    CGFloat yOffsetR5;
    CGFloat yOffsetR6;
    CGFloat yOffsetR7;
    CGFloat yOffsetR8;
    CGFloat yOffsetR9;
    CGFloat yOffsetR10;
    CGFloat yOffsetR11;
    CGFloat yOffsetR12;
    CGFloat yOffsetR13;
    CGFloat yOffsetR14;
    CGFloat yOffsetR15;
    CGFloat yOffsetR16;
    CGFloat yOffsetR17;
    CGFloat yOffsetR18;
    CGFloat yOffsetR19;
    
    NSMutableArray *redTimeLabelsDrinkStation;
    NSMutableArray *redTimeLabelsTacoBar;
    NSMutableArray *drinkStationFields;
    
    NSString * itemname;
    NSDate * datetime;
    Boolean otherOption;
    
}


@end


@implementation redTimeViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITapGestureRecognizer *tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapMethod)];
    tapped.delegate=self;
    tapped.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:tapped];
    [self loadDefaultSegmentView];
    [self loadTableConstraints];
    [self initializeDrinkAndTacoViews];
    self.prepRedTimeChartItems = @[@"American Cheese", @"Ancho Sauce", @"Bulk Ketchup", @"Butter Blend", @"Cheddar Cheese", @"Chicken Steak", @"Chocolate Syrup", @"Green Sauce", @"Guacamole", @"Hamburger Patties", @"Hamburger Sauce", @"HS and HP Tortillas", @"Jalapeños", @"Pita Bread Gordas", @"Secret Sauce", @"Sour Cream", @"Spicy Jack Cheese", @"Taco Sauce", @"Tomatoes - Sliced/Diced", @"Uncooked Bacon Tiras", @"Uncooked Eggs", @"Bacon Piezas"];
    self.prepRedTimeChartTimes = @[@"30 Days", @"7 Days", @"7 Days", @"3 Months", @"24 Hours", @"72 Hours", @"7 Days", @"3 Days", @"24 Hours", @"Use by Case Date", @"7 Days", @"Walk in: 30 days, Storeroom: 14 days", @"21 Days", @"3 Days", @"7 Days", @"24 hours", @"30 Days", @"7 Days", @"12 Hours", @"7 Days", @"4 Hours", @"10 Days"];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    self.window = [[UIWindow alloc] initWithFrame: [UIScreen mainScreen].bounds];
    [self updateRefreshButton];

}


- (void) updateRefreshButton {
    if ([Utils getLoggedIn]) [self.refreshBtn setEnabled:YES];
    else [self.refreshBtn setEnabled: NO];
    
    [self.refreshBtn setTintColor:[Utils DT_RED]];
}

- (void) showTut {
    if (isDrinkStation || isTacoBar) {
        tut = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [Utils getScreenWidth], [Utils getScreenHeight])];
        [tut setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:.8]];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, [Utils getScreenHeight]/5, [Utils getScreenWidth], [Utils getScreenHeight]/2)];
        [label setText:@"Enter all times in the format h:mm AM/PM.\nFor example, 12:30 PM or 9:45 AM.\n\n Tap anywhere to dismiss this screen."];
        [label setTextAlignment:NSTextAlignmentCenter];
        [label setTextColor:[Utils DT_WHITE]];
        [label setNumberOfLines:0];
        [label setLineBreakMode:NSLineBreakByWordWrapping];
        [label setFont:[UIFont fontWithName:@"Helvetica" size:26]];
        [tut addSubview:label];
        
        [self.view addSubview:tut];
    }
}

- (BOOL) gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if (tut && touch.view == tut) {
        return YES;
    } return NO;
}

-(void)tapMethod {
    [tut removeFromSuperview];
    tut=nil;
}

- (void)keyboardDidShow:(NSNotification *)note {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.2];
    //     drinkAndTacoFrame = CGRectMake(xMargin, yMarginTop, totalEffectiveWidth, totalEffectiveHeight)
    int center = 100;
    if (isTacoBar) center = 80;
    drinkStationView.center = CGPointMake(drinkStationCenter.x, drinkStationCenter.y-center);
    tacoBarView.center = CGPointMake(tacoBarCenter.x, tacoBarCenter.y-center);
    [UIView commitAnimations];
    /* keyboard is visible, move views */
}


- (void)keyboardDidHide:(NSNotification *)note {
    /* resign first responder, hide keyboard, move views */
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.2];
    //     drinkAndTacoFrame = CGRectMake(xMargin, yMarginTop, totalEffectiveWidth, totalEffectiveHeight)
    drinkStationView.center = CGPointMake(drinkStationCenter.x, drinkStationCenter.y);
    tacoBarView.center = CGPointMake(tacoBarCenter.x, tacoBarCenter.y);
    [UIView commitAnimations];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) loadTableConstraints {
    
    int xMargin = .1*[Utils getScreenWidth];
    int yMarginFromTop = 500;
    int yMarginFromBottom = 0;
    int tableHeight = [Utils getScreenHeight] - yMarginFromBottom - yMarginFromTop;
    int tableWidth = [Utils getScreenWidth] - 2*xMargin;
    
    self.table.frame = CGRectMake(xMargin, yMarginFromTop, tableWidth, tableHeight);
    
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.prepRedTimeChartItems count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *ID = @"id";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    cell.textLabel.text = self.prepRedTimeChartItems[indexPath.row];
    cell.detailTextLabel.text = self.prepRedTimeChartTimes[indexPath.row];
    cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:18];
    cell.detailTextLabel.textColor = [Utils DT_GREEN];
    cell.detailTextLabel.font = [UIFont fontWithName:@"Helvetica" size:16];
    //textlabel.text = self.greekletters[indexpath.row];
    return cell;
}


- (void) updateSegmentColors
{
    UIColor *checkColor = [Utils DT_GREEN];
    NSArray *segmentColors = [[NSArray alloc] initWithObjects:checkColor, [Utils DT_YELLOW], [Utils DT_RED], nil];
    
    UISegmentedControl *betterSegmentedControl = self.segmentedControl;
    
    // Get number of segments
    NSUInteger numSegments = [betterSegmentedControl.subviews count];
    
    // Reset segment's color (non selected color)
    for( int i = 0; i < numSegments; i++ ) {
        // reset color
        [[betterSegmentedControl.subviews objectAtIndex:i] setTintColor:nil];
        [[betterSegmentedControl.subviews objectAtIndex:i] setTintColor:[Utils DT_GREEN]];
    }
    
    // Sort segments from left to right
    NSArray *sortedViews = [betterSegmentedControl.subviews sortedArrayUsingFunction:compareViewsByOrigin context:NULL];
    
    // Change color of selected segment
    NSInteger selectedIdx = betterSegmentedControl.selectedSegmentIndex;
    [[sortedViews objectAtIndex:selectedIdx] setTintColor:[segmentColors objectAtIndex:selectedIdx]];
    
    // Remove all original segments from the control
    for (id view in betterSegmentedControl.subviews) {
        [view removeFromSuperview];
    }
    
    // Append sorted and colored segments to the control
    for (id view in sortedViews) {
        [betterSegmentedControl addSubview:view];
    }
}


NSInteger static compareViewsByOrigin(id sp1, id sp2, void *context) {
    // UISegmentedControl segments use UISegment objects (private API). But we can safely cast them to UIView objects.
    float v1 = ((UIView *)sp1).frame.origin.x;
    float v2 = ((UIView *)sp2).frame.origin.x;
    if (v1 < v2)
        return NSOrderedAscending;
    else if (v1 > v2)
        return NSOrderedDescending;
    else
        return NSOrderedSame;
}


- (void) loadDefaultSegmentView {
    [self.segmentedControl setTintColor:[Utils DT_GREEN]];
}


- (IBAction)segmentSwitch:(id)sender {
    [self updateSegmentColors];
    if (self.segmentedControl.selectedSegmentIndex == 1) {
        self.table.hidden = YES;
        tacoBarView.hidden = YES;
        isDrinkStation = YES;
        isTacoBar = NO;
        [self loadDrinkStationView];
    } else if (self.segmentedControl.selectedSegmentIndex == 2) {
        isDrinkStation = NO;
        isTacoBar = YES;
        self.table.hidden = YES;
        drinkStationView.hidden = YES;
        [self loadTacoBarView];
    } else if (self.segmentedControl.selectedSegmentIndex == 0) {
        isDrinkStation= NO;
        isTacoBar =NO;
        self.table.hidden = NO;
        drinkStationView.hidden = YES;
        tacoBarView.hidden = YES;
    }
}

- (void) initializeDrinkAndTacoViews {
    xMargin = .02 * [Utils getScreenWidth];
    yMarginTop = 130;
    yMarginBottom = 50;
    totalEffectiveWidth = [Utils getScreenWidth] -  2*xMargin;
    totalEffectiveHeight = [Utils getScreenHeight] - yMarginBottom - yMarginTop-50;
    
    drinkAndTacoFrame = CGRectMake(xMargin, yMarginTop, totalEffectiveWidth, totalEffectiveHeight);
    
    //drinkStationView = [[UIView alloc] initWithFrame:CGRectMake(xMargin, yMarginTop, totalEffectiveWidth, totalEffectiveHeight)];
    drinkStationView = [[UIView alloc] initWithFrame:drinkAndTacoFrame];
    drinkStationView.hidden = YES;
    //tacoBarView = [[UIView alloc] initWithFrame:CGRectMake(xMargin, yMarginTop, totalEffectiveWidth, totalEffectiveHeight)];
    tacoBarView = [[UIView alloc] initWithFrame:drinkAndTacoFrame];
    tacoBarView.hidden =YES;
    
    [self.view addSubview:drinkStationView];
    [self.view addSubview:tacoBarView];
    
    drinkStationCenter = drinkStationView.center;
    tacoBarCenter = tacoBarView.center;
    
    isDrinkStation = NO;
    isTacoBar = NO;
    
    [self loadDrinkStationConstraints];
    [self loadDrinkStationLabels];
    [self loadDrinkStationLines];
    [self loadDrinkStationTextFields];
    
    [self loadTacoBarConstraints];
    [self loadTacoBarLabels];
    [self loadTacoBarLines];
    [self loadTacoBarTextFields];
}

- (void) loadDrinkStationTextFields {
    UIFont *headerFont = [UIFont fontWithName:@"Helvetica-Bold" size:24];
    UIFont *inputFont = [UIFont fontWithName:@"Helvetica" size:16];
    
    NSNumber *y1 = [NSNumber numberWithFloat:yOffsetR1];
    NSNumber *y2 = [NSNumber numberWithFloat:yOffsetR2];
    NSNumber *y3 = [NSNumber numberWithFloat:yOffsetR3];
    NSNumber *y4 = [NSNumber numberWithFloat:yOffsetR4];
    NSNumber *y5 = [NSNumber numberWithFloat:yOffsetR5];
    NSNumber *y6 = [NSNumber numberWithFloat:yOffsetR6];
    NSNumber *y7 = [NSNumber numberWithFloat:yOffsetR7];
    NSNumber *y8 = [NSNumber numberWithFloat:yOffsetR8];
    NSNumber *y9 = [NSNumber numberWithFloat:yOffsetR9];
    NSNumber *y10 = [NSNumber numberWithFloat:yOffsetR10];
    
    NSMutableArray *yOffsets = [[NSMutableArray alloc] initWithObjects:  y1, y2, y3, y4, y5, y6, y7, y8, y9, y10, nil];
    
    //TEXTFIELDS FOR DRIVE COLUMN
    drinkStationFields = [[NSMutableArray alloc] init];
    
    CGFloat heightOfField = heightOfCell - 5;
    CGFloat widthOfField = (widthOfInputColumn-5)/2;
    CGFloat textFieldPadding = 2.5;
    
    
    //TEXTFIELDS FOR WALK COLUMN
    for (int i  = 0; i < 8; i++) {
        CGFloat yOff = [[yOffsets objectAtIndex:i+1] floatValue] + textFieldPadding;
        UITextField *h = [[UITextField alloc] initWithFrame:CGRectMake(xOffsetC3+textFieldPadding, yOff, widthOfField, heightOfField)];
        [h setTag:i];
        [drinkStationFields addObject:h];
        UITextField *j = [[UITextField alloc] initWithFrame:CGRectMake(xOffsetC4+textFieldPadding, yOff,widthOfField , heightOfField)];
        [j setTag:i+20];
        [drinkStationFields addObject:j];
    }
    
    for (UITextField *l in drinkStationFields) {
        [l setTextAlignment:NSTextAlignmentCenter];
        [l setKeyboardType:UIKeyboardTypeNumbersAndPunctuation];
        [l setFont:inputFont];
        [l setBorderStyle:UITextBorderStyleRoundedRect];
        [l setDelegate:self];
        [drinkStationView addSubview:l];
        
    }
}

- (void) loadDrinkStationConstraints {
    widthOfItemColumn = 0.30*totalEffectiveWidth;
    widthOfStandardsColumn = 0.20*totalEffectiveWidth;
    widthOfInputColumn = (totalEffectiveWidth - widthOfItemColumn - widthOfStandardsColumn) /2;
    heightOfCell = 40;
    
    xOffsetC1 = 0;
    xOffsetC2 = xOffsetC1 + widthOfItemColumn;
    xOffsetC3 = xOffsetC2 + widthOfStandardsColumn;
    xOffsetC4 = xOffsetC3 + widthOfInputColumn;
    
    yOffsetR1 = 0;
    yOffsetR2 = yOffsetR1 + heightOfCell;
    yOffsetR3 = yOffsetR2 + heightOfCell;
    yOffsetR4 = yOffsetR3 + heightOfCell;
    yOffsetR5 = yOffsetR4 + heightOfCell;
    yOffsetR6 = yOffsetR5 + heightOfCell;
    yOffsetR7 = yOffsetR6 + heightOfCell;
    yOffsetR8 = yOffsetR7 + heightOfCell;
    yOffsetR9 = yOffsetR8 + heightOfCell;
    yOffsetR10 = yOffsetR9 + heightOfCell;
}

- (void) loadDrinkStationLabels {
    [self loadDrinkStationConstraints];
    NSMutableArray *headers = [[NSMutableArray alloc] init];
    UIFont *headerFont = [UIFont fontWithName:@"Helvetica-Bold" size:24];

    NSMutableArray *titlesRow1 = [[NSMutableArray alloc] initWithObjects:@"ITEM", @"STANDARDS", @"DRIVE", @"WALK", nil];
    NSMutableArray *yOffsets = [[NSMutableArray alloc] initWithObjects:[NSNumber numberWithFloat:yOffsetR1], [NSNumber numberWithFloat:yOffsetR2], [NSNumber numberWithFloat:yOffsetR3], [NSNumber numberWithFloat:yOffsetR4], [NSNumber numberWithFloat:yOffsetR5], [NSNumber numberWithFloat:yOffsetR6], [NSNumber numberWithFloat:yOffsetR7], [NSNumber numberWithFloat:yOffsetR8], [NSNumber numberWithFloat:yOffsetR9],[NSNumber numberWithFloat:yOffsetR10], nil];
    NSMutableArray *xOffsets = [[NSMutableArray alloc] initWithObjects:[NSNumber numberWithFloat:xOffsetC1], [NSNumber numberWithFloat:xOffsetC2], [NSNumber numberWithFloat:xOffsetC3], [NSNumber numberWithFloat:xOffsetC4], nil];

    CGFloat width = 0.0;
    NSString *text;
    //headers
    // vars are prefixed with h_
    for (int i = 0; i < 4; i++) {
        if (i ==0) {
            width = widthOfItemColumn;
            text = @"ITEM";
        } else if (i ==1) {
            width = widthOfStandardsColumn;
            text = @"STANDARDS";
        } else if (i ==2) {
            width = widthOfInputColumn;
            text = @"DRIVE";
        }  else if (i ==3) {
            width = widthOfInputColumn;
            text = @"WALK";
        }
        UILabel *h = [[UILabel alloc] initWithFrame:CGRectMake([[xOffsets objectAtIndex:i] floatValue], yOffsetR1, width, heightOfCell)];
        [h setText:text];
        [headers addObject:h];
    }
    
    NSMutableArray *items = [[NSMutableArray alloc] initWithObjects:@"Coffee (Air Pot)", @"Lemons", @"Strawberries", @"Iced Tea",  @"Sweet Tea", @"Chocolate Syrup", @"Capuccino", @"Shake Mix", nil];
    for (int i = 0; i < 8; i++) {
        UILabel *h = [[UILabel alloc] initWithFrame:CGRectMake(xOffsetC1, [[yOffsets objectAtIndex:i+1] floatValue], widthOfItemColumn, heightOfCell)];
        [h setText:[items objectAtIndex:i]];
        [headers addObject:h];
    }
    
    NSMutableArray *standards = [[NSMutableArray alloc] initWithObjects:@"2 Hours", @"4 Hours", @"4 Hours", @"8 Hours", @"8 Hours", @"72 Hours", @"24 Hours", @"24 Hours", nil];
    for (int i = 0; i < 8; i++) {
        UILabel *h = [[UILabel alloc] initWithFrame:CGRectMake(xOffsetC2, [[yOffsets objectAtIndex:i+1] floatValue], widthOfStandardsColumn, heightOfCell)];
        [h setText:[standards objectAtIndex:i]];
        [headers addObject:h];
    }
    
    for (UILabel *l in headers) {
        [l setFont:headerFont];
        [l setTextAlignment:NSTextAlignmentCenter];
        [drinkStationView addSubview:l];
    }
    
    
    
    
    redTimeLabelsDrinkStation = [[NSMutableArray alloc] init];
    for (int i = 0; i < 8; i ++) {
        UILabel *r = [[UILabel alloc] initWithFrame:CGRectMake(xOffsetC3+(widthOfInputColumn/2), [[yOffsets objectAtIndex:i+1]floatValue], widthOfInputColumn/2, heightOfCell)];
        
        [r setTag:i];
        [redTimeLabelsDrinkStation addObject:r];
        
        UILabel *t = [[UILabel alloc] initWithFrame:CGRectMake(xOffsetC4 +(widthOfInputColumn/2), [[yOffsets objectAtIndex:i+1] floatValue], widthOfInputColumn/2, heightOfCell)];
        [t setTag:i+20];
        [redTimeLabelsDrinkStation addObject:t];
    }
    
    //i i+20
    for (UILabel *l in redTimeLabelsDrinkStation) {
        [l setFont:[UIFont fontWithName:@"Helvetica-Light" size:16]];
        [l setTextAlignment:NSTextAlignmentCenter];
        [l setNumberOfLines:2];
        [l setLineBreakMode:NSLineBreakByWordWrapping];
        [l setText:@"red time"];
        [drinkStationView addSubview:l];
    }
    
    
    
    
    

}

- (void) loadDrinkStationLines {
    //table cell divider lines
    NSMutableArray *linesArray = [[NSMutableArray alloc] init];
    //horizontals
    
    NSNumber *y1 = [NSNumber numberWithFloat:yOffsetR1];
    NSNumber *y2 = [NSNumber numberWithFloat:yOffsetR2];
    NSNumber *y3 = [NSNumber numberWithFloat:yOffsetR3];
    NSNumber *y4 = [NSNumber numberWithFloat:yOffsetR4];
    NSNumber *y5 = [NSNumber numberWithFloat:yOffsetR5];
    NSNumber *y6 = [NSNumber numberWithFloat:yOffsetR6];
    NSNumber *y7 = [NSNumber numberWithFloat:yOffsetR7];
    NSNumber *y8 = [NSNumber numberWithFloat:yOffsetR8];
    NSNumber *y9 = [NSNumber numberWithFloat:yOffsetR9];
    NSNumber *y10 = [NSNumber numberWithFloat:yOffsetR10];
    
    NSMutableArray *yOffsets = [[NSMutableArray alloc] initWithObjects:  y1, y2, y3, y4, y5, y6, y7, y8, y9, y10, nil];
    
    
    NSMutableArray *xOffsets = [[NSMutableArray alloc] initWithObjects:[NSNumber numberWithFloat:xOffsetC1], [NSNumber numberWithFloat:xOffsetC2], [NSNumber numberWithFloat:xOffsetC3], [NSNumber numberWithFloat:xOffsetC4], nil];
    
    
    for (int i  = 0; i < 10; i++) {
        CGFloat yOff = [[yOffsets objectAtIndex:i] floatValue];
        UIImageView *h = [[UIImageView alloc] initWithFrame:CGRectMake(0, yOff, totalEffectiveWidth, 2)];
        [h setImage:[UIImage imageNamed:@"redline_h"]];
        [linesArray addObject:h];
    }
    
    //verticals
    for (int i = 0; i < 4; i++) {
        CGFloat xOff = [[xOffsets objectAtIndex:i] floatValue];
        UIImageView *v = [[UIImageView alloc] initWithFrame:CGRectMake(xOff, 0, 3, totalEffectiveHeight)];
        [v setImage:[UIImage imageNamed:@"redline_v"]];
        [linesArray addObject:v];
    }
    
    for (UIImageView *l in linesArray) {
        [drinkStationView addSubview:l];
    }
    
}

- (void) loadDrinkStationView {
    [self showTut];

    //VIEW WILL LOOK LIKE THIS:
    // ITEM | STANDARDS | DRIVE | WALK
    // ~~~~ | ~~ HOURS  | _____ | ____
    // ~~~~ | ~~ HOURS  | _____ | ____
    //
    // ~~~~ = WORDS/NUMERS, ____ = UITEXTFIELD
    // | IS A LINE PROVIDED BY DESIGNER
    // YELLOW LINES FOR DRINK STATION, RED LINES FOR TACO BAR
    
    [self loadDrinkStationConstraints];
    [drinkStationView setBackgroundColor:[Utils DT_YELLOW]];
    [drinkStationView setHidden:NO];
    
}

- (void) loadTacoBarConstraints {
    widthOfItemColumn = 0.30*totalEffectiveWidth;
    widthOfStandardsColumn = 0.20*totalEffectiveWidth;
    widthOfInputColumn = (totalEffectiveWidth - widthOfItemColumn - widthOfStandardsColumn) /2;
    heightOfCell = 28;

    xOffsetC1 = 0;
    xOffsetC2 = xOffsetC1 + widthOfItemColumn;
    xOffsetC3 = xOffsetC2 + widthOfStandardsColumn;
    xOffsetC4 = xOffsetC3 + widthOfInputColumn;
    
    yOffsetR1 = 0;
    yOffsetR2 = yOffsetR1 + heightOfCell;
    yOffsetR3 = yOffsetR2 + heightOfCell;
    yOffsetR4 = yOffsetR3 + heightOfCell;
    yOffsetR5 = yOffsetR4 + heightOfCell;
    yOffsetR6 = yOffsetR5 + heightOfCell;
    yOffsetR7 = yOffsetR6 + heightOfCell;
    yOffsetR8 = yOffsetR7 + heightOfCell;
    yOffsetR9 = yOffsetR8 + heightOfCell;
    yOffsetR10 = yOffsetR9 + heightOfCell;
    yOffsetR11 = yOffsetR10 + heightOfCell;
    yOffsetR12 = yOffsetR11 + heightOfCell;
    yOffsetR13 = yOffsetR12 + heightOfCell;
    yOffsetR14 = yOffsetR13 + heightOfCell;
    yOffsetR15 = yOffsetR14 + heightOfCell;
    yOffsetR16 = yOffsetR15 + heightOfCell;
    yOffsetR17 = yOffsetR16 + heightOfCell;
    yOffsetR18 = yOffsetR17 + heightOfCell;
    yOffsetR19 = yOffsetR18 + heightOfCell;
}

- (void) loadTacoBarLabels {
    NSMutableArray *headers = [[NSMutableArray alloc] init];
    NSMutableArray *row1 = [[NSMutableArray alloc] init];
    UIFont *headerFont = [UIFont fontWithName:@"Helvetica-Bold" size:20];
    UIFont *inputFont = [UIFont fontWithName:@"Helvetica" size:16];
    
    //headers
    // vars are prefixed with h_
    UILabel *h_ITEM = [[UILabel alloc] initWithFrame:CGRectMake(xOffsetC1, yOffsetR1, widthOfItemColumn, heightOfCell)];
    [h_ITEM setText:@"ITEM"];
    [row1 addObject:h_ITEM];
    
    UILabel *h_STANDARDS = [[UILabel alloc] initWithFrame:CGRectMake(xOffsetC2, yOffsetR1, widthOfStandardsColumn, heightOfCell)];
    [h_STANDARDS setText:@"STANDARDS"];
    [row1 addObject:h_STANDARDS];
    
    UILabel *h_SINGLE = [[UILabel alloc] initWithFrame:CGRectMake(xOffsetC3, yOffsetR1, widthOfInputColumn, heightOfCell)];
    [h_SINGLE setText:@"SINGLE"];
    [row1 addObject:h_SINGLE];
    
    UILabel *h_DUAL= [[UILabel alloc] initWithFrame:CGRectMake(xOffsetC4, yOffsetR1, widthOfInputColumn, heightOfCell)];
    [h_DUAL setText:@"DUAL/BACKUP"];
    [row1 addObject:h_DUAL];
    
    UILabel *h_TIMEIN = [[UILabel alloc] initWithFrame:CGRectMake(xOffsetC3, yOffsetR14, widthOfInputColumn, heightOfCell)];
    [h_TIMEIN setText:@"TIME IN"];
    [row1 addObject:h_TIMEIN];
    
    UILabel *h_TIMEOUT = [[UILabel alloc] initWithFrame:CGRectMake(xOffsetC4, yOffsetR14, widthOfInputColumn, heightOfCell)];
    [h_TIMEOUT setText:@"RED TIME"];
    [row1 addObject:h_TIMEOUT];
    
    
    for (UILabel *l in row1) {
        [l setFont:headerFont];
        [l setTextAlignment:NSTextAlignmentCenter];
        [tacoBarView addSubview:l];
        
    }
    
    UILabel *h_Steak= [[UILabel alloc] initWithFrame:CGRectMake(xOffsetC1, yOffsetR2, widthOfItemColumn, heightOfCell)];
    [h_Steak setText:@"Steak"];
    [headers addObject:h_Steak];
    
    UILabel *h_tacomeat = [[UILabel alloc] initWithFrame:CGRectMake(xOffsetC1, yOffsetR3, widthOfItemColumn, heightOfCell)];
    [h_tacomeat setText:@"Taco Meat"];
    [headers addObject:h_tacomeat];
    
    UILabel *h_chicken = [[UILabel alloc] initWithFrame:CGRectMake(xOffsetC1, yOffsetR4, widthOfItemColumn, heightOfCell)];
    [h_chicken setText:@"Chicken"];
    [headers addObject:h_chicken];
    
    UILabel *h_rice = [[UILabel alloc] initWithFrame:CGRectMake(xOffsetC1, yOffsetR5, widthOfItemColumn, heightOfCell)];
    [h_rice setText:@"Rice"];
    [headers addObject:h_rice];
    
    UILabel *h_redsauce = [[UILabel alloc] initWithFrame:CGRectMake(xOffsetC1, yOffsetR6, widthOfItemColumn, heightOfCell)];
    [h_redsauce setText:@"Red Sauce"];
    [headers addObject:h_redsauce] ;
    
    UILabel *h_greensauce = [[UILabel alloc] initWithFrame:CGRectMake(xOffsetC1, yOffsetR7, widthOfItemColumn, heightOfCell)];
    [h_greensauce setText:@"Green Sauce"];
    [headers addObject:h_greensauce];
    
    UILabel *h_redchilitopping = [[UILabel alloc] initWithFrame:CGRectMake(xOffsetC1, yOffsetR8, widthOfItemColumn, heightOfCell)];
    [h_redchilitopping setText:@"Red Chili Topping"];
    [headers addObject:h_redchilitopping];
    
    UILabel *h_turkey = [[UILabel alloc] initWithFrame:CGRectMake(xOffsetC1, yOffsetR9, widthOfItemColumn, heightOfCell)];
    [h_turkey setText:@"Turkey"];
    [headers addObject:h_turkey];
    
    UILabel *h_blackBeans = [[UILabel alloc] initWithFrame:CGRectMake(xOffsetC1, yOffsetR10, widthOfItemColumn, heightOfCell)];
    [h_blackBeans setText:@"Black Beans"];
    [headers addObject:h_blackBeans];
    
    UILabel *h_pintoBeans = [[UILabel alloc] initWithFrame:CGRectMake(xOffsetC1, yOffsetR11, widthOfItemColumn, heightOfCell)];
    [h_pintoBeans setText:@"Pinto Beans"];
    [headers addObject:h_pintoBeans];
    
    UILabel *h_nachoCheese = [[UILabel alloc] initWithFrame:CGRectMake(xOffsetC1, yOffsetR12, widthOfItemColumn, heightOfCell)];
    [h_nachoCheese setText:@"Nacho Cheese"];
    [headers addObject:h_nachoCheese];
    
    UILabel *h_vegblend = [[UILabel alloc] initWithFrame:CGRectMake(xOffsetC1, yOffsetR15, widthOfItemColumn, heightOfCell)];
    [h_vegblend setText:@"Veg Blend"];
    [headers addObject:h_vegblend];
    
    UILabel *h_tomatoesS = [[UILabel alloc] initWithFrame:CGRectMake(xOffsetC1, yOffsetR16, widthOfItemColumn, heightOfCell)];
    [h_tomatoesS setText:@"Tomatoes - Sliced"];
    [headers addObject:h_tomatoesS];
    
    UILabel *h_tomatoesD = [[UILabel alloc] initWithFrame:CGRectMake(xOffsetC1, yOffsetR17, widthOfItemColumn, heightOfCell)];
    [h_tomatoesD setText:@"Tomatoes - Diced"];
    [headers addObject:h_tomatoesD];
    
    UILabel *h_pico = [[UILabel alloc] initWithFrame:CGRectMake(xOffsetC1, yOffsetR18, widthOfItemColumn, heightOfCell)];
    [h_pico setText:@"Pico De Gallo Salsa"];
    [headers addObject:h_pico];
    
    
    //standards prefixed with s_
    UILabel *s_steak = [[UILabel alloc] initWithFrame:CGRectMake(xOffsetC2, yOffsetR2, widthOfStandardsColumn, heightOfCell)];
    [s_steak setText:@"1 Hour"];
    [headers addObject:s_steak];
    
    UILabel *s_tacomeat = [[UILabel alloc] initWithFrame:CGRectMake(xOffsetC2, yOffsetR3, widthOfStandardsColumn, heightOfCell)];
    [s_tacomeat setText:@"2 Hours"];
    [headers addObject:s_tacomeat];
    
    UILabel *s_chicken = [[UILabel alloc] initWithFrame:CGRectMake(xOffsetC2, yOffsetR4, widthOfStandardsColumn, heightOfCell)];
    [s_chicken setText:@"3 Hours (2 on line)"];
    [headers addObject:s_chicken];
    
    UILabel *s_rice = [[UILabel alloc] initWithFrame:CGRectMake(xOffsetC2, yOffsetR5, widthOfStandardsColumn, heightOfCell)];
    [s_rice setText:@"4 Hours"];
    [headers addObject:s_rice];
    
    UILabel *s_redsauce = [[UILabel alloc] initWithFrame:CGRectMake(xOffsetC2, yOffsetR6, widthOfStandardsColumn, heightOfCell)];
    [s_redsauce setText:@"4 Hours"];
    [headers addObject:s_redsauce] ;
    
    UILabel *s_greensauce = [[UILabel alloc] initWithFrame:CGRectMake(xOffsetC2, yOffsetR7, widthOfStandardsColumn, heightOfCell)];
    [s_greensauce setText:@"4 Hours"];
    [headers addObject:s_greensauce];
    
    UILabel *s_redchilitopping = [[UILabel alloc] initWithFrame:CGRectMake(xOffsetC2, yOffsetR8, widthOfStandardsColumn, heightOfCell)];
    [s_redchilitopping setText:@"4 Hours"];
    [headers addObject:s_redchilitopping];
    
    UILabel *s_turkey = [[UILabel alloc] initWithFrame:CGRectMake(xOffsetC2, yOffsetR9, widthOfStandardsColumn, heightOfCell)];
    [s_turkey setText:@"8 Hours (4 on line)"];
    [headers addObject:s_turkey];
    
    UILabel *s_blackbeans = [[UILabel alloc] initWithFrame:CGRectMake(xOffsetC2, yOffsetR10, widthOfStandardsColumn, heightOfCell)];
    [s_blackbeans setText:@"8 Hours"];
    [headers addObject:s_blackbeans];
    
    UILabel *s_pintobeans = [[UILabel alloc] initWithFrame:CGRectMake(xOffsetC2, yOffsetR11, widthOfStandardsColumn, heightOfCell)];
    [s_pintobeans setText:@"8 Hours"];
    [headers addObject:s_pintobeans];
    
    UILabel *s_nachocheese = [[UILabel alloc] initWithFrame:CGRectMake(xOffsetC2, yOffsetR12, widthOfStandardsColumn, heightOfCell)];
    [s_nachocheese setText:@"8 Hours"];
    [headers addObject:s_nachocheese];
    
    UILabel *s_vegblend = [[UILabel alloc] initWithFrame:CGRectMake(xOffsetC2, yOffsetR15, widthOfStandardsColumn, heightOfCell)];
    [s_vegblend setText:@"4 Hours"];
    [headers addObject:s_vegblend];
    
    UILabel *s_tomatoes_s = [[UILabel alloc] initWithFrame:CGRectMake(xOffsetC2, yOffsetR16, widthOfStandardsColumn, heightOfCell)];
    [s_tomatoes_s setText:@"4 Hours"];
    [headers addObject:s_tomatoes_s];
    
    UILabel *s_tomatoes_d = [[UILabel alloc] initWithFrame:CGRectMake(xOffsetC2, yOffsetR17, widthOfStandardsColumn, heightOfCell)];
    [s_tomatoes_d setText:@"4 Hours"];
    [headers addObject:s_tomatoes_d];
    
    UILabel *s_pico = [[UILabel alloc] initWithFrame:CGRectMake(xOffsetC2, yOffsetR18, widthOfStandardsColumn, heightOfCell)];
    [s_pico setText:@"4 Hours"];
    [headers addObject:s_pico];
    
    
    for (UILabel *l in headers) {
        [l setFont:inputFont];
        [l setTextAlignment:NSTextAlignmentCenter];
        [tacoBarView addSubview:l];
    }
    

}

- (void) loadTacoBarLines {
    //table cell divider lines
    NSMutableArray *linesArray = [[NSMutableArray alloc] init];
    //horizontals
    
    NSNumber *y1 = [NSNumber numberWithFloat:yOffsetR1];
    NSNumber *y2 = [NSNumber numberWithFloat:yOffsetR2];
    NSNumber *y3 = [NSNumber numberWithFloat:yOffsetR3];
    NSNumber *y4 = [NSNumber numberWithFloat:yOffsetR4];
    NSNumber *y5 = [NSNumber numberWithFloat:yOffsetR5];
    NSNumber *y6 = [NSNumber numberWithFloat:yOffsetR6];
    NSNumber *y7 = [NSNumber numberWithFloat:yOffsetR7];
    NSNumber *y8 = [NSNumber numberWithFloat:yOffsetR8];
    NSNumber *y9 = [NSNumber numberWithFloat:yOffsetR9];
    NSNumber *y10 = [NSNumber numberWithFloat:yOffsetR10];
    NSNumber *y11 = [NSNumber numberWithFloat:yOffsetR11];
    NSNumber *y12 = [NSNumber numberWithFloat:yOffsetR12];
    NSNumber *y13 = [NSNumber numberWithFloat:yOffsetR13];
    NSNumber *y14 = [NSNumber numberWithFloat:yOffsetR14];
    NSNumber *y15 = [NSNumber numberWithFloat:yOffsetR15];
    NSNumber *y16 = [NSNumber numberWithFloat:yOffsetR16];
    NSNumber *y17 = [NSNumber numberWithFloat:yOffsetR17];
    NSNumber *y18 = [NSNumber numberWithFloat:yOffsetR18];
    NSNumber *y19 = [NSNumber numberWithFloat:yOffsetR19];
    
    NSMutableArray *yOffsets = [[NSMutableArray alloc] initWithObjects:  y1, y2, y3, y4, y5, y6, y7, y8, y9, y10, y11, y12, y13, y14, y15, y16, y17, y18, y19, nil];
    
    
    NSMutableArray *xOffsets = [[NSMutableArray alloc] initWithObjects:[NSNumber numberWithFloat:xOffsetC1], [NSNumber numberWithFloat:xOffsetC2], [NSNumber numberWithFloat:xOffsetC3], [NSNumber numberWithFloat:xOffsetC4], nil];
    
    
    for (int i  = 0; i < 19; i++) {
        CGFloat yOff = [[yOffsets objectAtIndex:i] floatValue];
        UIImageView *h = [[UIImageView alloc] initWithFrame:CGRectMake(0, yOff, totalEffectiveWidth, 2)];
        [h setImage:[UIImage imageNamed:@"yellowline_h"]];
        [linesArray addObject:h];
    }
    
    //verticals
    for (int i = 0; i < 4; i++) {
        CGFloat xOff = [[xOffsets objectAtIndex:i] floatValue];
        UIImageView *v = [[UIImageView alloc] initWithFrame:CGRectMake(xOff, 0, 3, totalEffectiveHeight)];
        [v setImage:[UIImage imageNamed:@"yellowline_v"]];
        [linesArray addObject:v];
    }
    
    for (UIImageView *l in linesArray) {
        [tacoBarView addSubview:l];
    }

}

- (void) loadTacoBarTextFields {
    UIFont *headerFont = [UIFont fontWithName:@"Helvetica-Bold" size:18];
    UIFont *inputFont = [UIFont fontWithName:@"Helvetica" size:14];
    
    //TEXTFIELDS FOR SINGLE COLUMN
    NSMutableArray *driveFields = [[NSMutableArray alloc] init];
    NSMutableArray *redTimeLabels =  [[NSMutableArray alloc] init];
    NSNumber *y1 = [NSNumber numberWithFloat:yOffsetR1];
    NSNumber *y2 = [NSNumber numberWithFloat:yOffsetR2];
    NSNumber *y3 = [NSNumber numberWithFloat:yOffsetR3];
    NSNumber *y4 = [NSNumber numberWithFloat:yOffsetR4];
    NSNumber *y5 = [NSNumber numberWithFloat:yOffsetR5];
    NSNumber *y6 = [NSNumber numberWithFloat:yOffsetR6];
    NSNumber *y7 = [NSNumber numberWithFloat:yOffsetR7];
    NSNumber *y8 = [NSNumber numberWithFloat:yOffsetR8];
    NSNumber *y9 = [NSNumber numberWithFloat:yOffsetR9];
    NSNumber *y10 = [NSNumber numberWithFloat:yOffsetR10];
    NSNumber *y11 = [NSNumber numberWithFloat:yOffsetR11];
    NSNumber *y12 = [NSNumber numberWithFloat:yOffsetR12];
    NSNumber *y13 = [NSNumber numberWithFloat:yOffsetR13];
    NSNumber *y14 = [NSNumber numberWithFloat:yOffsetR14];
    NSNumber *y15 = [NSNumber numberWithFloat:yOffsetR15];
    NSNumber *y16 = [NSNumber numberWithFloat:yOffsetR16];
    NSNumber *y17 = [NSNumber numberWithFloat:yOffsetR17];
    NSNumber *y18 = [NSNumber numberWithFloat:yOffsetR18];
    NSNumber *y19 = [NSNumber numberWithFloat:yOffsetR19];
    
    NSMutableArray *yOffsets = [[NSMutableArray alloc] initWithObjects:  y1, y2, y3, y4, y5, y6, y7, y8, y9, y10, y11, y12, y13, y14, y15, y16, y17, y18, y19, nil];
    
    
    NSMutableArray *xOffsets = [[NSMutableArray alloc] initWithObjects:[NSNumber numberWithFloat:xOffsetC1], [NSNumber numberWithFloat:xOffsetC2], [NSNumber numberWithFloat:xOffsetC3], [NSNumber numberWithFloat:xOffsetC4], nil];
    CGFloat heightOfField = heightOfCell - 5;
    CGFloat widthOfField = widthOfInputColumn-5;
    CGFloat textFieldPadding = 2.5;
    for (int i  = 0; i < 17; i++) {
        CGFloat width = widthOfField;
        if (i < 11) width = widthOfField / 2;
        CGFloat yOff = [[yOffsets objectAtIndex:i+1] floatValue] + textFieldPadding;
        if (i == 11 || i == 12) continue;
        UITextField *h = [[UITextField alloc] initWithFrame:CGRectMake(xOffsetC3+textFieldPadding, yOff, width, heightOfField)];
        [h setTag:i];
        [driveFields addObject:h];
    }
    
    
    //create the labels
    redTimeVegBlend = [[UILabel alloc] initWithFrame:CGRectMake(xOffsetC4+textFieldPadding, [[yOffsets objectAtIndex:14] floatValue]+textFieldPadding, widthOfField, heightOfField)];
    redTimeTomatoes_S = [[UILabel alloc] initWithFrame:CGRectMake(xOffsetC4+textFieldPadding, [[yOffsets objectAtIndex:15] floatValue]+textFieldPadding, widthOfField, heightOfField)];
    redTimeTomatoes_D = [[UILabel alloc] initWithFrame:CGRectMake(xOffsetC4+textFieldPadding, [[yOffsets objectAtIndex:16] floatValue]+textFieldPadding, widthOfField, heightOfField)];
    picoDeGallo = [[UILabel alloc] initWithFrame:CGRectMake(xOffsetC4+textFieldPadding, [[yOffsets objectAtIndex:17] floatValue]+textFieldPadding, widthOfField, heightOfField)];
    
    
    [redTimeLabels addObject:redTimeVegBlend];
    [redTimeLabels addObject:redTimeTomatoes_S];
    [redTimeLabels addObject:redTimeTomatoes_D];
    [redTimeLabels addObject:picoDeGallo];
    
    //TEXTFIELDS FOR DUAL/BACKUP COLUMN
    for (int i  = 0; i < 13; i++) {
        CGFloat yOff = [[yOffsets objectAtIndex:i+1] floatValue] + textFieldPadding;
        if (i == 11 || i == 12) continue;
        UITextField *j = [[UITextField alloc] initWithFrame:CGRectMake(xOffsetC4+textFieldPadding, yOff,widthOfField/2 , heightOfField)];
        [j setTag:i+20];
        [driveFields addObject:j];
    }
    
    for (UITextField *l in driveFields) {
        [l setTextAlignment:NSTextAlignmentCenter];
        [l setKeyboardType:UIKeyboardTypeNumbersAndPunctuation];
        [l setFont:inputFont];
        [l setBorderStyle:UITextBorderStyleRoundedRect];
        [l setDelegate:self];
        [tacoBarView addSubview:l];
    }
    
    for (UILabel *l in redTimeLabels) {
        [l setTextAlignment:NSTextAlignmentCenter];
        [l setFont:inputFont];
        [l setText:@""];
        [tacoBarView addSubview:l];
    }
    
    redTimeLabelsTacoBar = [[NSMutableArray alloc] init];
    for (int i = 0; i < 11; i ++) {
        UILabel *r = [[UILabel alloc] initWithFrame:CGRectMake(xOffsetC3+(widthOfInputColumn/2), [[yOffsets objectAtIndex:i+1]floatValue], widthOfInputColumn/2, heightOfCell)];
        
        [r setTag:i];
        [redTimeLabelsTacoBar addObject:r];
        
        UILabel *t = [[UILabel alloc] initWithFrame:CGRectMake(xOffsetC4 +(widthOfInputColumn/2), [[yOffsets objectAtIndex:i+1] floatValue], widthOfInputColumn/2, heightOfCell)];
        [t setTag:i+20];
        [redTimeLabelsTacoBar addObject:t];
    }
    
    //i i+20
    for (UILabel *l in redTimeLabelsTacoBar) {
        [l setFont:[UIFont fontWithName:@"Helvetica-Light" size:14]];
        [l setTextAlignment:NSTextAlignmentCenter];
        [l setNumberOfLines:1];
        [l setText:@"red time"];
        [tacoBarView addSubview:l];
    }
    
}

- (void) loadTacoBarView {
    
    [self showTut];
    //VIEW WILL LOOK LIKE THIS:
    // ITEM | STANDARDS | SINGLE | DUAL
    // ~~~~ | ~~ HOURS  | _____  | ____
    // ~~~~ | ~~ HOURS  | _____  | ____
    //
    // ~~~~ = WORDS/NUMERS, ____ = UITEXTFIELD
    // | IS A LINE PROVIDED BY DESIGNER
    // YELLOW LINES FOR DRINK STATION, RED LINES FOR TACO BAR
    [self loadTacoBarConstraints];

    [tacoBarView setBackgroundColor:[Utils DT_RED]];
    
    [tacoBarView setHidden: NO];
}



- (BOOL) textFieldShouldReturn:(UITextField *)textField  {
    [textField resignFirstResponder];
    return YES;
}

- (void) textFieldDidBeginEditing:(UITextField *)textField {
    NSLog(@"%li started", (long)textField.tag);
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    bool wellFormed = NO;
    
    //check if string is well formed
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    [format setTimeZone:[NSTimeZone systemTimeZone]];
    [format setDateFormat:@"h:mm a"];
    NSString *dateString = textField.text;
    NSLog(@"input datestring: %@", dateString);
    NSDate *parsed = [format dateFromString:dateString];
    if (parsed) {
        NSLog(@"datestring is valid, %@", parsed);
        wellFormed =YES;
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                         message:@"Please input time in the format HH:mm AM/PM"
                                                        delegate:nil
                                               cancelButtonTitle:@"Okay"
                                               otherButtonTitles:nil, nil];
        [alert show];

    }
    //set up formatter for short style (this is how the string will be outputted)
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateStyle:NSDateFormatterShortStyle];
    [df setTimeStyle:NSDateFormatterShortStyle];

    //gregorian calendar, get the hour and minute components from the input time
    NSCalendar *greg = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [greg components: NSCalendarUnitHour | NSCalendarUnitMinute fromDate:parsed];
    
    //get the month/day/year components from the current date
    NSDateComponents *comps = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[NSDate date]];
    
    //set the components of the original date to the month/day/year components of today
    [components setYear:comps.year];
    [components setDay:comps.day];
    [components setMonth:comps.month];
    
    //create the new date.
    NSDate* newDate = [greg dateFromComponents:components];
    NSLog(@"########### %@", newDate);
    
    int hours =0 ;
    NSString *output;
    if (isTacoBar) {
        switch (textField.tag) {
                //steak - 1hour
            case 0: {
                itemname = @"Steak";
                otherOption = NO;
                hours = 1;
                break;
            }
            case 20: {
                //newDate = [parsed dateByAddingTimeInterval:secondsIn1Hours];
                itemname = @"Steak";
                otherOption = YES;
                hours = 1;
                break;
            }
                //tacomeat - 2hour
            case 1: {
                itemname = @"Taco Meat";
                otherOption = NO;
                hours = 2;
                break;
            }
            case 21: {
               // newDate = [parsed dateByAddingTimeInterval:secondsIn2Hours];
                itemname = @"Taco Meat";
                otherOption = YES;
                hours = 2;
                break;
            }
                //chicken - 3hour
            case 2: {
                itemname = @"Chicken";
                otherOption = NO;
                hours = 3;
                break;
            }
            case 22: {
                //newDate = [parsed dateByAddingTimeInterval:secondsIn3Hours];
                itemname = @"Chicken";
                otherOption = YES;
                hours = 3;
                break;
            }
                //rice, red sauce, green sauce, red chili topping,
                //4hour
                //veg blend, tomatoes sliced and diced, pico de gallo
            case 3:{
                itemname = @"Rice";
                otherOption = NO;
                hours = 4;
                break;
            }
            case 4:{
                itemname = @"Red Sauce";
                otherOption = NO;
                hours = 4;
                break;
            }
            case 5:{
                itemname = @"Green Sauce";
                otherOption = NO;
                hours = 4;
                break;
            }
            case 6:{
                itemname = @"Red Chilli Topping";
                otherOption = NO;
                hours = 4;
                break;
            }
            case 13:{
                itemname = @"Veg Blend";
                otherOption = YES;
                hours = 4;
                break;
            }
            case 14:{
                itemname = @"Tomatoes - Sliced";
                otherOption = YES;
                hours = 4;
                break;
            }
            case 15:{
                itemname = @"Tomatoes - Diced";
                otherOption = YES;
                hours = 4;
                break;
            }
            case 16:{
                itemname = @"Pico De Gallo Salsa";
                otherOption = YES;
                hours = 4;
                break;
            }
            case 23:{
                itemname = @"Rice";
                otherOption = YES;
                hours = 4;
                break;
            }
            case 24:{
                itemname = @"Red Sauce";
                otherOption = YES;
                hours = 4;
                break;
            }
            case 25:{
                itemname = @"Green Sauce";
                otherOption = YES;
                hours = 4;
                break;
            }
            case 26: {
                //newDate = [parsed dateByAddingTimeInterval:secondsIn4Hours];
                itemname = @"Red Chilli Topping";
                otherOption = YES;
                hours = 4;
                break;
            }
            //turkey
            //black beans
            //pinto beans
            //nacho cheese
            case 7: {
                itemname = @"Turkey";
                otherOption = NO;
                hours = 8;
                break;
            }
            case 8: {
                itemname = @"Black Beans";
                otherOption = NO;
                hours = 8;
                break;
            }
            case 9:{
                itemname = @"Pinto Beans";
                otherOption = NO;
                hours = 8;
                break;
            }
            case 10:{
                itemname = @"Nacho Cheese";
                otherOption = NO;
                hours = 8;
                break;
            }
            case 27:{
                itemname = @"Black Beans";
                otherOption = YES;
                hours = 8;
                break;
            }
            case 28:{
                itemname = @"Pinto Beans";
                otherOption = YES;
                hours = 8;
                break;
            }
            case 29:{
                itemname = @"Nacho Cheese";
                otherOption = YES;
                hours = 8;
                break;
            }
            case 30:{
               // newDate = [parsed dateByAddingTimeInterval:secondsIn8Hours];
                hours = 8;
                break;
            }
            default:
                break;
        }
    } else if (isDrinkStation) {
        switch (textField.tag) {
            //coffee 2 hours
            case 0:{
                itemname = @"Coffee";
                otherOption = NO;
                hours = 2;
                break;
            }
            //lemons
            //strawberries 4 hours
            case 1:{
                itemname = @"Lemons";
                otherOption = NO;
                hours = 4;
                break;
            }
            case 2:
            {
                itemname = @"Strawberries";
                otherOption = NO;
                hours = 4;
                break;
            }
            //iced tea
            //sweet tea 8 hours
            case 3:{
                itemname = @"Iced Tea";
                otherOption = NO;
                hours = 8;
                break;
            }
            case 4:{
                itemname = @"Sweet Tea";
                otherOption = NO;
                hours = 8;
                break;
            }
            //chocolate syrup 72 hours
            case 5:{
                itemname = @"Chocolate Syrup";
                otherOption = NO;
                hours = 72;
                break;
            }
            //capuccino
            //shake mix
            // 24 hours
            case 6:{
                itemname = @"Capuccino";
                otherOption = NO;
                hours = 24;
                break;
            }
            case 7:{
                itemname = @"Shake Mix";
                otherOption = NO;
                hours = 24;
                break;
            }
            default:
                break;
        }
    }
    
    NSDateComponents *add = [[NSDateComponents alloc] init];
    [add setHour:hours];
   // newDate = [greg dateByAddingUnit:NSCalendarUnitHour value:hours toDate:newDate options:0];//:add toDate:newDate options:0];
    newDate = [greg dateByAddingComponents:add toDate:newDate options:0];
    
    output = [df stringFromDate:newDate];

    newDate = [df dateFromString:[df stringFromDate:newDate]];
    [self scheduleNotificationForDate:newDate];
    
    //Save to the Core Data
    datetime = newDate;
    if(datetime != NULL){
        [self sendtoDisplay];
        [self showAlertForRedTimeInput:output];
    }
    
    
    
    NSLog(@"new date: %@", output);
    
    if (isTacoBar) {
        if (textField.tag == 13) redTimeVegBlend.text = output;
        else if (textField.tag == 14) redTimeTomatoes_S.text = output;
        else if (textField.tag == 15) redTimeTomatoes_D.text = output;
        else if (textField.tag == 16) picoDeGallo.text = output;
        for (UILabel *r in redTimeLabelsTacoBar) {
            if (r.tag == textField.tag) {
                r.text = output;
            }
        }
    } else {
        for (UILabel *r in redTimeLabelsDrinkStation) {
            if (r.tag == textField.tag) {
                r.text = output;
            }
        }
    }
    
    //TODO: OPEN UIALERTVIEW
    
}


- (void) scheduleNotificationForDate: (NSDate*) date {
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    
    localNotification.fireDate = date;
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    localNotification.alertBody = [NSString stringWithFormat:@"Red time reached. Please check on items."];
    localNotification.alertAction = NSLocalizedString(@"Okay", nil);
    
    
    localNotification.soundName = UILocalNotificationDefaultSoundName;
    localNotification.applicationIconBadgeNumber = -1;
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    
    NSLog(@"set a notification reminder for date: %@", date);


}

- (void) application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    NSLog(@"received notification");
}


//will tell user when to take out the item.
- (void) showAlertForRedTimeInput: (NSString *)time {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@""
                                                    message:[NSString stringWithFormat:@"Redtime for this item is %@", time]
                                                   delegate:nil
                                          cancelButtonTitle:@"Okay"
                                          otherButtonTitles:nil, nil];
    [alert show];
}

- (IBAction)sendReport:(id)sender {

    UIGraphicsBeginImageContext(self.window.bounds.size);
    [self.window.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
   // NSData * imgData = UIImagePNGRepresentation(image);
    NSData *imgData = UIImageJPEGRepresentation(image, 1);
    

    if(imgData)
        [imgData writeToFile:@"screenshot.png" atomically:YES];
    else
        NSLog(@"error while taking screenshot");
    
    NSString *emailTitle = [NSString stringWithFormat:@"Report - Red Times - "];
    NSString *messageBody = [NSString stringWithFormat:@"Report generated on: %@", [NSDate date]];
    NSArray *toRecipients = [NSArray arrayWithObject:@"raks.garg@gmail.com"];
    NSString *fileName;
    
    if (isDrinkStation) {
        emailTitle = [emailTitle stringByAppendingString:@"Drink Station"];
        fileName = @"drinkStation.png";
    } else if (isTacoBar) {
        emailTitle = [emailTitle stringByAppendingString:@"Taco Bar"];
        fileName = @"tacoBar.png";
    }
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:NO];
    [mc setToRecipients:toRecipients];
    
    NSString *mimeType = @"image/jpg";
    
    // Add attachment
    [mc addAttachmentData:imgData mimeType:mimeType fileName:@"screenshot.png"];
    
    // Present mail view controller on screen
    [self presentViewController:mc animated:YES completion:NULL];
    
}

- (IBAction)refreshAction:(id)sender {
    
    if (isDrinkStation) {
        for (int i = 0; i < [redTimeLabelsDrinkStation count]; i++) {
            UILabel *l = [redTimeLabelsDrinkStation objectAtIndex:i];
            if (l) [l setText:@"red time"];
        }
        for (int i = 0; i < [drinkStationFields count]; i++ ) {
            UITextField *t = [redTimeLabelsDrinkStation objectAtIndex:i];
            if (t) [t setText:@""];
        }
    }
    
    
    
    
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
    
}

-(void)viewWillDisappear:(BOOL)animated {
 //   [delegate sendDataToDisplayScreen:]
//    [Utils createRedTimeRecord:itemname
//                  setDateTime:datetime
//                   checkOther:otherOption];
    
//    if(_record != NULL)
//    {
//        [self passDataForward];
//    }
    
}
-(void)sendtoDisplay
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@""
                                                    message:[NSString stringWithFormat:@"Send to Display"]
                                                   delegate:nil
                                          cancelButtonTitle:@"Send"
                                          otherButtonTitles:nil, nil];
    [alert setTag:2];
    [alert show];
}
-(void )alertView:(UIAlertView *) alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if([alertView tag] == 2)
    {
        if(buttonIndex == 0)
        {
            [self passDataBackward];
        }
    }
}
-(void)passDataBackward
{
    if([_redTimeDelegate respondsToSelector:@selector(dataFromRedTimeController:)])
    {
        [_redTimeDelegate dataRedTimeFromController:_record];
    }
   // displayScreenViewController * display = [[displayScreenViewController alloc ]init];
    

  //  [self.navigationController pushViewController:display animated:YES];
}

@end
