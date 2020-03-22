//
//  LocationSelectionDelegate.h
//  LocationAndMap
//
//  Created by Ashraf on 3/22/20.
//  Copyright © 2020 Ashraf. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol LocationSelectionDelegate <NSObject>
-(void)setLongitude:(float)lan setLatitude:(float)lon;
@end

