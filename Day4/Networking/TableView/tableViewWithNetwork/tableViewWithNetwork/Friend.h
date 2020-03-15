//
//  Friend.h
//  tableViewWithNetwork
//
//  Created by JETS Mobile Lab on 3/11/20.
//  Copyright © 2020 ITI. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Friend : NSObject

@property NSString *name,*email,*phone,*address;
@property int age;

-(id)setName:(NSString*)name
    setEmail:(NSString*)email
    setPhone:(NSString*)phone
      setAge:(int)age;
@end

NS_ASSUME_NONNULL_END
