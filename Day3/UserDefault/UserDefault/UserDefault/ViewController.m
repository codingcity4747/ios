//
//  ViewController.m
//  UserDefault
//
//  Created by JETS Mobile Lab on 3/8/20.
//  Copyright © 2020 ITI. All rights reserved.
//

#import "ViewController.h"
#import "WelcomeViewController.h"
const NSString *usernamekey =@"user";
const NSString *passwordKey =@"password";
@interface ViewController ()

@end

static NSUserDefaults *defaults;
@implementation ViewController
@synthesize userName,password;
+ (void)initialize
{
    defaults = [NSUserDefaults standardUserDefaults];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)login:(id)sender {
    NSString *userNameInput = userName.text;
    NSString *passwordInput = password.text;
    NSString *userNameSaved = [defaults objectForKey:usernamekey];
    NSString *passwordSaved = [defaults objectForKey:passwordKey];
    printf("input :name :%s  password: %s",[userNameInput UTF8String],[passwordInput UTF8String]);
    printf("saved :name :%s  password: %s",[userNameSaved UTF8String],[passwordSaved UTF8String]);

    if([userNameInput isEqualToString:userNameSaved] && [passwordInput isEqualToString:passwordSaved]){
        WelcomeViewController *welcome =[self.storyboard instantiateViewControllerWithIdentifier:@"welcome"];
        [self.navigationController pushViewController:welcome animated:YES];
    }else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Wrong Input" message:@"Check your input" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
    }
    
}

- (IBAction)reg:(id)sender {
    NSString *userNameInput = userName.text;
    NSString *passwordInput = password.text;
    printf("name :%s  password: %s",[userNameInput UTF8String],[passwordInput UTF8String]);
    if([userNameInput isEqualToString:@""] || [passwordInput isEqualToString:@""]){
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Wrong Login" message:@"Check your password and Email" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
    }else{
        [defaults setObject:userNameInput forKey:usernamekey];
        [defaults setObject:passwordInput forKey:passwordKey];
        NSString *userNameSaved = [defaults objectForKey:usernamekey];
        NSString *passwordSaved = [defaults objectForKey:passwordKey];
        printf("name :%s  password: %s",[userNameSaved UTF8String],[passwordSaved UTF8String]);

        
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    printf("OK");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

@end
