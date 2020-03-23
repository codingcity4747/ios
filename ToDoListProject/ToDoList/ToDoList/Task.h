/*Task properites
    title,
    description,
    priority,date,
    key,
    state [todo,inprogress,done]
 Task behavior
    decode
    encode
    toString 'for debugging purpos'
 */

#import <Foundation/Foundation.h>
//task state


@interface Task : NSObject <NSCoding,NSSecureCoding>

@property NSString *title ,
                    *desc  ,
                    *key   ,
                    *state ,
                    *priority,
                    *taskDate;
//behaviors
-(instancetype)initSetTitle:(NSString*)title setDesc:(NSString*)desc
                setState:(NSString*)state setPriority:(NSString*)priority
                setTaskDate:(NSString*)taskDate;
-(void)toString;
@end

