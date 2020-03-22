//
//  ImageSelectionDelegate.h
//  LocationAndMap
//
//  Created by Ashraf on 3/22/20.
//  Copyright © 2020 Ashraf. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol ImageSelectionDelegate <NSObject>
-(void)setSelectedImageUrl:(NSString*)imgUrl;
@end

