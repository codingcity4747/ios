//
//  Friend.h
//  TableViewController
//
//  Created by Ashraf on 3/7/20.
//  Copyright © 2020 Ashraf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Friend : NSObject

@property NSString *name,*email,*phone,*address;
@property int age;

-(id)setName:(NSString*)name
     setEmail:(NSString*)email
     setPhone:(NSString*)phone
     setAge:(int)age;
@end
