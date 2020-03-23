//
//  ViewController.m
//  ToDoList
//
//  Created by Ashraf on 3/23/20.
//  Copyright © 2020 com.ashraf. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end
NSString* const TODO_STATE = @"TODO";
@implementation ViewController
@synthesize userDefaultManager,tasks;
- (void)viewDidLoad {
    [super viewDidLoad];
    userDefaultManager = [UserDefaultManager sharedInstance];
    Task *task1 = [[Task alloc] initSetTitle:@"Finish todoProject" setDesc:@"desc" setState:@"TODO" setPriority:@"HIGH" setTaskDate:@"23-3-2020"];
    [userDefaultManager addTask:task1];
    
    tasks = [userDefaultManager getAllTasksWithState:TODO_STATE];
    printf("%d",[UserDefaultManager getCounter]);
}

//Data source delegate methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return tasks.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = [tasks objectAtIndex:indexPath.row].title;
    return cell;
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    [tasks removeObjectAtIndex:indexPath.row];
    [userDefaultManager removeTask:indexPath.row];
    [tableView reloadData];
}

- (IBAction)addBtn:(id)sender {
    AddTaskViewController* addTaskVC =[self.storyboard instantiateViewControllerWithIdentifier:@"addTask"];
    [self presentViewController:addTaskVC animated:YES completion:nil];
}
@end
