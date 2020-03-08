//
//  TableViewController.m
//  TableViewController
//
//  Created by Ashraf on 3/7/20.
//  Copyright © 2020 Ashraf. All rights reserved.
//

#import "TableViewController.h"
#import "DetailViewController.h"
@interface TableViewController ()

@end

@implementation TableViewController{
    DetailViewController* detailViewController ;
}
@synthesize males,females,friends;
- (void)viewDidLoad {
    [super viewDidLoad];
    detailViewController =
    [self.storyboard instantiateViewControllerWithIdentifier:@"detail"];
    males =[NSMutableArray arrayWithCapacity:3];
    [males addObject:@"Ashraf"];
    [males addObject:@"Ahmed"];
    [males addObject:@"Mohamed"];

    females =[NSMutableArray arrayWithCapacity:3];
    [females addObject:@"Mona"];
    [females addObject:@"Esraa"];
    [females addObject:@"Eman"];
    
    friends = [NSMutableArray<Friend*> arrayWithCapacity:6];
    [friends addObject:[[Friend alloc] setName:@"Ashraf" setEmail:@"Ashraf.mohamed4728@gmail.com" setPhone:@"0123456778" setAge:24]];
    
     [friends addObject:[[Friend alloc] setName:@"Ahmed" setEmail:@"Ahmed.Mohsen@gmail.com" setPhone:@"0123875847"setAge:35]];
     [friends addObject:[[Friend alloc] setName:@"Mohamed" setEmail:@"Mohamed.Ibrahim@gmail.com" setPhone:@"0193847483" setAge:20]];
     [friends addObject:[[Friend alloc] setName:@"Ali" setEmail:@"ALi.eslam@gmail.com" setPhone:@"0123485843" setAge:45]];
     [friends addObject:[[Friend alloc] setName:@"Montaser" setEmail:@"Montaser.biomy@gmail.com" setPhone:@"01234857483" setAge:13]];
     [friends addObject:[[Friend alloc] setName:@"7anafi" setEmail:@"7anafi.elobaha@gmail.com" setPhone:@"01234566" setAge:46]];
    
    
 
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSUInteger numOfRows = 0 ;
    switch (section) {
        case 0:
            numOfRows = [males count];
            break;
            
        case 1:
            numOfRows = [females count];
            break;
    }
    return numOfRows;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    switch (indexPath.section) {
        case 0:
            cell.textLabel.text = [males objectAtIndex:indexPath.row];
            break;
            
        case 1:
            cell.textLabel.text = [females objectAtIndex:indexPath.row];
            break;
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row%2==0){
        return 90;
    }
    return 40;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSString* header = @"";
    switch(section){
        case 0:
            header = @"males";
            break;
        case 1 :
            header = @"females";
            break;
    }
    return header;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        switch(indexPath.section){
            case 0:
                [males removeObjectAtIndex:indexPath.row];
                break;
            case 1 :
                [females removeObjectAtIndex:indexPath.row];
                break;
        }
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}


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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
            printf("%d",indexPath.row);
            Friend* friend = [friends objectAtIndex:indexPath.row];
            [detailViewController displayFriend:friend];
            [self.navigationController pushViewController:detailViewController animated:YES];
            break;
    
            [detailViewController displayFriend:[friends objectAtIndex:indexPath.row+3]];
            [self.navigationController pushViewController:detailViewController animated:YES];
            break;
    }
    
}

@end
