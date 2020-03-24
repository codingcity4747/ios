//
//  AddTaskViewController.m
//  ToDoList
//
//  Created by Ashraf on 3/23/20.
//  Copyright © 2020 com.ashraf. All rights reserved.
//

#import "AddTaskViewController.h"
//task state

@interface AddTaskViewController ()

@end
//   NSString*  _HIGH = @"High";
//   NSString*  _MEDIUM = @"Medium";
//   NSString*  _LOW = @"Low";
//   NSString*  TODO = @"ToDo";
//   NSString*  IN_PROGRESS = @"InProgress";
//   NSString*  DONE = @"Done";
@implementation AddTaskViewController{
   
    NSString* selectedPriority,*selectedState;
    BOOL isEditied;
    NSUInteger editTaskPosition;
}
@synthesize titleTextField,descriptionTextField,priority,state,date ,userDefaultManager;
- (void)viewDidLoad {
    [super viewDidLoad];
    isEditied = NO;
    userDefaultManager =[UserDefaultManager sharedInstance];
    selectedState = @"ToDo";
    selectedPriority = @"Medium";
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
                rowLabel = @"Medium";
                break;
            case 1 :
                rowLabel = @"Low";
                break;
            case 2 :
                rowLabel = @"High";
                break;
        }
    }else{
        switch(row){
            case 0:
                rowLabel = @"ToDo";
                break;
            case 1 :
                rowLabel = @"InProgress";
                break;
            case 2 :
                rowLabel = @"Done";
                break;
        }
    }
    
    return rowLabel;
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component API_UNAVAILABLE(tvos){
    if(pickerView.tag ==1){
    switch(row){
            case 0:
                selectedPriority = @"Medium";
                break;
            case 1 :
            selectedPriority = @"Low";
                break;
            case 2 :
                selectedPriority = @"High";
                break;
        }
    }else{
        switch(row){
            case 0:
                selectedState = @"ToDo";
                break;
            case 1 :
                selectedState = @"InProgress";
                break;
            case 2 :
                selectedState = @"Done";
                break;
        }
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex == 0){
        [self.navigationController popViewControllerAnimated:YES];
    }
}
-(void)editTask:(Task*)task position:(NSUInteger)position{
    editTaskPosition = position;
    printf("from edit \n");
    [task toString];
    titleTextField.text = task.title;
    descriptionTextField.text=task.desc;
    NSInteger *stateIndecator = [self getStateIndegator:task];
    [state selectRow:stateIndecator inComponent:0 animated:YES];
    NSInteger *priorityIndecator = [self getPriorityIndegator:task];
    [state selectRow:priorityIndecator inComponent:0 animated:YES];
    isEditied = YES;
}
-(NSInteger)getStateIndegator:(Task*)task{
    NSString* state = task.state;
    if([state isEqualToString:@"ToDo"]){
        return 0;
    }else if([state isEqualToString:@"InProgress"]){
        return 1;
    }else{
        return 2;
    }
}
-(NSInteger)getPriorityIndegator:(Task*)task{
    NSString* priority = task.priority;
    if([priority isEqualToString:@"High"]){
        return 2;
    }else if([priority isEqualToString:@"Low"]){
        return 1;
    }else{
        return 0;
    }
}

-(BOOL)checkInput{
    NSString *title = self.titleTextField.text;
    NSString *desc = self.descriptionTextField.text;
    NSString *priority = selectedPriority;
    NSString *state = selectedState;
    NSString *date = self.date.date.description ;
    
    if([title isEqualToString:@""] ||[desc isEqualToString:@""]||[priority isEqualToString:@""]||[state isEqualToString:@""]|[date isEqualToString:@""]){
        return false;
    }
    
    Task *newTask = [[Task alloc] initSetTitle:title setDesc:desc setState:state setPriority:priority setTaskDate:date];
    [newTask toString];
    if(isEditied){
        printf("@@@ isEditied @@@");
        //[userDefaultManager updateTask:newTask withPosition:editTaskPosition];
        return YES;
    }else{
        [userDefaultManager addTask:newTask];
        return YES;
    }
}
- (IBAction)doneBtn:(id)sender {
    isEditied = NO;
    BOOL isTaskAdded = [self checkInput];
       if(isTaskAdded){
           [self.navigationController popViewControllerAnimated:YES];
       }else{
           UIAlertView *wrongInputAlert = [[UIAlertView alloc] initWithTitle:@"Wait.." message:@"I think you forgot to type an important Information" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
           [wrongInputAlert show];
       }
}
@end
