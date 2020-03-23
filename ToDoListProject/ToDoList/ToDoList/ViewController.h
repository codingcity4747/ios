//
//  ViewController.h
//  ToDoList
//
//  Created by Ashraf on 3/23/20.
//  Copyright © 2020 com.ashraf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserDefaultManager.h"
#import "AddTaskViewController.h"
@interface ViewController : UIViewController
<UITableViewDelegate,UITableViewDataSource>
@property UserDefaultManager* userDefaultManager;
@property NSMutableArray<Task*> *tasks;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)addBtn:(id)sender;

@end

