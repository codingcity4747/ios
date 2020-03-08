//
//  DetailViewController.h
//  TableViewController
//
//  Created by Ashraf on 3/7/20.
//  Copyright © 2020 Ashraf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "displayDelegate.h"
NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : UIViewController <displayDelegate>
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *email;
@property (weak, nonatomic) IBOutlet UILabel *phone;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UILabel *age;
-(void)displayFriend:(Friend *)friend;
@end

NS_ASSUME_NONNULL_END
