//
//  PickerCell.h
//  TeamFive
//
//  Created by 陳逸仁 on 9/19/15.
//  Copyright © 2015 yishain. All rights reserved.
//

#import <Foundation/Foundation.h>

@class IngreCategoryPickerCell;
@protocol PickerCell <NSObject>

@required
- (void)updateCategoryChosen:(IngreCategoryPickerCell *)ingreCategoryCell;

@end
