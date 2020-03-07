//
//  ViewController.m
//  HelloWorld
//
//  Created by Ashraf on 3/6/20.
//  Copyright © 2020 Ashraf. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view.
}

- (IBAction)sayHello:(id)sender {
    [_myLabel setText:@"Hello"];
}

@end
