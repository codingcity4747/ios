//
//  DetailsDelegate.h
//  LocationAndMap
//
//  Created by Ashraf on 3/22/20.
//  Copyright © 2020 Ashraf. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol DetailsDelegate <NSObject>
-(void)setUserName:(NSString*)name
    setUserPhone:(NSString*)phone
    setUserAge:(NSString*)age
    setUserLocation:(NSString*)location;
@end

NS_ASSUME_NONNULL_END
