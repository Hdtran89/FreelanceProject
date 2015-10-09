//
//  StatisticsViewController.m
//  Del Taco
//
//  Created by iOSDev on 8/28/15.
//  Copyright (c) 2015 United Tax. All rights reserved.
//

#import "StatisticsViewController.h"

@interface StatisticsViewController () {
    UIView *serviceView;
    UIView *salesView;
    UIView *speedView;
    
    BOOL isSpeed;
    BOOL isService;
    BOOL isSales;
    UIView *tut;
    CGRect viewFrame;

    
    CGFloat xMargin;
    CGFloat yMarginTop;
    CGFloat yMarginBottom;
    CGFloat totalEffectiveWidth;
    CGFloat totalEffectiveHeight;
    CGPoint speedCenter;
    CGPoint serviceCenter;
    CGPoint salesCenter;
    
    CGFloat widthOfColumn1;
    CGFloat widthOfDayColumn;
    CGFloat widthOfMicColumn;
    CGFloat heightOfCell;
    
    CGFloat xOffsetC1;
    CGFloat xOffsetC2;
    CGFloat xOffsetC3;
    CGFloat xOffsetC4;
    CGFloat xOffsetC5;
    CGFloat xOffsetC6;
    CGFloat xOffsetC7;
    CGFloat xOffsetC8;
    CGFloat xOffsetC9;
    CGFloat xOffsetC10;
    CGFloat xOffsetC11;
    CGFloat xOffsetC12;
    CGFloat xOffsetC13;
    CGFloat xOffsetC14;
    CGFloat xOffsetC15;
    CGFloat xOffsetC16;
    CGFloat xOffsetC17;
    CGFloat xOffsetC18;
    CGFloat xOffsetC19;
    CGFloat xOffsetC20;


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
    CGFloat yOffsetR20;
    CGFloat yOffsetR21;
    CGFloat yOffsetR22;
    CGFloat yOffsetR23;
    CGFloat yOffsetR24;
    CGFloat yOffsetR25;
    NSMutableArray *yOffsets;
    NSMutableArray *xOffsets;
    
    
    //speed segment stuff
    NSMutableArray *goalFields;
    NSMutableArray *actualFields;
    
    int actual;
    int goal;
  //  UILabel *winOrLoseLabel;
    NSMutableArray *winLoseLabelsSpeed;
    NSMutableArray *winLoseLabelsSales;

    //service segment stuff
    NSMutableArray *serviceFields;
    
    
    
    //sales segment stuff
    NSMutableArray *actualSalesFields;
    NSMutableArray *lastYearSalesFields;
    float actualSales;
    float lastYearSales;
    
    NSNumber * weeklygoal;
    NSNumber * weeklyactual;
    NSNumber * dailygoal;
    NSNumber * dailyactual;
    NSString * day;
    NSNumber * dailylastyearsale;
    NSNumber * weeklylastyearsale;
    NSNumber * dailyactualsale;
    NSNumber * weeklyactualsale;
    bool lunch;
    bool counter;
    
}
@property(nonatomic, retain)Speed * speed;
@property(nonatomic, retain)Sales * sale;
@end

@implementation StatisticsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDefaultSegmentView];
    UITapGestureRecognizer *tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapMethod)];
    tapped.delegate=self;
    tapped.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:tapped];
    // Do any additional setup after loading the view.
    [self loadDefaultSegmentView];
    [self initializeAllScreens];
    [self showTut];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    
    self.window = [[UIWindow alloc] initWithFrame: [UIScreen mainScreen].bounds];
    
}


- (void)keyboardDidShow:(NSNotification *)note {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.2];
    //     drinkAndTacoFrame = CGRectMake(xMargin, yMarginTop, totalEffectiveWidth, totalEffectiveHeight)
    int moveUp = 110;
    if (isService) moveUp = 100;
    speedView.center = CGPointMake(speedCenter.x, speedCenter.y-moveUp);
    serviceView.center = CGPointMake(serviceCenter.x, serviceCenter.y-moveUp);
    salesView.center = CGPointMake(salesCenter.x, serviceCenter.y-moveUp);
    [UIView commitAnimations];
    /* keyboard is visible, move views */
}


- (void)keyboardDidHide:(NSNotification *)note {
    /* resign first responder, hide keyboard, move views */
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.2];
    //     drinkAndTacoFrame = CGRectMake(xMargin, yMarginTop, totalEffectiveWidth, totalEffectiveHeight)
    speedView.center = CGPointMake(speedCenter.x, speedCenter.y);
    serviceView.center = CGPointMake(serviceCenter.x, serviceCenter.y);
    salesView.center = CGPointMake(salesCenter.x, serviceCenter.y);
    [UIView commitAnimations];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) initializeAllScreens {
    xMargin = .02 * [Utils getScreenWidth];
    yMarginTop = 130;
    yMarginBottom = 50;
    totalEffectiveWidth = [Utils getScreenWidth] -  2*xMargin;
    totalEffectiveHeight = [Utils getScreenHeight] - yMarginBottom - yMarginTop-50;
    
    viewFrame = CGRectMake(xMargin, yMarginTop, totalEffectiveWidth, totalEffectiveHeight);
    
    speedView = [[UIView alloc] initWithFrame:viewFrame];
    speedView.hidden = NO;
    serviceView = [[UIView alloc] initWithFrame:viewFrame];
    serviceView.hidden =YES;
    salesView = [[UIView alloc] initWithFrame:viewFrame];
    salesView.hidden =YES;
    
    speedCenter = speedView.center;
    serviceCenter = serviceView.center;
    salesCenter = salesView.center;
    
    [self.view addSubview:speedView];
    [self.view addSubview:serviceView];
    [self.view addSubview:salesView];

    speedCenter = speedView.center;
    serviceCenter = serviceView.center;
    salesCenter = salesView.center;
    
    isService = NO;
    isSales = NO;
    isSpeed = YES;
    
    [self loadSpeedConstraints];
    [self loadSpeedLines];
    [self loadSpeedLabels];
    [self loadSpeedFields];
    
    [self loadServiceConstraints];
    [self loadServiceLines];
    [self loadServiceLabels];
    [self loadServiceFields];
    
    [self loadSalesConstraints];
    [self loadSalesLines];

    [self loadSalesLabels];
    [self loadSalesFields];
    
    [self loadSpeedView];

}

- (void) loadConstraintArrays  {
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
    NSNumber *y20 = [NSNumber numberWithFloat:yOffsetR20];
    NSNumber *y21 = [NSNumber numberWithFloat:yOffsetR21];
    NSNumber *y22 = [NSNumber numberWithFloat:yOffsetR22];
    NSNumber *y23 = [NSNumber numberWithFloat:yOffsetR23];
    NSNumber *y24 = [NSNumber numberWithFloat:yOffsetR24];
    NSNumber *y25 = [NSNumber numberWithFloat:yOffsetR25];

    
    yOffsets = [[NSMutableArray alloc] initWithObjects:  y1, y2, y3, y4, y5, y6, y7, y8, y9, y10, y11, y12, y13, y14, y15, y16, y17, y18, y19, y20, y21, y22, y23, y24, y25, nil];
    
    NSNumber *x1 = [NSNumber numberWithFloat:xOffsetC1];
    NSNumber *x2 = [NSNumber numberWithFloat:xOffsetC2];
    NSNumber *x3 = [NSNumber numberWithFloat:xOffsetC3];
    NSNumber *x4 = [NSNumber numberWithFloat:xOffsetC4];
    NSNumber *x5 = [NSNumber numberWithFloat:xOffsetC5];
    NSNumber *x6 = [NSNumber numberWithFloat:xOffsetC6];
    NSNumber *x7 = [NSNumber numberWithFloat:xOffsetC7];
    NSNumber *x8 = [NSNumber numberWithFloat:xOffsetC8];
    NSNumber *x9 = [NSNumber numberWithFloat:xOffsetC9];
    NSNumber *x10 = [NSNumber numberWithFloat:xOffsetC10];
    NSNumber *x11 = [NSNumber numberWithFloat:xOffsetC11];
    NSNumber *x12 = [NSNumber numberWithFloat:xOffsetC12];
    NSNumber *x13 = [NSNumber numberWithFloat:xOffsetC13];
    NSNumber *x14 = [NSNumber numberWithFloat:xOffsetC14];
    NSNumber *x15 = [NSNumber numberWithFloat:xOffsetC15];
    NSNumber *x16 = [NSNumber numberWithFloat:xOffsetC16];
    NSNumber *x17 = [NSNumber numberWithFloat:xOffsetC17];
    NSNumber *x18 = [NSNumber numberWithFloat:xOffsetC18];
    NSNumber *x19 = [NSNumber numberWithFloat:xOffsetC19];
    NSNumber *x20 = [NSNumber numberWithFloat:xOffsetC20];

    xOffsets = [[NSMutableArray alloc] initWithObjects:  x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15, x16, x17, x18, x19, x20, nil];
    
}

// speed screen methods
- (void) loadSpeedConstraints {
    totalEffectiveWidth = [Utils getScreenWidth] -  2*xMargin;

    widthOfDayColumn = (totalEffectiveWidth)/9;
    widthOfColumn1 = widthOfDayColumn;
    heightOfCell = 30;
    
    xOffsetC1 = 0;
    xOffsetC2 = xOffsetC1 + widthOfColumn1;
    xOffsetC3 = xOffsetC2 + widthOfDayColumn;
    xOffsetC4 = xOffsetC3 + widthOfDayColumn;
    xOffsetC5 = xOffsetC4 + widthOfDayColumn;
    xOffsetC6 = xOffsetC5 + widthOfDayColumn;
    xOffsetC7 = xOffsetC6 + widthOfDayColumn;
    xOffsetC8 = xOffsetC7 + widthOfDayColumn;
    xOffsetC9 = xOffsetC8 + widthOfDayColumn;
    xOffsetC10 = xOffsetC9 + widthOfDayColumn;
    xOffsetC11 = xOffsetC10 + widthOfDayColumn;
    xOffsetC12 = xOffsetC11 + widthOfDayColumn;


    
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
    
    [self loadConstraintArrays];
}

- (void) loadSpeedLabels {
    [self loadSpeedConstraints];
    UIFont *headerFont = [UIFont fontWithName:@"Helvetica-Bold" size:18];
    UIFont *inputFont = [UIFont fontWithName:@"Helvetica" size:10];

    //row 1 headers
    NSMutableArray *row1Headers = [[NSMutableArray alloc] initWithObjects:@"Wednesday", @"Thursday", @"Friday", @"Saturday", @"Sunday", @"Monday", @"Tuesday", @"Week", nil];
    
    NSMutableArray *col1SpecialHeaders = [[NSMutableArray alloc] initWithObjects:@"Lunch Drive-Thru Speed", @"Lunch Counter Speed", @"Dinner Drive-Thru Speed", @"Dinner Counter-Speed", nil];
    for (int i = 0; i < [row1Headers count]; i++) {
        CGFloat xOff = [[xOffsets objectAtIndex:i+1] floatValue];
        UILabel *l = [[UILabel alloc] initWithFrame:CGRectMake(xOff, yOffsetR1, widthOfDayColumn, heightOfCell)];
        [l setText:[row1Headers objectAtIndex:i]];
        [l setFont:headerFont];
        [l setTextAlignment:NSTextAlignmentCenter];
        [speedView addSubview:l];
    }

    //column 1 headers
    int c = 0;
    for (int i = 1; i <= 16; i++) {
        CGFloat yOff = [[yOffsets objectAtIndex:i] floatValue];
        UILabel *l;
        CGRect specialHeaderFrame = CGRectMake(xOffsetC1+3, yOff, totalEffectiveWidth, heightOfCell);
        CGRect headerFrame = CGRectMake(xOffsetC1+3, yOff, widthOfColumn1, heightOfCell);
        l = [[UILabel alloc] initWithFrame:headerFrame];
        if (i == 1 || i == 5 || i == 9 || i == 13) {
            [l setFrame:specialHeaderFrame];
            [l setText:[col1SpecialHeaders objectAtIndex:c]];
            c++;
            if(i == 1 || i == 9){
                [l setBackgroundColor:[Utils DT_YELLOW]];
            }
            if(i == 5 || i == 13){
                [l setBackgroundColor:[Utils DT_YELLOW_LIGHT]];
            }
            

        }
        if (i == 2 || i == 6 || i == 10 | i == 14) {
            [l setText:@"Goal"];
        }
        if (i == 3 || i == 7 || i == 11 | i == 15) {
            [l setText:@"Actual"];
        }
        if (i == 4 || i == 8 || i == 12 | i == 16) {
            [l setText:@"Win/Lose"];
        }

        [l setFont:headerFont];
        [l setTextAlignment:NSTextAlignmentLeft];
        [speedView addSubview:l];
    }
    
    //initialize and set properties of the win or lose label.
    //text is set upon TextFieldDidEndEditing
    winLoseLabelsSpeed = [[NSMutableArray alloc] init];
    
    

    for (int i = 0; i < 8; i ++)  {
        CGFloat xOff = [[xOffsets objectAtIndex:i+1] floatValue];
        UILabel *h = [[UILabel alloc] initWithFrame:CGRectMake(xOff, yOffsetR5, widthOfDayColumn,heightOfCell)];
        [h setTag:i];
        [winLoseLabelsSpeed addObject:h];

    }
    for (int i = 0; i < 8; i ++)  {
        CGFloat xOff = [[xOffsets objectAtIndex:i+1] floatValue];
        UILabel *j = [[UILabel alloc] initWithFrame:CGRectMake(xOff, yOffsetR9, widthOfDayColumn, heightOfCell)];
        [j setTag:i+10];
        [winLoseLabelsSpeed addObject:j];
    }
    for (int i = 0; i < 8; i ++)  {
        CGFloat xOff = [[xOffsets objectAtIndex:i+1] floatValue];
        UILabel *k = [[UILabel alloc] initWithFrame:CGRectMake(xOff, yOffsetR13, widthOfDayColumn, heightOfCell)];
        [k setTag:i+20];
        [winLoseLabelsSpeed addObject:k];
    }
    for (int i = 0; i < 8; i ++)  {
        CGFloat xOff = [[xOffsets objectAtIndex:i+1] floatValue];
        UILabel *l = [[UILabel alloc] initWithFrame:CGRectMake(xOff, yOffsetR17, widthOfDayColumn, heightOfCell)];
        [l setTag:i+30];
        [winLoseLabelsSpeed addObject:l];
    }
    
    
    for (UILabel *l in winLoseLabelsSpeed) {
        [speedView addSubview:l];
        [l setTextAlignment:NSTextAlignmentCenter];
        [l setFont:headerFont];
        [l setText:@"?"];
    }
    
}

- (void) loadSpeedLines {
    //table cell divider lines
    NSMutableArray *linesArray = [[NSMutableArray alloc] init];
    //horizontals
    for (int i  = 0; i < 18; i++) {
        CGFloat yOff = [[yOffsets objectAtIndex:i] floatValue];
        UIImageView *h = [[UIImageView alloc] initWithFrame:CGRectMake(0, yOff, totalEffectiveWidth, 2)];
        [h setImage:[UIImage imageNamed:@"redline_h"]];
        [linesArray addObject:h];
    }
    
    //verticals
    for (int i = 0; i < 10; i++) {
        CGFloat xOff = [[xOffsets objectAtIndex:i] floatValue];
        UIImageView *v = [[UIImageView alloc] initWithFrame:CGRectMake(xOff, 0, 3, totalEffectiveHeight)];
        [v setImage:[UIImage imageNamed:@"redline_v"]];
        [linesArray addObject:v];
    }
    
    for (UIImageView *l in linesArray) {
        [speedView addSubview:l];
    }
}

- (void) loadSpeedFields {
    
    goalFields = [[NSMutableArray alloc] init];
    actualFields = [[NSMutableArray alloc] init];
    UIFont *inputFont = [UIFont fontWithName:@"Helvetica" size:14];

    CGFloat heightOfField = heightOfCell - 2.5;
    CGFloat widthOfField = widthOfDayColumn- 2.5;
    CGFloat textFieldPadding = 1.25;
    
    //goal fields
    for (int i  = 0; i < 8; i++) {
        CGFloat xOff = [[xOffsets objectAtIndex:i+1] floatValue] + textFieldPadding;
        UITextField *h = [[UITextField alloc] initWithFrame:CGRectMake(xOff, yOffsetR3+textFieldPadding, widthOfField, heightOfField)];
        UITextField *j = [[UITextField alloc] initWithFrame:CGRectMake(xOff, yOffsetR7+textFieldPadding, widthOfField, heightOfField)];
        UITextField *k = [[UITextField alloc] initWithFrame:CGRectMake(xOff, yOffsetR11+textFieldPadding, widthOfField, heightOfField)];
        UITextField *l = [[UITextField alloc] initWithFrame:CGRectMake(xOff, yOffsetR15+textFieldPadding, widthOfField, heightOfField)];
        [h setTag:i];
        [j setTag:i+10];
        [k setTag:i+20];
        [l setTag:i+30];
        [goalFields addObject:h];
        [goalFields addObject:j];
        [goalFields addObject:k];
        [goalFields addObject:l];
    }
    
    //actual fields
    for (int i  = 0; i < 8; i++) {
        CGFloat xOff = [[xOffsets objectAtIndex:i+1] floatValue] + textFieldPadding;
        UITextField *h = [[UITextField alloc] initWithFrame:CGRectMake(xOff, yOffsetR4+textFieldPadding, widthOfField, heightOfField)];
        UITextField *j = [[UITextField alloc] initWithFrame:CGRectMake(xOff, yOffsetR8+textFieldPadding, widthOfField, heightOfField)];
        UITextField *k = [[UITextField alloc] initWithFrame:CGRectMake(xOff, yOffsetR12+textFieldPadding, widthOfField, heightOfField)];
        UITextField *l = [[UITextField alloc] initWithFrame:CGRectMake(xOff, yOffsetR16+textFieldPadding, widthOfField, heightOfField)];
        [h setTag:i+40];
        [j setTag:i+50];
        [k setTag:i+60];
        [l setTag:i+70];
        [goalFields addObject:h];
        [goalFields addObject:j];
        [goalFields addObject:k];
        [goalFields addObject:l];
    }
    
    for (UITextField *l in goalFields) {
        [l setTextAlignment:NSTextAlignmentCenter];
        [l setKeyboardType:UIKeyboardTypeNumbersAndPunctuation];
        [l setFont:inputFont];
        [l setBorderStyle:UITextBorderStyleRoundedRect];
        [l setDelegate:self];
        [speedView addSubview:l];
    }
    
    for (UITextField *l in actualFields) {
        [l setTextAlignment:NSTextAlignmentCenter];
        [l setKeyboardType:UIKeyboardTypeNumbersAndPunctuation];
        [l setFont:inputFont];
        [l setBorderStyle:UITextBorderStyleRoundedRect];
        [l setDelegate:self];
        [l setPlaceholder:@"0"];
        [speedView addSubview:l];
    }
}

- (void) loadSpeedView {
    [speedView setBackgroundColor:[Utils DT_GREEN]];
    [speedView setHidden:NO];
}

//service screen methods
- (void) loadServiceConstraints {

    totalEffectiveWidth = [Utils getScreenWidth] -  2*xMargin;
    widthOfMicColumn = 25;
    widthOfDayColumn = (totalEffectiveWidth-7.0*widthOfMicColumn)/9.0;
    widthOfColumn1 = widthOfDayColumn;
    //divide by an arbitary integer (this is the number of rows that would theortically fill screen)
    heightOfCell = (totalEffectiveHeight)/25.0;
    
    xOffsetC1 = 0;
    xOffsetC2 = xOffsetC1 + widthOfColumn1;
    xOffsetC3 = xOffsetC2 + widthOfDayColumn;
    xOffsetC4 = xOffsetC3 + widthOfMicColumn;
    xOffsetC5 = xOffsetC4 + widthOfDayColumn;
    xOffsetC6 = xOffsetC5 + widthOfMicColumn;
    xOffsetC7 = xOffsetC6 + widthOfDayColumn;
    xOffsetC8 = xOffsetC7 + widthOfMicColumn;
    xOffsetC9 = xOffsetC8 + widthOfDayColumn;
    xOffsetC10 = xOffsetC9 + widthOfMicColumn;
    xOffsetC11 = xOffsetC10 + widthOfDayColumn;
    xOffsetC12 = xOffsetC11 + widthOfMicColumn;
    xOffsetC13 = xOffsetC12 + widthOfDayColumn;
    xOffsetC14 = xOffsetC13 + widthOfMicColumn;
    xOffsetC15 = xOffsetC14 + widthOfDayColumn;
    xOffsetC16 = xOffsetC15 + widthOfMicColumn;
    xOffsetC17 = xOffsetC16 + widthOfDayColumn;
    
    
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
    yOffsetR20 = yOffsetR19 + heightOfCell;
    yOffsetR21 = yOffsetR20 + heightOfCell;
    yOffsetR22 = yOffsetR21 + heightOfCell;
    yOffsetR23 = yOffsetR22 + heightOfCell;
    yOffsetR24 = yOffsetR23 + heightOfCell;
    yOffsetR25 = yOffsetR24 + heightOfCell;

    [self loadConstraintArrays];
}

- (void) loadServiceLabels {
    [self loadServiceConstraints];
    UIFont *headerFont = [UIFont fontWithName:@"Helvetica-Bold" size:14];
    UIFont *inputFont = [UIFont fontWithName:@"Helvetica" size:10];
    
    //have to introduce widthoflabel var so because mic labels are not as wide as day labels
    int widthOfLabel = 0;
    //row 1 headers
    NSMutableArray *row1Headers = [[NSMutableArray alloc] initWithObjects:@"Period:", @"Wednesday", @"Mic", @"Thursday", @"Mic", @"Friday", @"Mic", @"Saturday", @"Mic", @"Sunday", @"Mic", @"Monday", @"Mic", @"Tuesday", @"Mic", @"Week", nil];
    
    NSMutableArray *col1SpecialHeaders = [[NSMutableArray alloc] initWithObjects:@"Week 1", @"Week 2", @"Week 3", @"Week 4", nil];
    for (int i = 0; i < [row1Headers count]; i++) {
        CGFloat xOff = [[xOffsets objectAtIndex:i] floatValue];
        if (i > 0 && i % 2 == 0) widthOfLabel = widthOfMicColumn;
        else widthOfLabel = widthOfDayColumn;
        UILabel *l = [[UILabel alloc] initWithFrame:CGRectMake(xOff, yOffsetR1, widthOfLabel, heightOfCell)];
        [l setText:[row1Headers objectAtIndex:i]];
        [l setFont:headerFont];
        [l setTextAlignment:NSTextAlignmentCenter];
        [serviceView addSubview:l];
    }
    
    //column 1 headers
    int c = 0;
    for (int i = 1; i <= 24; i++) {
        CGFloat yOff = [[yOffsets objectAtIndex:i] floatValue];
        UILabel *l;
        CGRect specialHeaderFrame = CGRectMake(xOffsetC1+3, yOff, totalEffectiveWidth, heightOfCell);
        CGRect headerFrame = CGRectMake(xOffsetC1+3, yOff, widthOfColumn1, heightOfCell);
        l = [[UILabel alloc] initWithFrame:headerFrame];
        if (i == 1 || i == 7 || i == 13 || i == 19) {
            [l setFrame:specialHeaderFrame];
            [l setText:[col1SpecialHeaders objectAtIndex:c]];
            c++;
            if( i== 1){
                [l setBackgroundColor:[Utils DT_GREEN_LIGHT]];
            }
            if(i == 7){
                [l setBackgroundColor:[Utils DT_GREEN_MEDIUM]];
            }
            if (i == 13) {
                [l setBackgroundColor:[Utils DT_GREEN]];
            }
            if (i == 19) {
                [l setBackgroundColor:[Utils DT_GREEN_DARK]];
            }
            
        }
        if (i == 2 || i == 8 || i == 14 | i == 20) {
            [l setText:@"Lunch"];
        }
        if (i == 3 || i == 9 || i == 15 | i == 21) {
            [l setText:@"Day"];
        }
        if (i == 4 || i == 10 || i == 16 | i == 22) {
            [l setText:@"Dinner"];
        }
        if (i == 5 || i == 11|| i == 17 | i == 23) {
            [l setText:@"Graveyard"];
        }
        if (i == 6 || i == 12 || i == 18 | i == 24) {
            [l setText:@"Total Day"];
        }
        
        [l setFont:headerFont];
        [l setTextAlignment:NSTextAlignmentLeft];
        [serviceView addSubview:l];
    }
    
}

- (void) loadServiceLines {
    //table cell divider lines
    NSMutableArray *linesArray = [[NSMutableArray alloc] init];
    //horizontals
    for (int i  = 0; i < 25; i++) {
        CGFloat yOff = [[yOffsets objectAtIndex:i] floatValue];
        UIImageView *h = [[UIImageView alloc] initWithFrame:CGRectMake(0, yOff, totalEffectiveWidth, 2)];
        [h setImage:[UIImage imageNamed:@"redline_h"]];
        [linesArray addObject:h];
    }
    
    //verticals
    for (int i = 0; i < 17; i++) {
        CGFloat xOff = [[xOffsets objectAtIndex:i] floatValue];
        UIImageView *v = [[UIImageView alloc] initWithFrame:CGRectMake(xOff, 0, 3, totalEffectiveHeight)];
        [v setImage:[UIImage imageNamed:@"redline_v"]];
        [linesArray addObject:v];
    }
    
    for (UIImageView *l in linesArray) {
        [serviceView addSubview:l];
    }
}

- (void) loadServiceFields {
    UIFont *inputFont = [UIFont fontWithName:@"Helvetica" size:14];
    serviceFields = [[NSMutableArray alloc] init];
    CGFloat heightOfField = heightOfCell - 2.5;
    CGFloat widthOfField = widthOfDayColumn- 2.5;
    CGFloat textFieldPadding = 1.25;
    
    //fields
    for (int i  = 0; i < 15; i++) {
        CGFloat widthField = 0;
        if (i > 0 && i % 2 != 0) widthField = widthOfMicColumn;
        else widthField = widthOfDayColumn;

        CGFloat xOff = [[xOffsets objectAtIndex:i+1] floatValue] + textFieldPadding;
        //week1
        for (int j = 2; j < 7; j++) {
            CGFloat yOff  = [[yOffsets objectAtIndex:j] floatValue] + textFieldPadding;
            UITextField *h = [[UITextField alloc] initWithFrame:CGRectMake(xOff, yOff, widthField, heightOfField)];
            [h setTag:i];
            [serviceFields addObject:h];
        }
        //week2
        for (int j = 8; j < 13; j++) {
            CGFloat yOff  = [[yOffsets objectAtIndex:j] floatValue] + textFieldPadding;
            UITextField *h = [[UITextField alloc] initWithFrame:CGRectMake(xOff, yOff, widthField, heightOfField)];
            [h setTag:i];
            [serviceFields addObject:h];
        }
        //week3
        for (int j = 14; j < 19; j++) {
            CGFloat yOff  = [[yOffsets objectAtIndex:j] floatValue] + textFieldPadding;
            UITextField *h = [[UITextField alloc] initWithFrame:CGRectMake(xOff, yOff, widthField, heightOfField)];
            [h setTag:i];
            [serviceFields addObject:h];
        }
        //week4
        for (int j = 20; j < 25; j++) {
            CGFloat yOff  = [[yOffsets objectAtIndex:j] floatValue] + textFieldPadding;
            UITextField *h = [[UITextField alloc] initWithFrame:CGRectMake(xOff, yOff, widthField, heightOfField)];
            [h setTag:i];
            [serviceFields addObject:h];
        }
        
        //week1
//        UITextField *h = [[UITextField alloc] initWithFrame:CGRectMake(xOff, yOffsetR3+textFieldPadding, widthField, heightOfField)];
//        UITextField *j = [[UITextField alloc] initWithFrame:CGRectMake(xOff, yOffsetR4+textFieldPadding, widthField, heightOfField)];
//        UITextField *k = [[UITextField alloc] initWithFrame:CGRectMake(xOff, yOffsetR5+textFieldPadding, widthField, heightOfField)];
//        UITextField *l = [[UITextField alloc] initWithFrame:CGRectMake(xOff, yOffsetR6+textFieldPadding, widthField, heightOfField)];
//
//        //week2
//        UITextField *m = [[UITextField alloc] initWithFrame:CGRectMake(xOff, yOffsetR9+textFieldPadding, widthField, heightOfField)];
//        UITextField *n = [[UITextField alloc] initWithFrame:CGRectMake(xOff, yOffsetR10+textFieldPadding, widthField, heightOfField)];
//        UITextField *o = [[UITextField alloc] initWithFrame:CGRectMake(xOff, yOffsetR11+textFieldPadding, widthField, heightOfField)];
//        UITextField *p = [[UITextField alloc] initWithFrame:CGRectMake(xOff, yOffsetR12+textFieldPadding, widthField, heightOfField)];
//        
//        //week3
//        UITextField *q = [[UITextField alloc] initWithFrame:CGRectMake(xOff, yOffsetR15+textFieldPadding, widthField, heightOfField)];
//        UITextField *r = [[UITextField alloc] initWithFrame:CGRectMake(xOff, yOffsetR16+textFieldPadding, widthField, heightOfField)];
//        UITextField *s = [[UITextField alloc] initWithFrame:CGRectMake(xOff, yOffsetR17+textFieldPadding, widthField, heightOfField)];
//        UITextField *t = [[UITextField alloc] initWithFrame:CGRectMake(xOff, yOffsetR18+textFieldPadding, widthField, heightOfField)];
//        
//        //week4
//        UITextField *u = [[UITextField alloc] initWithFrame:CGRectMake(xOff, yOffsetR21+textFieldPadding, widthField, heightOfField)];
//        UITextField *v = [[UITextField alloc] initWithFrame:CGRectMake(xOff, yOffsetR22+textFieldPadding, widthField, heightOfField)];
//        UITextField *w = [[UITextField alloc] initWithFrame:CGRectMake(xOff, yOffsetR23+textFieldPadding, widthField, heightOfField)];
//        UITextField *x = [[UITextField alloc] initWithFrame:CGRectMake(xOff, yOffsetR24+textFieldPadding, widthField, heightOfField)];
//        
//        
////        [h setTag:i];
////        [j setTag:i+10];
////        [k setTag:i+20];
////        [l setTag:i+30];
//        [m setTag:i+40];
//        [n setTag:i+50];
//        [o setTag:i+60];
//        [p setTag:i+70];
//        [q setTag:i+80];
//        [r setTag:i+90];
//        [s setTag:i+100];
//        [t setTag:i+110];
//        [u setTag:i+120];
//        [v setTag:i+130];
//        [w setTag:i+140];
//        [x setTag:i+150];
////        [serviceFields addObject:h];
////        [serviceFields addObject:j];
////        [serviceFields addObject:k];
////        [serviceFields addObject:l];
//        
//        [serviceFields addObject:m];
//        [serviceFields addObject:n];
//        [serviceFields addObject:o];
//        [serviceFields addObject:p];
//        
//        [serviceFields addObject:q];
//        [serviceFields addObject:r];
//        [serviceFields addObject:s];
//        [serviceFields addObject:t];
//        
//        [serviceFields addObject:u];
//        [serviceFields addObject:v];
//        [serviceFields addObject:w];
//        [serviceFields addObject:x];
        
    
    }
    
    //actual fields

    
    for (UITextField *l in serviceFields) {
        [l setTextAlignment:NSTextAlignmentCenter];
        [l setKeyboardType:UIKeyboardTypeNumbersAndPunctuation];
        [l setFont:inputFont];
        [l setBorderStyle:UITextBorderStyleRoundedRect];
        [l setDelegate:self];
        [serviceView addSubview:l];
    }

}

- (void) loadServiceView {
    [serviceView setBackgroundColor:[Utils DT_YELLOW]];
    [serviceView setHidden:NO];
}


//sales screen methods
- (void) loadSalesConstraints {
    totalEffectiveWidth = [Utils getScreenWidth] -  2*xMargin;
    
    widthOfDayColumn = (totalEffectiveWidth)/9;
    widthOfColumn1 = widthOfDayColumn;
    heightOfCell = 30;
    
    xOffsetC1 = 0;
    xOffsetC2 = xOffsetC1 + widthOfColumn1;
    xOffsetC3 = xOffsetC2 + widthOfDayColumn;
    xOffsetC4 = xOffsetC3 + widthOfDayColumn;
    xOffsetC5 = xOffsetC4 + widthOfDayColumn;
    xOffsetC6 = xOffsetC5 + widthOfDayColumn;
    xOffsetC7 = xOffsetC6 + widthOfDayColumn;
    xOffsetC8 = xOffsetC7 + widthOfDayColumn;
    xOffsetC9 = xOffsetC8 + widthOfDayColumn;
    xOffsetC10 = xOffsetC9 + widthOfDayColumn;
    xOffsetC11 = xOffsetC10 + widthOfDayColumn;
    xOffsetC12 = xOffsetC11 + widthOfDayColumn;

    
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
    
    [self loadConstraintArrays];
}

- (void) loadSalesLabels {
    [self loadSalesConstraints];
    UIFont *headerFont = [UIFont fontWithName:@"Helvetica-Bold" size:14];
    UIFont *inputFont = [UIFont fontWithName:@"Helvetica" size:12];
    
    //row 1 headers
    NSMutableArray *row1Headers = [[NSMutableArray alloc] initWithObjects:@"Period", @"Wednesday", @"Thursday", @"Friday", @"Saturday", @"Sunday", @"Monday", @"Tuesday", @"Week", nil];
    
    NSMutableArray *col1SpecialHeaders = [[NSMutableArray alloc] initWithObjects:@"Week 1", @"Week 2", @"Week 3", @"Week 4", nil];
    for (int i = 0; i < [row1Headers count]; i++) {
        CGFloat xOff = [[xOffsets objectAtIndex:i] floatValue];
        UILabel *l = [[UILabel alloc] initWithFrame:CGRectMake(xOff, yOffsetR1, widthOfDayColumn, heightOfCell)];
        [l setText:[row1Headers objectAtIndex:i]];
        [l setFont:headerFont];
        [l setTextAlignment:NSTextAlignmentCenter];
        [salesView addSubview:l];
    }
    
    //column 1 headers
    int c = 0;
    for (int i = 1; i <= 16; i++) {
        CGFloat yOff = [[yOffsets objectAtIndex:i] floatValue];
        UILabel *l;
        CGRect specialHeaderFrame = CGRectMake(xOffsetC1+3, yOff, totalEffectiveWidth, heightOfCell);
        CGRect headerFrame = CGRectMake(xOffsetC1+3, yOff, widthOfColumn1, heightOfCell);
        l = [[UILabel alloc] initWithFrame:headerFrame];
        if (i == 1 || i == 5 || i == 9 || i == 13) {
            [l setFrame:specialHeaderFrame];
            [l setText:[col1SpecialHeaders objectAtIndex:c]];
            c++;
            
            if( i== 1){
                [l setBackgroundColor:[Utils DT_GREEN_LIGHT]];
            }
            if(i == 5){
                [l setBackgroundColor:[Utils DT_GREEN_MEDIUM]];
            }
            if (i == 9) {
                [l setBackgroundColor:[Utils DT_GREEN]];
            }
            if (i == 13) {
                [l setBackgroundColor:[Utils DT_GREEN_DARK]];
            }
            
        }
        if (i == 2 || i == 6 || i == 10 | i == 14) {
            [l setText:@"Actual Sales"];
        }
        if (i == 3 || i == 7 || i == 11 | i == 15) {
            [l setText:@"Last Year Sales"];
        }
        if (i == 4 || i == 8 || i == 12 | i == 16) {
            [l setText:@"Win/Lose"];
        }
        
        [l setFont:headerFont];
        [l setTextAlignment:NSTextAlignmentLeft];
        [salesView addSubview:l];
    }
    
    //initialize and set properties of the win or lose label.
    //text is set upon TextFieldDidEndEditing
    winLoseLabelsSales = [[NSMutableArray alloc] init];
    
    
    
    for (int i = 0; i < 8; i ++)  {
        CGFloat xOff = [[xOffsets objectAtIndex:i+1] floatValue];
        UILabel *h = [[UILabel alloc] initWithFrame:CGRectMake(xOff, yOffsetR5, widthOfDayColumn,heightOfCell)];
        [h setTag:i];
        [winLoseLabelsSales addObject:h];
        
    }
    for (int i = 0; i < 8; i ++)  {
        CGFloat xOff = [[xOffsets objectAtIndex:i+1] floatValue];
        UILabel *j = [[UILabel alloc] initWithFrame:CGRectMake(xOff, yOffsetR9, widthOfDayColumn, heightOfCell)];
        [j setTag:i+10];
        [winLoseLabelsSales addObject:j];
    }
    for (int i = 0; i < 8; i ++)  {
        CGFloat xOff = [[xOffsets objectAtIndex:i+1] floatValue];
        UILabel *k = [[UILabel alloc] initWithFrame:CGRectMake(xOff, yOffsetR13, widthOfDayColumn, heightOfCell)];
        [k setTag:i+20];
        [winLoseLabelsSales addObject:k];
    }
    for (int i = 0; i < 8; i ++)  {
        CGFloat xOff = [[xOffsets objectAtIndex:i+1] floatValue];
        UILabel *l = [[UILabel alloc] initWithFrame:CGRectMake(xOff, yOffsetR17, widthOfDayColumn, heightOfCell)];
        [l setTag:i+30];
        [winLoseLabelsSales addObject:l];
    }
    
    
    for (UILabel *l in winLoseLabelsSales) {
        [salesView addSubview:l];
        [l setTextAlignment:NSTextAlignmentCenter];
        [l setFont:headerFont];
        [l setText:@"?"];
    }

}

- (void) loadSalesLines {
    //table cell divider lines
    NSMutableArray *linesArray = [[NSMutableArray alloc] init];
    //horizontals
    for (int i  = 0; i < 18; i++) {
        CGFloat yOff = [[yOffsets objectAtIndex:i] floatValue];
        UIImageView *h = [[UIImageView alloc] initWithFrame:CGRectMake(0, yOff, totalEffectiveWidth, 2)];
        [h setImage:[UIImage imageNamed:@"yellowline_h"]];
        [linesArray addObject:h];
    }
    
    //verticals
    for (int i = 0; i < 10; i++) {
        CGFloat xOff = [[xOffsets objectAtIndex:i] floatValue];
        UIImageView *v = [[UIImageView alloc] initWithFrame:CGRectMake(xOff, 0, 3, totalEffectiveHeight)];
        [v setImage:[UIImage imageNamed:@"yellowline_v"]];
        [linesArray addObject:v];
    }
    
    for (UIImageView *l in linesArray) {
        [salesView addSubview:l];
    }

}

- (void) loadSalesFields {
    actualSalesFields = [[NSMutableArray alloc] init];
    lastYearSalesFields = [[NSMutableArray alloc] init];
    UIFont *inputFont = [UIFont fontWithName:@"Helvetica" size:14];
    
    CGFloat heightOfField = heightOfCell - 2.5;
    CGFloat widthOfField = widthOfDayColumn- 2.5;
    CGFloat textFieldPadding = 1.25;
    
    //goal fields
    for (int i  = 0; i < 8; i++) {
        CGFloat xOff = [[xOffsets objectAtIndex:i+1] floatValue] + textFieldPadding;
        UITextField *h = [[UITextField alloc] initWithFrame:CGRectMake(xOff, yOffsetR3+textFieldPadding, widthOfField, heightOfField)];
        UITextField *j = [[UITextField alloc] initWithFrame:CGRectMake(xOff, yOffsetR7+textFieldPadding, widthOfField, heightOfField)];
        UITextField *k = [[UITextField alloc] initWithFrame:CGRectMake(xOff, yOffsetR11+textFieldPadding, widthOfField, heightOfField)];
        UITextField *l = [[UITextField alloc] initWithFrame:CGRectMake(xOff, yOffsetR15+textFieldPadding, widthOfField, heightOfField)];
        [h setTag:i];
        [j setTag:i+10];
        [k setTag:i+20];
        [l setTag:i+30];
        [actualSalesFields addObject:h];
        [actualSalesFields addObject:j];
        [actualSalesFields addObject:k];
        [actualSalesFields addObject:l];
    }
    
    //actual fields
    for (int i  = 0; i < 8; i++) {
        CGFloat xOff = [[xOffsets objectAtIndex:i+1] floatValue] + textFieldPadding;
        UITextField *h = [[UITextField alloc] initWithFrame:CGRectMake(xOff, yOffsetR4+textFieldPadding, widthOfField, heightOfField)];
        UITextField *j = [[UITextField alloc] initWithFrame:CGRectMake(xOff, yOffsetR8+textFieldPadding, widthOfField, heightOfField)];
        UITextField *k = [[UITextField alloc] initWithFrame:CGRectMake(xOff, yOffsetR12+textFieldPadding, widthOfField, heightOfField)];
        UITextField *l = [[UITextField alloc] initWithFrame:CGRectMake(xOff, yOffsetR16+textFieldPadding, widthOfField, heightOfField)];
        [h setTag:i+40];
        [j setTag:i+50];
        [k setTag:i+60];
        [l setTag:i+70];
        [lastYearSalesFields addObject:h];
        [lastYearSalesFields addObject:j];
        [lastYearSalesFields addObject:k];
        [lastYearSalesFields addObject:l];
    }
    
    for (UITextField *l in actualSalesFields) {
        [l setTextAlignment:NSTextAlignmentCenter];
        [l setKeyboardType:UIKeyboardTypeNumbersAndPunctuation];
        [l setFont:inputFont];
        [l setBorderStyle:UITextBorderStyleRoundedRect];
        [l setDelegate:self];
        [l setPlaceholder:@"0"];
        [salesView addSubview:l];
    }
    
    for (UITextField *l in lastYearSalesFields) {
        [l setTextAlignment:NSTextAlignmentCenter];
        [l setKeyboardType:UIKeyboardTypeNumbersAndPunctuation];
        [l setFont:inputFont];
        [l setBorderStyle:UITextBorderStyleRoundedRect];
        [l setDelegate:self];
        [l setPlaceholder:@"0"];
        [salesView addSubview:l];
    }

}

- (void) loadSalesView {
    
    
    [salesView setBackgroundColor:[Utils DT_RED]];
    [salesView setHidden:NO];
}

//tut screen methods

- (void) showTut {
    tut = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [Utils getScreenWidth], [Utils getScreenHeight])];
    [tut setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:.8]];
    UILabel *lab;
    lab = [[UILabel alloc] initWithFrame:CGRectMake(0, [Utils getScreenHeight]/2, [Utils getScreenWidth], 200)];
    if (!isService && !isSales) {
        [lab setText:@"Did you beat your speed? Did you raise the bar for cars?\n\nEnter your speed in seconds as an integer, i.e. 24, 87, 12, etc. " ];
    } else if (isSales) {
        [lab setText:@"Did we win today?\n\n Enter sales as decimals in dollar values, i.e. 641.12, 9413.20, etc."];
    } else if (isService) {
        [lab setText:@"Speed with a Smile\n\n"];
    }
    [lab setTextAlignment:NSTextAlignmentCenter];
    [lab setTextColor:[Utils DT_WHITE]];
    [lab setNumberOfLines:0];
    [lab setFont:[UIFont fontWithName:@"Helvetica" size:26]];
    [tut addSubview:lab];
    
    [self.view addSubview:tut];

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


//segment control methods

- (void) updateSegmentColors {
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
    if (self.segmentedControl.selectedSegmentIndex == 0) {
        isService = NO;
        isSales = NO;
        isSpeed = YES;
        serviceView.hidden = YES;
        salesView.hidden = YES;
        [self loadSpeedView];
    } else if (self.segmentedControl.selectedSegmentIndex == 1) {
        isService = YES;
        isSales = NO;
        isSpeed = NO;
        salesView.hidden = YES;
        speedView.hidden= YES;
        [self loadServiceView];

    } else if (self.segmentedControl.selectedSegmentIndex == 2) {
        isSales = YES;
        isService = NO;
        isSpeed = NO;
        serviceView.hidden = YES;
        speedView.hidden= YES;
        [self loadSalesView];

    }
    
    [self showTut];

    
}

- (IBAction)sendReport:(id)sender {
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)])
        UIGraphicsBeginImageContextWithOptions(self.window.bounds.size, NO, [UIScreen mainScreen].scale);
    else
        UIGraphicsBeginImageContext(self.window.bounds.size);

    [self.window.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSData * imgData = UIImagePNGRepresentation(image);
    
    NSData *fileData = UIImagePNGRepresentation([UIImage imageNamed:@"logo"]);

    if(imgData)
        [imgData writeToFile:@"screenshot.png" atomically:YES];
    else
        NSLog(@"error while taking screenshot");
    
    NSString *emailTitle = [NSString stringWithFormat:@"Report - Statistics - "];
    NSString *messageBody = [NSString stringWithFormat:@"Report generated on: %@", [NSDate date]];
    NSArray *toRecipients = [NSArray arrayWithObject:@"raks.garg@gmail.com"];
    NSString *fileName;
    
    if (isSpeed) {
        emailTitle = [emailTitle stringByAppendingString:@"Speed"];
        fileName = @"speedStats.png";
    } else if (isService) {
        emailTitle = [emailTitle stringByAppendingString:@"Service"];
        fileName = @"serviceStats.png";
    } else if (isSales) {
        emailTitle = [emailTitle stringByAppendingString:@"Sales"];
        fileName = @"salesStats.png";
    }
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:NO];
    [mc setToRecipients:toRecipients];
    
    NSString *mimeType = @"image/png";

    // Add attachment
    [mc addAttachmentData:imgData mimeType:mimeType fileName:@"screenshot.png"];
    
    // Present mail view controller on screen
    [self presentViewController:mc animated:YES completion:NULL];
    
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

- (BOOL) textFieldShouldReturn:(UITextField *)textField  {
    [textField resignFirstResponder];
    return YES;
}

- (void) textFieldDidBeginEditing:(UITextField *)textField {
    NSLog(@"%li started", (long)textField.tag);
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    int tag = textField.tag;
    //TODO Save the Goal into Core Data to Populate FrontScreen..
    //GOAL is an INT
    if (isSpeed){
        NSCharacterSet* notDigits = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
        if (tag < 40) {
            NSLog(@"Tag: %i", tag);
            goal = [[textField text] integerValue];
            if ([textField.text rangeOfCharacterFromSet:notDigits].location != NSNotFound) {
                [self alertForMisFormedText];
                [textField setText:@""];
            } else {
                [textField setEnabled:NO];
                [textField setBackgroundColor:[UIColor grayColor]];
            }
 
            switch (tag) {
                case 0:
                case 10:
                case 20:
                case 30:
                    if (tag == 0 && tag == 10) {
                        lunch = YES;
                        if (tag == 10) {
                            counter = YES;
                        }
                        else{
                            lunch = NO;
                            counter = NO;
                        }
                    }
                    day = @"Wednesday";
                    break;
                case 1:
                case 11:
                case 21:
                case 31:
                    if (tag == 1 && tag == 11) {
                        lunch = YES;
                        if (tag == 11) {
                            counter = YES;
                        }
                        else{
                            lunch = NO;
                            counter = NO;
                        }
                    }
                    day = @"Thursday";
                    break;
                case 2:
                case 12:
                case 22:
                case 32:
                    if (tag == 2 && tag == 12) {
                        lunch = YES;
                        if (tag == 12) {
                            counter = YES;
                        }
                        else{
                            lunch = NO;
                            counter = NO;
                        }
                    }
                    day = @"Friday";
                    break;
                case 3:
                case 13:
                case 23:
                case 33:
                    if (tag == 3 && tag == 13) {
                        lunch = YES;
                        if (tag == 13) {
                            counter = YES;
                        }
                        else{
                            lunch = NO;
                            counter = NO;
                        }
                    }
                    day = @"Saturday";
                    break;
                case 4:
                case 14:
                case 24:
                case 34:
                    if (tag == 4 && tag == 14) {
                        lunch = YES;
                        if (tag == 14) {
                            counter = YES;
                        }
                        else{
                            lunch = NO;
                            counter = NO;
                        }
                    }
                    day = @"Sunday";
                    break;
                case 5:
                case 15:
                case 25:
                case 35:
                    if (tag == 5 && tag == 15) {
                        lunch = YES;
                        if (tag == 15) {
                            counter = YES;
                        }
                        else{
                            lunch = NO;
                            counter = NO;
                        }
                    }
                    day = @"Monday";
                    break;
                case 6:
                case 16:
                case 26:
                case 36:
                    if (tag == 6 && tag == 16) {
                        lunch = YES;
                        if (tag == 16) {
                            counter = YES;
                        }
                        else{
                            lunch = NO;
                            counter = NO;
                        }
                    }
                    day = @"Tuesday";
                    break;
                case 7:
                case 17:
                case 27:
                case 37:
                    if (tag == 7 && tag == 17) {
                        lunch = YES;
                        if (tag == 17) {
                            counter = YES;
                        }
                        else{
                            lunch = NO;
                            counter = NO;
                        }
                    }
                    day = @"Week";
                    break;
                default:
                    break;
            }
            dailygoal = [NSNumber numberWithInt:goal ];
            
            if(tag == 17 || tag == 27 || tag == 37 || tag == 47){
                weeklygoal = [NSNumber numberWithInt:goal];
            }
        } else {
            actual = [[textField text] integerValue];
            if ([textField.text rangeOfCharacterFromSet:notDigits].location != NSNotFound) {
                [self alertForMisFormedText];
                [textField setText:@""];
            }
            
            dailyactual = [NSNumber numberWithInt:actual];
            
            if(tag == 47 || tag == 57 || tag == 67 || tag == 77){
                weeklyactual = [NSNumber numberWithInt:actual];
            }
        }
        

        

        
        /** In loadSpeedLabels, UILabels were added to the NSMutableArray winLoseLabels. 
          * Tags of each element were set to the same as the goal tag of the corresponding textbox. 
          * We need a corrected tag (cIndex) so that we have the tag value for both the goal and actual textBox and can prevent duplicate labels in the same cell.
          * This is the index into the winLoseArray and how we will alter each label selectively within
          * the spread sheet.
          */
        
        UILabel *wl;
        int tempTag = tag;
        for (int i = 0; i < [winLoseLabelsSpeed count]; i++) {
            if (tag < 40) {
                if ([[winLoseLabelsSpeed objectAtIndex:i] tag] == tag) {
                    wl = [winLoseLabelsSpeed objectAtIndex:i];
                }
            } else {
                tempTag = tag - 40;
                if ([[winLoseLabelsSpeed objectAtIndex:i] tag] == tempTag) {
                    wl = [winLoseLabelsSpeed objectAtIndex:i];
                }
            }
        }
        
        NSLog(@"%i and %i", actual, goal);
        if (actual <=  goal) {
            [wl setText:@"Win"];
        } else {
            [wl setText:@"Lose"];
        }
        
    } else if (isService) {
        //TODO:: SAVE number of transaction 
    } else if (isSales) {
        //TODO:: SAVE last Year Sales from a FLOAT value to populate front screen
        if (tag < 40) {
            NSLog(@"Tag: %i", tag);
            lastYearSales = [[textField text] floatValue];
            if (lastYearSales <= 0.00) {
                [self alertForMisFormedText];
                [textField setText:@""];
            } else {
                [textField setEnabled:NO];
                [textField setBackgroundColor:[UIColor grayColor]];
            }

        } else {
            actualSales = [[textField text] floatValue];
            if (actualSales <= 0.00) {
                [self alertForMisFormedText];
                [textField setText:@""];
            }
        }
        
        
        UILabel *wl;
        int tempTag = tag;
        for (int i = 0; i < [winLoseLabelsSales count]; i++) {
            if (tag < 40) {
                if ([[winLoseLabelsSales objectAtIndex:i] tag] == tag) {
                    wl = [winLoseLabelsSales objectAtIndex:i];
                }
            } else {
                tempTag = tag - 40;
                if ([[winLoseLabelsSales objectAtIndex:i] tag] == tempTag) {
                    wl = [winLoseLabelsSales objectAtIndex:i];
                }
            }
        }
        
        if (actualSales <  lastYearSales) {
            [wl setText:@"Win"];
        } else {
            [wl setText:@"Lose"];
        }
        
        
        
        
    }
    [self sendtoDisplay];
}


- (void) alertForMisFormedText {
    UIAlertView *al = [[UIAlertView alloc] initWithTitle:@"Error"
                                                 message:@"Please enter a valid number."
                                                delegate:nil
                                       cancelButtonTitle:@"Okay"
                                       otherButtonTitles:nil, nil];
    [al show];
}



- (IBAction)refreshAction:(id)sender {
    UIAlertView *al = [[UIAlertView alloc] initWithTitle:@"Alert"
                                                 message:@"Are you sure you want to reset all locked fields?"
                                                delegate:self
                                       cancelButtonTitle:@"No"
                                       otherButtonTitles:@"Yes", nil];
    [al show];
    
}

- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        if (isSpeed) {
            for (UITextField *t in goalFields) {
                if (t) {
                    [t setEnabled:YES];
                    [t setBackgroundColor:[Utils DT_WHITE]];
                    [t setText:@""];
                }
            }
            
        } else if (isSales) {
            for (UITextField *t in actualSalesFields) {
                if (t) {
                    [t setEnabled:YES];
                    [t setBackgroundColor:[Utils DT_WHITE]];
                    [t setText:@""];
                }
            }
        }
        
    }
}
-(void)viewWillDisappear:(BOOL)animated {
    
//    if(isSpeed)
//    {
//        NSLog(@"Day: %@", day);
//        NSLog(@"Goal: %@", dailygoal);
//        NSLog(@"Actual: %@", dailyactual);
//        NSLog(lunch ? @"Dinner" : @"Lunch");
//        NSLog(counter ? @"Drive-Thru" : @"Counter");
//        [self passSpeedDataForward];
//    }
//    else if (isSales)
//    {
//        NSLog(@"Day: %@", day);
//        NSLog(@"Goal: %@", dailygoal);
//        NSLog(@"Actual: %@", dailyactual);
//        NSLog(lunch ? @"Dinner" : @"Lunch");
//        NSLog(counter ? @"Drive-Thru" : @"Counter");
//        [self passSaleDataForward ];
//    }

}
@synthesize speed;
@synthesize sale;
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
            //[self passDataForward];
            if (isSpeed) {
                self.speed.day = day;
                self.speed.dailyactual = dailyactual;
                self.speed.weeklyactual = weeklyactual;
                self.speed.dailygoal = dailygoal;
                self.speed.weeklygoal = weeklygoal;
                self.speed.iscounter = [NSNumber numberWithBool:counter];
                self.speed.islunch = [NSNumber numberWithBool:lunch];
             //   [self passSpeedData];
            }
            else if (isSales){
                self.sale.dailyactualsale = dailyactualsale;
                self.sale.dailylastyearsale = dailylastyearsale;
                self.sale.weeklyactualsale = weeklyactualsale;
                self.sale.weeklylastyearsale = weeklylastyearsale;
                self.sale.day = day;
             //   [self passSaleData];
            }
        }
    }
}
-(void)passDataForward
{
    //displayScreenViewController * display = [[displayScreenViewController alloc ]init];
    
    if (isSpeed)
    {
        speed.day = day;
        speed.dailyactual = dailyactual;
        speed.weeklyactual = weeklyactual;
        speed.dailygoal = dailygoal;
        speed.weeklygoal = weeklygoal;
        
        if (lunch == 1) {
            speed.islunch = [NSNumber numberWithBool:YES];
        } else
        {
            speed.islunch = [NSNumber numberWithBool:NO];
        }
        if (counter == 1) {
            speed.iscounter = [NSNumber numberWithBool:YES];
        }
        else
        {
            speed.iscounter = [NSNumber numberWithBool:NO];
        }
        
        //display.speed = speed;
    }
    else if (isSales)
    {
        sale.day = day;
        sale.dailyactualsale = dailyactualsale;
        sale.weeklyactualsale = weeklyactualsale;
        sale.dailylastyearsale = dailylastyearsale;
        sale.weeklylastyearsale = weeklylastyearsale;
    }

}
-(void)passSaleDataForward
{
    displayScreenViewController * display = [[displayScreenViewController alloc ]init];
    [self.navigationController pushViewController:display animated:YES];
}

-(void)passSpeedData
{
    self.speed.day = day;
    self.speed.dailyactual = dailyactual;
    self.speed.weeklyactual = weeklyactual;
    self.speed.dailygoal = dailygoal;
    self.speed.weeklygoal = weeklygoal;
    self.speed.iscounter = [NSNumber numberWithBool:counter];
    self.speed.islunch = [NSNumber numberWithBool:lunch];
}
-(void)passSaleData
{
    
}
@end
