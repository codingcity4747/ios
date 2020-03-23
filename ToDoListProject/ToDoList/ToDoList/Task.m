//
//  Task.m
//  ToDoList
//
//  Created by Ashraf on 3/23/20.
//  Copyright © 2020 com.ashraf. All rights reserved.
//

#import "Task.h"

//constant keys for decoding and encoding

NSString* const  TITLE_KEY = @"title";
NSString* const  DESC_KEY = @"description";
NSString* const  TASK_KEY_KEY = @"key";
NSString* const  STATE_KEY = @"state";
NSString* const  PRIORITY_KEY = @"priority";
NSString* const  DATE_KEY = @"date";
//task state
NSString* const TODO = @"TODO";
NSString* const IN_PROGRESS = @"IN_PROGRESS";
NSString* const DONE = @"DONE";
//task priority
NSString* const HIGH = @"HIGH";
NSString* const MEDIUM = @"MEDIUM";
NSString* const LOW = @"LOW";
@implementation Task

@synthesize title,desc,key,taskDate,priority,state;


//initialize task
//behaviors
-(instancetype)initSetTitle:(NSString*)title setDesc:(NSString*)desc
                setState:(NSString*)state setPriority:(NSString*)priority
            setTaskDate:(NSString*)taskDate{
    self = [super init];
    if(self){
        self.title = title;
        self.desc = desc;
        self.state = state;
        self.priority = priority;
        self.taskDate = taskDate;
    }
    return self;
}
//initialize task with decoding
- (instancetype)initWithCoder:(NSCoder *)coder {
       if (self = [super init]) {
           self.title = [coder decodeObjectForKey:TITLE_KEY];
           self.desc = [coder decodeObjectForKey:DESC_KEY];
           
           self.key = [coder decodeObjectForKey:TASK_KEY_KEY];
           self.state = [coder decodeObjectForKey:STATE_KEY];
           
           self.priority = [coder decodeObjectForKey:PRIORITY_KEY];
           self.taskDate = [coder decodeObjectForKey:DATE_KEY];
        }
       return self;
}
//encode task to archive it to NSData to add it into UserDefauls
- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:title forKey:TITLE_KEY];
    [coder encodeObject:desc forKey:DESC_KEY];

    [coder encodeObject:key forKey:TASK_KEY_KEY];
    [coder encodeObject:state forKey:STATE_KEY];

    [coder encodeObject:priority forKey:PRIORITY_KEY];
    [coder encodeObject:taskDate forKey:DATE_KEY];
}


//toString function for debugging
-(void)toString{
    printf("title :%s\n  desc:%s\n key:%s\n state :%s\n  priority:%s\n date:%s\n",[title UTF8String],[desc UTF8String],[key UTF8String],[state UTF8String],[priority UTF8String],[taskDate UTF8String]);
}
@end
