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
   NSString*  HIGH = @"High";
   NSString*  MEDIUM = @"Medium";
   NSString*  LOW = @"Low";
   NSString*  TODO = @"ToDo";
   NSString*  IN_PROGRESS = @"InProgress";
   NSString*  DONE = @"Done";
@implementation ViewController{
    AddTaskViewController* addTaskVC;
}
@synthesize userDefaultManager,tasks,tableView;
- (void)viewDidLoad {
    [super viewDidLoad];
    userDefaultManager = [UserDefaultManager sharedInstance];
    
    tasks = [userDefaultManager getAllTasksWithState:TODO];
    printf("%d",[UserDefaultManager getCounter]);
}

//Data source delegate methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return tasks.count;
}
- (void)viewDidAppear:(BOOL)animated{
    tasks = [userDefaultManager getAllTasksWithState:@"ToDo"];
    printf("viewDidAppear %d",[tasks count]);
    [tableView reloadData];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    Task* task =[tasks objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = task.title;
    if([task.priority isEqualToString:HIGH]){
        cell.detailTextLabel.textColor = [UIColor redColor];
    }else if([task.priority isEqualToString: MEDIUM ]){
        cell.detailTextLabel.textColor = [UIColor colorWithRed:(255/255.0) green:(209/255.0) blue:(55/255.0) alpha:1];;
    }else{
        cell.detailTextLabel.textColor = [UIColor colorNamed:UIColor.redColor];
        cell.detailTextLabel.textColor = [UIColor colorWithRed:(73/255.0) green:(223/255.0) blue:(83/255.0) alpha:1];;
    }
    cell.detailTextLabel.text = task.priority;
    return cell;
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    

}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)
tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
        UITableViewRowAction *doneAction =[UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal
                                                                              title:@"Done"
                                                                            handler:^(UITableViewRowAction
                                                                                      *action, NSIndexPath *indexPath){
            Task *doneTask = [tasks objectAtIndex:indexPath.row];
            doneTask.state = @"Done";
            [tasks removeObjectAtIndex:indexPath.row];
            [userDefaultManager updateTask:doneTask withPosition:indexPath.row];
            [self.tableView reloadData];
    }];
    doneAction.backgroundColor = [UIColor systemBlueColor];

    UITableViewRowAction *editAction =[UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal
                                                                              title:@"Edit"
                                                                            handler:^(UITableViewRowAction
                                                                                      *action, NSIndexPath *_indexPath){
            Task *editTask = [tasks objectAtIndex:indexPath.row];
        printf("edit action");
        [editTask toString];
        [addTaskVC editTask:editTask position:indexPath.row];
        printf("row %d",indexPath.row);
        [self.navigationController pushViewController:addTaskVC animated:YES];

    }];
    editAction.backgroundColor = [UIColor systemGreenColor];

    return @[doneAction,editAction];
}


- (IBAction)addBtn:(id)sender {
    addTaskVC =[self.storyboard instantiateViewControllerWithIdentifier:@"addTask"];
       //[addTaskVC setModalPresentationStyle:UIModalPresentationFullScreen];
    [self.navigationController pushViewController:addTaskVC animated:YES];
}
@end
