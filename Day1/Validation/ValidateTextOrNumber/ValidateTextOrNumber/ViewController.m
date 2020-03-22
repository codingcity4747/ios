//
//  ViewController.m
//  ValidateTextOrNumber
//
//  Created by Ashraf on 3/6/20.
//  Copyright © 2020 Ashraf. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize label,textField;
- (void)viewDidLoad {
    [super viewDidLoad];
    label.adjustsFontSizeToFitWidth=true;
    // Do any additional setup after loading the view.
}
- (IBAction)validate:(id)sender {
    NSString* text =[[textField text] lowercaseString];
    NSUInteger len = text.length;
    int numCounter =  0;
    int charCounter = 0;
    int symbolCounter =  0;
    for(int i = 0 ;i<len ;i++){
        char ch = [text characterAtIndex:i];
        if(ch<='9' && ch>='1'){
            numCounter++;
        }else if (ch >='a'&&ch<='z'){
            charCounter++;
        }else{
            symbolCounter++;
        }
    }
    if(numCounter == len){
        label.text = @"Input is Number";
    }else if (charCounter == len){
        label.text =@"Input is Character";
    }else if(symbolCounter == len){
        label.text  =@"Input is Symbol";
    }else {
        
        if(numCounter>0){
            label.text = @"Input Consist Of Numbers";
        }
        if(charCounter>0){
            label.text = @"Input Consist Of Numbers and Characters";
        }
        if(symbolCounter>0){
            label.text = @"Input Consist Of Numbers, Characters And Symbels";
        }
        
    }
}


@end
