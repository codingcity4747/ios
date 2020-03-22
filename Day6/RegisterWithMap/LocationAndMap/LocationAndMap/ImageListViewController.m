//
//  ImageListViewController.m
//  LocationAndMap
//
//  Created by Ashraf on 3/22/20.
//  Copyright © 2020 Ashraf. All rights reserved.
//

#import "ImageListViewController.h"

@interface ImageListViewController ()

@end

@implementation ImageListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSUInteger numOfRows = 0 ;
    switch (section) {
        case 0:
            numOfRows = 3;
            break;
         
    }
    return numOfRows;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    UITableViewCell* cell =[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    
    switch (indexPath.section) {
        case 0:
            cell.imageView.image = [UIImage imageNamed:@"img.jpg"];
            break;
       
    }
    
    return cell;
}



- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSString* header = @"";
    switch(section){
        case 0:
            header = @"Images";
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



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:{
            NSString *imgUrl = @"https://picsum.photos/200/300";
            [_delegator setSelectedImageUrl:imgUrl];
            [self dismissViewControllerAnimated:YES completion:nil];
        }
            break;
       
    }
    
}

@end
