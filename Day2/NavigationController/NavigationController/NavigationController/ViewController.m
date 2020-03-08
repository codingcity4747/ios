//
//  ViewController.m
//  NavigationController
//
//  Created by Ashraf on 3/7/20.
//  Copyright © 2020 Ashraf. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)next:(id)sender {
    NSString* input = _textField.text;
    SecondViewController* second = [self.storyboard instantiateViewControllerWithIdentifier:@"second"];
    second.value = [@"Hello " stringByAppendingString:input];
    [self.navigationController pushViewController:second animated:YES];
}


@end
