//
//  UserDefaultManager.m
//  ToDoList
//
//  Created by Ashraf on 3/23/20.
//  Copyright © 2020 com.ashraf. All rights reserved.
//

#import "UserDefaultManager.h"
NSString* const TASKS_ARRAY_KEY = @"Tasks";
@implementation UserDefaultManager
@synthesize userDefault,tasksDataArray;

+ (UserDefaultManager *)sharedInstance {
    static UserDefaultManager *sharedInstance = nil;
    static dispatch_once_t onceToken; // onceToken = 0
    dispatch_once(&onceToken, ^{
        sharedInstance = [[UserDefaultManager alloc] initUserDefaultsManager];
    });
     return sharedInstance;
}
+(int)getCounter{
    return counter;
}
-(instancetype)initUserDefaultsManager{
    counter++;
    self = [super init];
    if(self){
        if(tasksDataArray == nil){
            tasksDataArray = [NSMutableArray arrayWithCapacity:10];
        }
        if(userDefault == nil){
            userDefault = [NSUserDefaults standardUserDefaults];
            [userDefault setObject:tasksDataArray forKey:TASKS_ARRAY_KEY];
        }
        
        
    }
    return self;
}


-(void)addTask:(Task*)task{
    
    NSData *taskData = [self convertTaskToData:task];
    
    NSMutableArray<NSData*> *tempTaskArray = [[userDefault objectForKey:TASKS_ARRAY_KEY ]mutableCopy];
    
    [tempTaskArray addObject:taskData];
   //printf("%s %d",task.title , [tempTaskArray count]);
    //[userDefault removeObjectForKey:TASKS_ARRAY_KEY];
    [userDefault setObject:tempTaskArray forKey:TASKS_ARRAY_KEY];
    //[userDefault synchronize];
}
-(void)removeTask:(NSUInteger)position{
    NSMutableArray<NSData*>*tempTaskArray = [[userDefault objectForKey:TASKS_ARRAY_KEY] mutableCopy];
    [tempTaskArray removeObjectAtIndex:position];
    //[userDefault removeObjectForKey:TASKS_ARRAY_KEY];
    [userDefault setObject:tempTaskArray forKey:TASKS_ARRAY_KEY];
    //[userDefault synchronize];
}
-(void)updateTask:(Task*)newTask withPosition:(NSUInteger)position{
    NSMutableArray<NSData*>*tempTaskArray = [[userDefault objectForKey:TASKS_ARRAY_KEY] mutableCopy];
    NSData* taskAsData = [self convertTaskToData:newTask];
    [tempTaskArray replaceObjectAtIndex:position withObject:taskAsData];
    [userDefault removeObjectForKey:TASKS_ARRAY_KEY];
    [userDefault setObject:tempTaskArray forKey:TASKS_ARRAY_KEY];
    //[userDefault synchronize];
}

-(NSMutableArray<Task*>*)getAllTasks{
    NSMutableArray<NSData*>*tasksDataArr = [userDefault objectForKey:TASKS_ARRAY_KEY];
    NSMutableArray<Task*>*tasksObjectArr = [NSMutableArray arrayWithCapacity:[tasksDataArr count]];
    
    for(int i = 0 ;i<[tasksDataArr count];i++){
        Task* tempTask = [self convertDataToTask:[tasksDataArr objectAtIndex:i]];
        [tasksObjectArr addObject:tempTask];
    }
    return tasksObjectArr;
}

-(NSMutableArray<Task*>*)getAllTasksWithState:(NSString*)state{
    NSMutableArray<NSData*>*tasksDataArr = [userDefault objectForKey:TASKS_ARRAY_KEY];
    NSMutableArray<Task*>*tasksObjectArr = [NSMutableArray arrayWithCapacity:[tasksDataArr count]];
    
    for(int i = 0 ;i<[tasksDataArr count];i++){
        Task* tempTask = [self convertDataToTask:[tasksDataArr objectAtIndex:i]];
        if([tempTask.state isEqualToString:state]){
            [tasksObjectArr addObject:tempTask];
        }
    }
    return tasksObjectArr;
}

//helper method to convert task to NSData
-(NSData *)convertTaskToData:(Task*)task{
    NSData *taskData = [NSKeyedArchiver archivedDataWithRootObject:task requiringSecureCoding:NO error:nil];
    return taskData;
}


//helper method to convert NSData to task
-(Task *)convertDataToTask:(NSData*)data{
    Task *task = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    return task;
}
@end
