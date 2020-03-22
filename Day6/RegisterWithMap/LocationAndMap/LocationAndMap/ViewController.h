//
//  ViewController.h
//  LocationAndMap
//
//  Created by Ashraf on 3/22/20.
//  Copyright © 2020 Ashraf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "RegistrationViewController.h"
@interface ViewController : UIViewController<MKMapViewDelegate,CLLocationManagerDelegate>
@property ( nonatomic) IBOutlet MKMapView *myMap;
@property CLLocationManager* locationManager;
@property RegistrationViewController *delegator;
-(void)setDelegate:(RegistrationViewController*)delegate;
- (IBAction)send:(id)sender;

@end

