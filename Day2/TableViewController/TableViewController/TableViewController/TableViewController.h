//
//  TableViewController.h
//  TableViewController
//
//  Created by Ashraf on 3/7/20.
//  Copyright © 2020 Ashraf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Friend.h"
NS_ASSUME_NONNULL_BEGIN

@interface TableViewController : UITableViewController

@property NSMutableArray<Friend*> *males, *females;
@property NSMutableArray<Friend*> *friends;
@end

NS_ASSUME_NONNULL_END
