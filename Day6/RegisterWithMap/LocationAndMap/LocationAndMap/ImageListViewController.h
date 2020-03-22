//
//  ImageListViewController.h
//  LocationAndMap
//
//  Created by Ashraf on 3/22/20.
//  Copyright © 2020 Ashraf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RegistrationViewController.h"

@interface ImageListViewController : UITableViewController
@property RegistrationViewController *delegator;
-(void)setDelegate:(RegistrationViewController*)delegate;
@end

