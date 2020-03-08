//
//  ViewController.h
//  NavigationController
//
//  Created by Ashraf on 3/7/20.
//  Copyright © 2020 Ashraf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClearTextDelegate.h"
@interface ViewController : UIViewController <ClearTextDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;


@end

