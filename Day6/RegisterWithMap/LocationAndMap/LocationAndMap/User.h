//
//  User.h
//  LocationAndMap
//
//  Created by Ashraf on 3/22/20.
//  Copyright © 2020 Ashraf. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface User : NSObject

@property NSString* name;
@property NSString* phone;
@property NSString* age;
@property NSString* imgUrl;
@property float longitude;
@property float latitude;

-(id) setName:(NSString*)name
      setPhone:(NSString*)phone
      setAge:(NSString*)age
      setImage:(NSString*)image
      setLong:(float)lon
      setLat:(float)lat;
@end

NS_ASSUME_NONNULL_END
