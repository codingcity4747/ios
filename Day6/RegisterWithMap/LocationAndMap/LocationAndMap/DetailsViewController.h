//
//  DetailsViewController.h
//  LocationAndMap
//
//  Created by Ashraf on 3/22/20.
//  Copyright © 2020 Ashraf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailsDelegate.h"

@interface DetailsViewController : UIViewController<DetailsDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *phone;
@property (weak, nonatomic) IBOutlet UILabel *age;
@property (weak, nonatomic) IBOutlet UILabel *location;
- (IBAction)logout:(id)sender;
- (void)setUserName:(NSString *)name setUserPhone:(NSString *)phone setUserAge:(NSString *)age setUserLocation:(NSString *)location;
@end

