//
//  ViewController.h
//  Networking
//
//  Created by JETS Mobile Lab on 3/11/20.
//  Copyright © 2020 ITI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <NSURLConnectionDelegate ,NSURLConnectionDataDelegate,UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *result;
- (IBAction)search:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *input;

@end

