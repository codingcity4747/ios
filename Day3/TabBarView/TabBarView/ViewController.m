//
//  ViewController.m
//  TabBarView
//
//  Created by JETS Mobile Lab on 3/8/20.
//  Copyright © 2020 ITI. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UISwipeGestureRecognizer *rec =[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(next)];
    rec.direction=UISwipeGestureRecognizerDirectionLeft;
                   
    [self.view addGestureRecognizer:rec];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)next{
    self.tabBarController.selectedViewController = [self.tabBarController.viewControllers objectAtIndex:1];    
}


@end
