//
//  ViewController.h
//  tableViewWithNetwork
//
//  Created by JETS Mobile Lab on 3/11/20.
//  Copyright © 2020 ITI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <NSURLConnectionDataDelegate,NSURLConnectionDelegate,UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *phone;
- (IBAction)reg:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *status;

@end

