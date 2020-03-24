/*UserDefaultManager class aimed to manage adding, removing,updating
  and getting Tasks for views to render
  @reson: to deattached the storaging logic from view logic
 */

#import <Foundation/Foundation.h>
#import "Task.h"
static int counter;
@interface UserDefaultManager : NSObject
@property NSUserDefaults *userDefault;
@property NSMutableArray<NSData*>*tasksDataArray;
@property (strong,nonatomic) UserDefaultManager *instance;


+ (UserDefaultManager *)sharedInstance ;
-(id)initUserDefaultsManager;
-(void)addTask:(Task*)task;
-(void)removeTask:(NSUInteger)position;
-(void)updateTask:(Task*)newTask withPosition:(NSUInteger)position;
-(NSMutableArray<Task*>*)getAllTasks;
-(NSData *)convertTaskToData:(Task*)task;
-(Task *)convertDataToTask:(NSData*)data;
-(NSMutableArray<Task*>*)getAllTasksWithState:(NSString*)state;
+(int)getCounter;
@end

