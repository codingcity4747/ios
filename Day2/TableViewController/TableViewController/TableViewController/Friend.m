//
//  Friend.m
//  TableViewController
//
//  Created by Ashraf on 3/7/20.
//  Copyright © 2020 Ashraf. All rights reserved.
//

#import "Friend.h"

@implementation Friend
@synthesize name,email,phone,address,age;

-(id)setName:(NSString*)name setEmail:(NSString*)email setPhone:(NSString*)phone
      setAge:(int)age{
    
    self.name= name;
    self.email = email;
    self.address = address;
    self.phone = phone;
    self.age = age;
    
    return self;
}
@end
