//
//  SearchTableViewController.m
//  TeamFive
//
//  Created by yishain on 9/19/15.
//  Copyright (c) 2015 yishain. All rights reserved.
//

#import "SearchTableViewController.h"
#import "ExpiringIngredientTableViewCell.h"
#import <Parse/Parse.h>
#import "IngreCategory.h"
#import "MBProgressHUD.h"

@interface SearchTableViewController ()
@property (strong, nonatomic) NSArray *ingredients;
@end
NSString static *cellIdentifier = @"ExpiringCell";

@implementation SearchTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    PFQuery *query = [PFQuery queryWithClassName:@"RawIngredient"];
    [query includeKey:@"ingredient"];
    [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        _ingredients = objects;
        [self.tableView reloadData];
        [MBProgressHUD hideHUDForView:self.navigationController.view animated:YES];
    }];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self.tableView registerNib:[UINib nibWithNibName:@"ExpiringIngredientCell" bundle:nil] forCellReuseIdentifier:cellIdentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_ingredients count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ExpiringIngredientTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    PFObject *rawIngredient = _ingredients[indexPath.row];
    cell.nameLabel.text = rawIngredient[@"name"];
    PFObject *ingredient = rawIngredient[@"ingredient"];
    cell.quantity.text = [NSString stringWithFormat:@"庫存：%@ %@", [rawIngredient[@"quantity"] stringValue], [IngreCategory unitMap:ingredient[@"category"]]];
    NSInteger interval = [[NSDate date] timeIntervalSinceDate:rawIngredient.createdAt] / 3600;
    NSInteger shelfLife = [ingredient[@"shelfLife"] integerValue];
    NSInteger remainedLife = shelfLife - interval;
    CGFloat ratio = (float)remainedLife / (float)shelfLife;
    [cell.progressBar setProgress:ratio animated:YES];
    UIColor *progressColor;
    if (ratio > 0.5) {
        progressColor = [UIColor colorWithRed:0.53 green:0.99 blue:0 alpha:1];
    } else if (ratio > 0.3) {
        progressColor = [UIColor colorWithRed:0.95 green:0.83 blue:0.27 alpha:1];
    } else {
        progressColor = [UIColor redColor];
    }
    [cell.progressBar setPrimaryColor:progressColor];
    cell.expiringTime.text = [NSString stringWithFormat:@"剩餘時間： %li 小時", (long)remainedLife];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 111.;
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

@end
