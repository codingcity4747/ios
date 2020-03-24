//
//  AddTaskViewController.h
//  ToDoList
//
//  Created by Ashraf on 3/23/20.
//  Copyright © 2020 com.ashraf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Task.h"
#import "UserDefaultManager.h"
@interface AddTaskViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate,UIAlertViewDelegate>


@property UserDefaultManager *userDefaultManager;
- (IBAction)doneBtn:(id)sender;
-(void)editTask:(Task*)task position:(NSUInteger)position;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTextField;

@property (weak, nonatomic) IBOutlet UIPickerView *priority;
@property (weak, nonatomic) IBOutlet UIDatePicker *date;
@property (weak, nonatomic) IBOutlet UIPickerView *state;

@end

