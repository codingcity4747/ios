//
//  SecondViewController.h
//  NavigationController
//
//  Created by Ashraf on 3/7/20.
//  Copyright © 2020 Ashraf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClearTextDelegate.h"
NS_ASSUME_NONNULL_BEGIN

@interface SecondViewController : UIViewController
@property NSString* value;
@property (weak, nonatomic) IBOutlet UILabel *display;
@property id<ClearTextDelegate>clearTextDelegator;
@end

NS_ASSUME_NONNULL_END
