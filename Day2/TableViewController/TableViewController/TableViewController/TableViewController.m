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
    [males addObject:[[Friend alloc] setName:@"Ashraf" setEmail:@"Ashraf.mohamed4728@gmail.com" setPhone:@"0123456778" setAge:24]];
    [males addObject:[[Friend alloc] setName:@"Ahmed" setEmail:@"Ahmed.Mohsen@gmail.com" setPhone:@"0123875847"setAge:35]];
    [males addObject:[[Friend alloc] setName:@"Mohamed" setEmail:@"Mohamed.Ibrahim@gmail.com" setPhone:@"0193847483" setAge:20]];

    females =[NSMutableArray arrayWithCapacity:3];
    [females addObject:[[Friend alloc] setName:@"Ali" setEmail:@"ALi.eslam@gmail.com" setPhone:@"0123485843" setAge:45]];
    [females addObject:[[Friend alloc] setName:@"Montaser" setEmail:@"Montaser.biomy@gmail.com" setPhone:@"01234857483" setAge:13]];
    [females addObject:[[Friend alloc] setName:@"7anafi" setEmail:@"7anafi.elobaha@gmail.com" setPhone:@"01234566" setAge:46]];
    
   
    
 
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
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    UITableViewCell* cell =[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    
    switch (indexPath.section) {
        case 0:
            cell.textLabel.text = [males objectAtIndex:indexPath.row].name;
            [cell.imageView setImage:[UIImage imageNamed:@"img.png"]];
            break;
            
        case 1:
            cell.textLabel.text = [females objectAtIndex:indexPath.row].name;
            
            [cell.imageView setImage:[UIImage imageNamed:@"img.png"]];
            break;
    }
    
    return cell;
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
                [friends removeObjectAtIndex:indexPath.row];
                break;
            case 1 :
                [females removeObjectAtIndex:indexPath.row];
                [friends removeObjectAtIndex:indexPath.row+[friends count]/2];

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
        case 0:{
            Friend* friend = [males objectAtIndex:indexPath.row];
            [detailViewController displayFriend:friend];
        [self.navigationController pushViewController:detailViewController animated:YES];}
            break;
        case 1:{
            Friend* friend = [females objectAtIndex:indexPath.row];
            [detailViewController displayFriend:friend];
            [self.navigationController pushViewController:detailViewController animated:YES];}
            break;
    }
    
}

@end
