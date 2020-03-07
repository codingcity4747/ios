//
//  ViewController.m
//  Calculator
//
//  Created by Ashraf on 3/6/20.
//  Copyright © 2020 Ashraf. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize num1,num2,result;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)add:(id)sender {
    int firstNum = num1.text.intValue;
    int secondNum = num2.text.intValue;
    int output = firstNum + secondNum;
    NSString* outputText = [NSString stringWithFormat:@"%i",output];
    [result setText:outputText];
}
- (IBAction)sub:(id)sender {
    int firstNum = num1.text.intValue;
    int secondNum = num2.text.intValue;
    int output = firstNum - secondNum;
    NSString* outputText = [NSString stringWithFormat:@"%i",output];
    [result setText:outputText];
}
- (IBAction)divide:(id)sender {
    int firstNum = num1.text.intValue;
    int secondNum = num2.text.intValue;
    if(secondNum == 0){
        result.text=@"not Valid Divisor";
        return ;
    }
    int output = firstNum / secondNum;
    NSString* outputText = [NSString stringWithFormat:@"%i",output];
    [result setText:outputText];
}
- (IBAction)mult:(id)sender {
    int firstNum = num1.text.intValue;
    int secondNum = num2.text.intValue;
    int output = firstNum * secondNum;
    NSString* outputText = [NSString stringWithFormat:@"%i",output];
    [result setText:outputText];
}


@end
