//
//  ViewController.m
//  NavigationCotroller
//
//  Created by Ashraf on 3/7/20.
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

- (IBAction)nextView:(id)sender {
    SecondViewCotroller* second = [self.storyboard instantiateViewControllerWithIdentifier:@"secondViewId"];
    
    [self.navigationController pushViewController:second animated:NO];
}

@end
