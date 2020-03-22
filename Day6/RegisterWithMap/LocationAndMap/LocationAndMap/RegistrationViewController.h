//
//  RegistrationViewController.h
//  LocationAndMap
//
//  Created by Ashraf on 3/22/20.
//  Copyright © 2020 Ashraf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageSelectionDelegate.h"
#import "LocationSelectionDelegate.h"


@interface RegistrationViewController : UIViewController<ImageSelectionDelegate,LocationSelectionDelegate ,NSURLConnectionDelegate>
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *phone;
@property (weak, nonatomic) IBOutlet UITextField *age;
- (IBAction)selectImage:(id)sender;
- (IBAction)selectLocation:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *state;
- (IBAction)done:(id)sender;

@end

