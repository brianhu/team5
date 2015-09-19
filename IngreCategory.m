//
//  IngreCategory.m
//  TeamFive
//
//  Created by 陳逸仁 on 9/19/15.
//  Copyright © 2015 yishain. All rights reserved.
//

#import "IngreCategory.h"

@implementation IngreCategory

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.totalCategory = [[NSMutableArray alloc] initWithArray: @[ @{@"name": @"tea", @"unit" : @"g"},
                                                                       @{@"name": @"Beverage", @"unit" : @"ml"},
                                                                       @{@"name": @"Fruit", @"unit" : @"g"},
                                                                       @{@"name": @"Jam", @"unit" : @"ml"},
                                                                       @{@"name": @"Bread", @"unit" : @"g"} ]];
    }
    return self;
}
@end
