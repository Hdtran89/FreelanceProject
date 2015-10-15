//
//  CleaningViewController.m
//  Del Taco
//
//  Created by iOSDev on 8/11/15.
//  Copyright (c) 2015 United Tax. All rights reserved.
//

#import "CleaningViewController.h"

@interface CleaningViewController () {
    NSArray *weekPickerData;
    NSArray *dayPickerData;
    NSArray *monthPickerData;
}

@end

@implementation CleaningViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.segmentedControl setTintColor:[Utils DT_GREEN]]; 
    self.isDaily = YES;
    // Do any additional setup after loading the view.
    [self loadPickerViewDefaults];
}

- (void) loadPickerViewDefaults {
    weekPickerData = @[@"Week 1", @"Week 2", @"Week 3", @"Week 4"];
    dayPickerData = @[@"Sunday", @"Monday", @"Tuesday", @"Wednesday", @"Thursday", @"Friday", @"Saturday"];
    //[self.weekPicker selectRow:0 inComponent:0 animated:YES];
    [self.weekPicker selectRow:3 inComponent:1 animated:YES];
    [self.weekPicker selectRow:0 inComponent:0 animated:YES];
    NSString *week = [weekPickerData objectAtIndex:[self.weekPicker selectedRowInComponent:0]];
    NSString *day = [dayPickerData objectAtIndex:[self.weekPicker selectedRowInComponent:1]];
    [self updateShowButtonTitle:week :day];
    [self updateTasks:week :day];
}

- (void) loadPickerViewQuarterly {
    monthPickerData = @[@"Month 1", @"Month 2", @"Month 3"];
    [self.weekPicker selectRow:1 inComponent:0 animated:YES];
    NSString *month = [monthPickerData objectAtIndex:[self.weekPicker selectedRowInComponent:0]];
    [self updateShowButtonTitle:month];
    [self updateTasks:month];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    if (self.isDaily)
        return 2;
    else return 1;
}

-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (self.isDaily) {
        if (component == 0)
            return [weekPickerData count];
        else
            return [dayPickerData count];
    } else
        return [monthPickerData count];
    
}

- (NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (self.isDaily) {
        if (component == 0)
            return [weekPickerData objectAtIndex:row];
        else
            return [dayPickerData objectAtIndex:row];
    } else {
        return [monthPickerData objectAtIndex:row];
    }
    
}
- (CGFloat) pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
//    if (component == 0)
//        return 50;
//    else
    if (self.isDaily) return 120;
    else return 120;
}

- (CGFloat) pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
     return 30;
}

- (UIView *) pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    UILabel *tView = (UILabel *)view;
    if (!tView) {
        tView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, [pickerView rowSizeForComponent:component].width, [pickerView rowSizeForComponent:component].height)];
    }
    tView.text = [self pickerView:pickerView titleForRow:row forComponent:component];
    if (self.isDaily) {
        if (component == 0) tView.textAlignment = NSTextAlignmentLeft;
        else tView.textAlignment = NSTextAlignmentRight;
        tView.font = [UIFont systemFontOfSize:22];

    } else {
        tView.textAlignment = NSTextAlignmentCenter;
        tView.font = [UIFont systemFontOfSize:22];
    }
    return tView;
}


//implemement auto button title change

 - (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
 {
     if (self.isDaily) {
         NSString *week = [weekPickerData objectAtIndex:[self.weekPicker selectedRowInComponent:0]];
         NSString *day = [dayPickerData objectAtIndex:[self.weekPicker selectedRowInComponent:1]];
         [self updateShowButtonTitle: week :day];
         [self updateTasks:week :day];
     }
     else {
         NSString *month = [monthPickerData objectAtIndex:[self.weekPicker selectedRowInComponent:0]];
         [self updateShowButtonTitle:month];
         [self updateTasks:month];
     }
//     if (component == 1 && row == 0)
//         [self updateTasks: dayPickerData[row] :weekPickerData[component]];
 }


- (void) updateShowButtonTitle: (NSString *)month {
    NSString *showButtonTitle = @"Showing schedule for ";
    showButtonTitle = [showButtonTitle stringByAppendingString: month];
    self.showBtn.userInteractionEnabled = NO;
    [self.showBtn setTitle:showButtonTitle forState:UIControlStateNormal];
}


- (void) updateShowButtonTitle: (NSString *)selWeek :(NSString*)selDay {
    NSString *showButtonTitle = @"Showing schedule for ";
    showButtonTitle = [[[showButtonTitle stringByAppendingString: selWeek] stringByAppendingString:@", "] stringByAppendingString:selDay];
    self.showBtn.userInteractionEnabled = NO;
    [self.showBtn setTitle:showButtonTitle forState:UIControlStateNormal];
}

- (void) updateTasks: (NSString*)month{
    
    NSString *tasks = @"Items to be done/Period to be completed:\n\n";
    if ([month isEqualToString:@"Month 1"]) {
        tasks = [tasks stringByAppendingString:@"Empty/Wash/Sanitize Condiment Dispensers/ 1, 4, 7, 10\nEmpty/Wash/Sanitize Cup Dispensers/ 2, 5, 8, 11\nRemove Panels and Wash Shake Machine/  3, 6, 9, 12\nDrain Water Heater Sediment/ 4, 7, 10, 13"];
    } else if ([month isEqualToString:@"Month 2"]) {
        tasks = [tasks stringByAppendingString:@"Empty/Clean Dry Goods Shelving/ 1, 4, 7, 10\nClean Range Burners and Orifices/ 2, 5, 8, 11\nClean/Replace all Cooler & Freezer Gaskets/ 3, 6, 9, 12\nCheck Irrigation/ 1, 4, 7, 10"];
    } else if ([month isEqualToString:@"Month 3"]) {
        tasks = [tasks stringByAppendingString:@"Check Flowers/Trim Trees/ 1, 4\nRestripe Parking Lot/4\nPain Dumpater gates/ 2, 7\nPaint back door/ 3, 8\nDelime Coffee/Tea Brewer/ 12"];
    }
    
    [self.cleaningTasks setFont:[UIFont systemFontOfSize:18]];
    [self.cleaningTasks setLineBreakMode:NSLineBreakByWordWrapping];
    [self.cleaningTasks setNumberOfLines:0];
    [self.cleaningTasks removeConstraints:self.cleaningTasks.constraints];
    [self.cleaningTasks setTextAlignment:NSTextAlignmentCenter];
    [self.cleaningTasks setFrame:CGRectMake(0, .6*[Utils getScreenHeight], [Utils getScreenWidth], .5*[Utils getScreenHeight])];
    [self.cleaningTasks setText:tasks];
    
}

- (void) updateTasks: (NSString*)week
                    : (NSString*)day{
    
    NSString *tasks = @"";
    if ([day isEqualToString:@"Sunday"]) {
        tasks = @"Walk In/Freezer(s) Area\n\nAll walls/floors/ceiling/doors cleaned\nFloors scrubbed\nAll shelving detail cleaned\nFans and Fan Guards cleaned\nCeiling cleaned";
    } else if ([day isEqualToString:@"Monday"]) {
        tasks = @"Grill Area\n\nGrill front/sides/top/shelves detail cleaned\nBean Stove front/side/top/legs cleaned\nStainless steel walls scrubbed/polish\nMake station/reach ins detail cleaned\nFloors under all equipment scrubbed";
    } else if ([day isEqualToString:@"Tuesday"]) {
        tasks = @"Fryer Station Area\n\nBoil out fryers/clean front/side/back\nExhaust Hood detail cleaned\nStainless Steel detail cleaned/polish\nScrub all floors under equipment";
    } else if ([day isEqualToString:@"Wednesday"]) {
        if ([week isEqualToString:@"Week 1"])
            tasks = @"Taco Bar Area\n\nTaco Bar detail cleaned/Side/Front/Legs\nStainless Steel/Walls/Ceilings cleaned\nMake Station/Reach-in scrubbed clean\nScrubbed floors under all equipment\nAll monitors/Cameras cleaned\nCheese blade Changed (if needed)";
        else
            tasks = @"Taco Bar Area\n\nTaco Bar detail cleaned/Side/Front/Legs\nStainless Steel/Walls/Ceilings cleaned\nMake Station/Reach-in scrubbed clean\nScrubbed floors under all equipment\nAll monitors/Cameras cleaned";
    } else if ([day isEqualToString:@"Thursday"]) {
        if ([week isEqualToString:@"Week 1"] || [week isEqualToString:@"Week 4"])
            tasks = @"Prep Area\n\nAll shelves detail cleaned\nWalls/floors/baseboards scrubbed\nEquipment broken down & detail cleaned\nSchedule Quarterly Cleaning (see below)";
        else
            tasks = @"Prep Area\n\nAll shelves detail cleaned\nWalls/floors/baseboards scrubbed\nEquipment broken down & detail cleaned";
    } else if ([day isEqualToString:@"Friday"]) {
        tasks = @"Storage/Misc. Area(s)\n\nAll shelving/posts scrubbed clean\nWalls/doors/floors/drains/ceiling\nFront Counter Customer Service area\nAll trash cans in entire store scrubbed\nOffice Organized and cleaned";
    } else if ([day isEqualToString:@"Saturday"]) {
        tasks = @"Dining Room/Outside Area\n\nAll tables/chairs/legs/umbrellas cleaned\nFans/vents/floors/baseboards scrubbed\nAll walls/tiles scrubbed\nRestroom/walls/fixtures/baseboards cleaned\nrestroom floors scrubbed\nD/T Menu board/Speakers Post cleaned";
    }
    
    [self.cleaningTasks setFont:[UIFont systemFontOfSize:18]];
    [self.cleaningTasks setLineBreakMode:NSLineBreakByWordWrapping];
    [self.cleaningTasks setNumberOfLines:0];
    [self.cleaningTasks removeConstraints:self.cleaningTasks.constraints];
    [self.cleaningTasks setTextAlignment:NSTextAlignmentCenter];
    [self.cleaningTasks setFrame:CGRectMake(0, .6*[Utils getScreenHeight], [Utils getScreenWidth], .5*[Utils getScreenHeight])];
    [self.cleaningTasks setText:tasks];
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)segmentSwitch:(id)sender {
    if (self.isDaily) {
        self.isDaily = NO;
        [self.weekPicker reloadAllComponents];
        [self loadPickerViewQuarterly];
        
    } else {
        self.isDaily = YES;
        [self.weekPicker reloadAllComponents];
        [self loadPickerViewDefaults];
    }
}


- (IBAction)showBtnPressed:(id)sender {
//    NSString *week = [weekPickerData objectAtIndex:[self.weekPicker selectedRowInComponent:0]];
//    NSString *day = [dayPickerData objectAtIndex:[self.weekPicker selectedRowInComponent:1]];
//    week = [[week stringByAppendingString:@" "] stringByAppendingString:day];
//    [self.showBtn setTitle:week forState:UIControlStateNormal];
}
- (IBAction)home:(id)sender {
    [self performSegueWithIdentifier:@"clean.modal.segue" sender:self];
}
@end
