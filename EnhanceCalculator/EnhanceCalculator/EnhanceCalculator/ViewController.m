//
//  ViewController.m
//  EnhanceCalculator
//
//  Created by JETS Mobile Lab on 3/8/20.
//  Copyright © 2020 ITI. All rights reserved.
//

#import "ViewController.h"
static const int ADD = 10;
static const int SUBB = 20;
static const int MUL = 30;
static const int DIV = 40;
static const int EQUAL = 50;
static float val1 ;
static float val2 ;
static NSString *strVal1;
static NSString *strVal2;
@interface ViewController ()

@end

@implementation ViewController

@synthesize input;
- (void)viewDidLoad {
    [super viewDidLoad];
    strVal1 =[NSString new];
    val1 = 0 ;
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)btn:(id)sender {
    switch ([sender tag]) {
        case 1:
            [strVal1 stringByAppendingString:@"1"];
            NSLog(@"%d",[strVal1 floatValue]);
            input.text = @"1";
            break;
        case 2:
            [strVal1 stringByAppendingString:@"2"];
            input.text =strVal1;
            break;
        case 3:
            [strVal1 stringByAppendingString:@"3"];
            input.text =strVal1;

            break;
        case 4:
            [strVal1 stringByAppendingString:@"4"];
            input.text =strVal1;

            break;
        case 5:
            [strVal1 stringByAppendingString:@"5"];
            input.text =strVal1;


            break;
        case 6:
            [strVal1 stringByAppendingString:@"6"];
            input.text =strVal1;


            break;
        case 7:
            [strVal1 stringByAppendingString:@"7"];
            input.text =strVal1;


            break;
        case 8:
            [strVal1 stringByAppendingString:@"8"];
            input.text =strVal1;


            break;
        case 9:
            [strVal1 stringByAppendingString:@"9"];
            input.text =strVal1;


            break;
        case 0:
            [strVal1 stringByAppendingString:@"0"];
            input.text =strVal1;
        case ADD:
            val1 += [strVal1 floatValue];
            input.text =@"";
            strVal1 = @"";
            break;
        case SUBB:
            val1 -= [strVal1 floatValue];
            input.text =@"";
            strVal1 = @"";
            break;
        case MUL:
            val1 *= [strVal1 floatValue];
            input.text =@"";
            strVal1 = @"";
            break;
        case DIV:
            val1 /= [strVal1 floatValue];
            input.text =@"";
            strVal1 = @"";
            break;
        case EQUAL:
            val1 += [strVal1 floatValue];
            input.text = [NSString stringWithFormat:@"%f", val1];
            val1 = 0;
            strVal1 = @"";
            break;
        default:
            break;
    }
}
@end
