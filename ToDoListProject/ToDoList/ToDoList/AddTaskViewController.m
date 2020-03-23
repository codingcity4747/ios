//
//  AddTaskViewController.m
//  ToDoList
//
//  Created by Ashraf on 3/23/20.
//  Copyright © 2020 com.ashraf. All rights reserved.
//

#import "AddTaskViewController.h"
//task state
NSString* const TODO = @"ToDo";
NSString* const IN_PROGRESS = @"InProgress";
NSString* const DONE = @"Done";
//task priority
NSString* const HIGH = @"High";
NSString* const MEDIUM = @"Medium";
NSString* const LOW = @"Low";
@interface AddTaskViewController ()

@end

@implementation AddTaskViewController
@synthesize title,description,priority,state,date;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}




// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return 3;
}


- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component API_UNAVAILABLE(tvos){
    NSString *rowLabel = @"";
    //tag 1 for priority pickerView  tag 2 for state Pickerview
    if(pickerView.tag == 1){
        switch(row){
            case 0:
                rowLabel = HIGH;
                break;
            case 1 :
                rowLabel = MEDIUM;
                break;
            case 2 :
                rowLabel = LOW;
                break;
        }
    }else{
        
    }
    
}
- (nullable NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component API_AVAILABLE(ios(6.0)) API_UNAVAILABLE(tvos){
    
} // attributed title is favored if both methods are implemented
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view API_UNAVAILABLE(tvos){
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component API_UNAVAILABLE(tvos){
    
}

- (IBAction)doneBtn:(id)sender {
}
@end
