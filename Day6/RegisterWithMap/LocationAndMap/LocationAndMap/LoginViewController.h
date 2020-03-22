//
//  LoginViewController.h
//  LocationAndMap
//
//  Created by Ashraf on 3/22/20.
//  Copyright © 2020 Ashraf. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *phone;
- (IBAction)login:(id)sender;

@end
