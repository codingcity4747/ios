//
//  displayDelegate.h
//  TableViewController
//
//  Created by Ashraf on 3/7/20.
//  Copyright © 2020 Ashraf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Friend.h"
NS_ASSUME_NONNULL_BEGIN

@protocol displayDelegate <NSObject>

-(void)displayFriend:(Friend*)friend;
@end

NS_ASSUME_NONNULL_END
