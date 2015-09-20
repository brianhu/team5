//
//  IngredientsTableViewController.m
//  TeamFive
//
//  Created by yishain on 9/19/15.
//  Copyright (c) 2015 yishain. All rights reserved.
//

#import "IngredientsTableViewController.h"
#import "SettingsCollectionViewController.h"
#import <Parse.h>

@interface IngredientsTableViewController ()
{
    NSArray *ingredientsOrder;
    NSDictionary *dictParseData;
    NSMutableArray *mutebleArrayParseData;

    NSMutableString *dataName;
    NSMutableString *dataPrice;
    NSMutableString *dataShelfLife;

    NSString *tableTitle;
    NSInteger ingreNum;
}

@end

@implementation IngredientsTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    ingreNum = self.Num;
    
    ingredientsOrder = @[@"茶葉", @"飲料", @"水果", @"果醬", @"麵包", @"點心"];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

    self.title = @"食材保鮮度清單";

    [self fetchParseIngredients];

    [self.tableView reloadData];
}

#pragma mark - Fetch Parse Data
- (void)fetchParseIngredients {
    PFQuery *query = [PFQuery queryWithClassName:@"Ingredient"];
    [query whereKey:@"category" equalTo:ingredientsOrder[ingreNum]];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %lu data.", (unsigned long)objects.count);
            // Do something with the found objects
            dictParseData = (NSDictionary*)objects;
            mutebleArrayParseData = [NSMutableArray new];
            for (NSDictionary *object in dictParseData) {
                [mutebleArrayParseData addObject:object];
                [self.tableView reloadData];
            }

        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [mutebleArrayParseData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:
(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
//    cell.textLabel.text = [Ingredients objectAtIndex:indexPath.row];

    NSDictionary *tmpDict = [mutebleArrayParseData objectAtIndex:indexPath.row];
    dataName = [NSMutableString stringWithFormat:@"%@", [tmpDict objectForKey:@"name"]];
    dataPrice = [NSMutableString stringWithFormat:@"%@", [tmpDict objectForKey:@"price"]];
    dataShelfLife = [NSMutableString stringWithFormat:@"%@", [tmpDict objectForKey:@"shelfLife"]];


    UILabel *labelName = (UILabel *)[cell viewWithTag:100];
    labelName.text = dataName;
    UILabel *labelPrice = (UILabel *)[cell viewWithTag:200];
    labelPrice.text = dataPrice;
    UILabel *labelShelfLife = (UILabel *)[cell viewWithTag:300];
    labelShelfLife.text = dataShelfLife;

    return cell;
}



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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
