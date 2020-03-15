//
//  SecondViewController.h
//  tableViewWithNetwork
//
//  Created by JETS Mobile Lab on 3/11/20.
//  Copyright © 2020 ITI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Friend.h"
NS_ASSUME_NONNULL_BEGIN

@interface SecondViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>

@property NSMutableArray<Friend*> *males, *females;
@property NSMutableArray<Friend*> *searchMales, *searchFemales;

@property NSMutableArray<Friend*> *friends;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *search;

@end

NS_ASSUME_NONNULL_END
