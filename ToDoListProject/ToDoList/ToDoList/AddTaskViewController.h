//
//  AddTaskViewController.h
//  ToDoList
//
//  Created by Ashraf on 3/23/20.
//  Copyright © 2020 com.ashraf. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AddTaskViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate>
- (IBAction)doneBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *titleTextFiedl;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTextFiedl;

@property (weak, nonatomic) IBOutlet UIPickerView *priority;
@property (weak, nonatomic) IBOutlet UIDatePicker *date;
@property (weak, nonatomic) IBOutlet UIPickerView *state;

@end

