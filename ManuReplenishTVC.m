//
//  ManuReplenishTVC.m
//  TeamFive
//
//  Created by 陳逸仁 on 9/19/15.
//  Copyright © 2015 yishain. All rights reserved.
//

#import "ManuReplenishTVC.h"
#import "IngreCategory.h"
#import "IngreCategoryPickerCell.h"
#import "PickerCell.h"
#import "IngredientPickerCell.h"

@interface ManuReplenishTVC () <PickerCell>
@property (strong, nonatomic) IngreCategory *ingreCategory;
@property (strong, nonatomic) NSString *categorySelected;
@property (strong, nonatomic) NSString *ingredientSelected;

@property (weak, nonatomic) IBOutlet IngreCategoryPickerCell *categoryCell;
@property (weak, nonatomic) IBOutlet IngredientPickerCell *ingredientCell;
@end

@implementation ManuReplenishTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.categoryCell.delegate = self;
    self.ingredientCell.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - setter & getter

- (IngreCategory *)ingreCategory {
    if (!_ingreCategory) {
        _ingreCategory = [[IngreCategory alloc] init];
    }
    return _ingreCategory;
}

- (void)setCategorySelected:(NSString *)categorySelected {
    _categorySelected = categorySelected;
    self.ingredientCell.category = categorySelected;
    NSLog(@"%@", self.ingredientCell.category);
}

#pragma mark - picker

- (void)updateCategoryChosen:(IngreCategoryPickerCell *)ingreCategoryCell
{
    self.categorySelected = ingreCategoryCell.CategoryTextfield.text;
//    NSLog(@"%@", self.categorySelected);
}

- (void)update:(NSString *)target By:(UITableViewCell *)cell
{
    if ([target isEqualToString:@"category"]) {
        IngreCategoryPickerCell *myCell = (IngreCategoryPickerCell *)cell;
        self.categorySelected = myCell.CategoryTextfield.text;
        
    }else if ([target isEqualToString:@"ingredient"]) {
        
        IngredientPickerCell *myCell = (IngredientPickerCell *)cell;
        self.ingredientSelected = myCell.IngredientTextfield.text;
        NSLog(@"Selected ingredient: %@", self.ingredientSelected);
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}


//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    IngreCategoryPickerCell *cell = (IngreCategoryPickerCell *)[tableView dequeueReusableCellWithIdentifier:@"pickerCell" forIndexPath:indexPath];
//    
//    // Configure the cell...
//    
//    switch (indexPath.row) {
//        case 0:
//            break;
//            
//        default:
//            break;
//    }
//    
//    cell.delegate = self;
//    return cell;
//}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
