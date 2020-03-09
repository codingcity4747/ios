//
//  SecondViewController.m
//  TabBarView
//
//  Created by JETS Mobile Lab on 3/8/20.
//  Copyright © 2020 ITI. All rights reserved.
//

#import "SecondViewController.h"
#import "ThirdViewController.h"
@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UISwipeGestureRecognizer *right = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(previous)];
    right.direction=UISwipeGestureRecognizerDirectionRight;
    
    UISwipeGestureRecognizer *left = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(next)];
    left.direction=UISwipeGestureRecognizerDirectionRight;
    
    [self.view addGestureRecognizer:right];
    // Do any additional setup after loading the view.
}

-(void)previous{
    self.tabBarController.selectedViewController = [self.tabBarController.viewControllers objectAtIndex:0];
}

-(void)next{
    ThirdViewController *third = [self.storyboard instantiateViewControllerWithIdentifier:@"third"];
    [self presentViewController:third animated:YES completion:nil];
}

- (IBAction)loadThird:(id)sender {
    ThirdViewController *third = [self.storyboard instantiateViewControllerWithIdentifier:@"third"];
    [third setModalPresentationStyle:UIModalPresentationFullScreen];
    [self presentViewController:third animated:YES completion:nil];
}
@end
