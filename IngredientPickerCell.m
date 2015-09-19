//
//  IngredientPickerCell.m
//  TeamFive
//
//  Created by 陳逸仁 on 9/19/15.
//  Copyright © 2015 yishain. All rights reserved.
//

#import "IngredientPickerCell.h"

@interface IngredientPickerCell() <UIPickerViewDataSource, UIPickerViewDelegate>
@property (strong, nonatomic) NSMutableArray *pickerOptions;
@property (strong, nonatomic) UIPickerView *picker;
@end

@implementation IngredientPickerCell

- (void)awakeFromNib {
    self.IngredientTextfield.inputView = self.picker;
}

#pragma mark - setter & getter

- (NSMutableArray *)pickerOptions
{
    if (!_pickerOptions) {
//        _pickerOptions = self.ingreCategory.totalCategory;
        NSLog(@"%@", self.category);
        _pickerOptions = @[self.category];
    }
    return _pickerOptions;
}

- (UIPickerView *)picker
{
    if (!_picker) {
        _picker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 45, self.frame.size.width, 120)];
        _picker.delegate = self;
        _picker.dataSource = self;
    }
    return _picker;
}

#pragma mark - picker delegate

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.pickerOptions count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return self.pickerOptions[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
//    self.CategoryTextfield.text = self.pickerOptions[row][@"name"];
//    [self.CategoryTextfield resignFirstResponder];
//    [self.delegate updateCategoryChosen:self];
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
