//
//  ExpiringIngredientTableViewCell.m
//  TeamFive
//
//  Created by CHIH WEI HU on 19/9/15.
//  Copyright © 2015 yishain. All rights reserved.
//

#import "ExpiringIngredientTableViewCell.h"

@implementation ExpiringIngredientTableViewCell

- (void)awakeFromNib {
    [_progressBar setProgress:0.9 animated:YES];
    [_progressBar setProgressDirection:M13ProgressViewBarProgressDirectionRightToLeft];
    _progressBar.showPercentage = NO;
    _progressBar.backgroundColor = [UIColor clearColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
