//
//  ViewController.m
//  CopingText
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
- (IBAction)copyText:(id)sender {
    NSString* text = [_textField text];
    [_textLabel setText:text];
    
}


@end
