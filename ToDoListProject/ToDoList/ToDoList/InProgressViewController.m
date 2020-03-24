//
//  InProgressViewController.m
//  ToDoList
//
//  Created by Ashraf on 3/23/20.
//  Copyright © 2020 com.ashraf. All rights reserved.
//

#import "InProgressViewController.h"
@interface InProgressViewController ()

@end
//  NSString*  HIGH = @"High";
//  NSString*  MEDIUM = @"Medium";
//  NSString*  LOW = @"Low";
//  NSString*  TODO = @"ToDo";
//  NSString*  IN_PROGRESS = @"InProgress";
//  NSString*  DONE = @"Done";
@implementation InProgressViewController
@synthesize userDefaultManager,tasks,tableView,searchBar;
- (void)viewDidLoad {
    [super viewDidLoad];
    userDefaultManager = [UserDefaultManager sharedInstance];
    
    tasks = [userDefaultManager getAllTasksWithState:@"InProgress"];
    printf("%d",[UserDefaultManager getCounter]);
}

//Data source delegate methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return tasks.count;
}
- (void)viewDidAppear:(BOOL)animated{
    tasks = [userDefaultManager getAllTasksWithState:@"InProgress"];
    [tableView reloadData];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    Task* task =[tasks objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = task.title;
    if([task.priority isEqualToString:@"High"]){
        cell.detailTextLabel.textColor = [UIColor redColor];
    }else if([task.priority isEqualToString: @"Medium" ]){
        cell.detailTextLabel.textColor = [UIColor colorWithRed:(255/255.0) green:(209/255.0) blue:(55/255.0) alpha:1];;
    }else{
        cell.detailTextLabel.textColor = [UIColor colorNamed:UIColor.redColor];
        cell.detailTextLabel.textColor = [UIColor colorWithRed:(73/255.0) green:(223/255.0) blue:(83/255.0) alpha:1];;
    }
    cell.detailTextLabel.text = task.priority;
    return cell;
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    [tasks removeObjectAtIndex:indexPath.row];
    [userDefaultManager removeTask:indexPath.row];
    [self.tableView reloadData];
}


@end
