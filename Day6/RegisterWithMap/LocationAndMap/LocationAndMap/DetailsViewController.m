//
//  DetailsViewController.m
//  LocationAndMap
//
//  Created by Ashraf on 3/22/20.
//  Copyright © 2020 Ashraf. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController{
    NSString* userName;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIAlertView *noPhoneAlert =[[UIAlertView alloc] initWithTitle:@"Welcome" message:[@"Welcome Back :" stringByAppendingString:userName] delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [noPhoneAlert show];
    // Do any additional setup after loading the view.
}


- (void)setUserName:(NSString *)_name setUserPhone:(NSString *)_phone setUserAge:(NSString *)_age setUserLocation:(NSString *)_location{
    printf("details %s",[_name UTF8String]);
    
    userName = _name;
    
}
- (IBAction)logout:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
