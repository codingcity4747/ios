//
//  SecondViewController.m
//  tableViewWithNetwork
//
//  Created by JETS Mobile Lab on 3/11/20.
//  Copyright © 2020 ITI. All rights reserved.
//

#import "SecondViewController.h"
@interface SecondViewController ()

@end

@implementation SecondViewController{
    Boolean isFiltered;
}
@synthesize males,females,friends,tableView,searchMales,searchFemales;
- (void)viewDidLoad {
    [super viewDidLoad];
    isFiltered = NO;
    males =[NSMutableArray arrayWithCapacity:3];
    [males addObject:[[Friend alloc] setName:@"Ashraf" setEmail:@"Ashraf.mohamed4728@gmail.com" setPhone:@"0123456778" setAge:24]];
    [males addObject:[[Friend alloc] setName:@"Ahmed" setEmail:@"Ahmed.Mohsen@gmail.com" setPhone:@"0123875847"setAge:35]];
    [males addObject:[[Friend alloc] setName:@"Mohamed" setEmail:@"Mohamed.Ibrahim@gmail.com" setPhone:@"0193847483" setAge:20]];
    
    females =[NSMutableArray arrayWithCapacity:3];
    [females addObject:[[Friend alloc] setName:@"Ali" setEmail:@"ALi.eslam@gmail.com" setPhone:@"0123485843" setAge:45]];
    [females addObject:[[Friend alloc] setName:@"Montaser" setEmail:@"Montaser.biomy@gmail.com" setPhone:@"01234857483" setAge:13]];
    [females addObject:[[Friend alloc] setName:@"7anafi" setEmail:@"7anafi.elobaha@gmail.com" setPhone:@"01234566" setAge:46]];
    searchMales =males;

    searchFemales =females;

}


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


- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    printf("%s",[searchText UTF8String]);
    if([searchText length] == 0){
        searchMales = males;
        searchFemales = females;
        [self.tableView reloadData];
        printf("empty %s",[searchText UTF8String]);
        printf("searchMales size %d",[searchMales count]);
        
        printf("searchFemales size %d",[searchFemales count]);

    }else{
        for(int i = 0 ;i<[males count];i++){
            Friend *temp =[males objectAtIndex:i];
            if([temp.name isEqualToString:searchText]){
                [searchMales removeAllObjects];
                [searchMales addObject:temp];
                [self.tableView reloadData];
                break;
            }
        }
        
        for(int i = 0 ;i<[females count];i++){
            Friend *temp =[females objectAtIndex:i];
            if([temp.name isEqualToString:searchText]){
                if([searchFemales count]>0){
                    [searchFemales removeAllObjects];
                }
                [searchFemales addObject:temp];
                [self.tableView reloadData];
                break;
            }
        }
    }
    
}






@end
