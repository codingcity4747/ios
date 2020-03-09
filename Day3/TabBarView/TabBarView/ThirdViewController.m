//
//  ThirdViewController.m
//  TabBarView
//
//  Created by JETS Mobile Lab on 3/8/20.
//  Copyright © 2020 ITI. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UISwipeGestureRecognizer *left = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(pre)];

    left.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:left];
    // Do any additional setup after loading the view.
}

-(void)pre{
    [self dismissViewControllerAnimated:YES completion:^(void){
        printf("dismiss view three");
    }];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)loadThirdView:(id)sender {
}
@end
