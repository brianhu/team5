//
//  EliminatingTableViewController.m
//  TeamFive
//
//  Created by CHIH WEI HU on 20/9/15.
//  Copyright © 2015 yishain. All rights reserved.
//

#import "EliminatingTableViewController.h"
#import "IngreCategory.h"

@interface EliminatingTableViewController () <UIPickerViewDataSource, UIPickerViewDelegate>

@end

@implementation EliminatingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _handledOptions = @[@"使用", @"過期"];
    _unitLabel.text = [IngreCategory unitMap:_object[@"category"]];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return  [_handledOptions count];
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 44.;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSString *title = _handledOptions[row];
    return title;
}

- (IBAction)save:(id)sender {
    [_object incrementKey:@"quantity" byAmount:@(-[_quantityField.text integerValue])];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
