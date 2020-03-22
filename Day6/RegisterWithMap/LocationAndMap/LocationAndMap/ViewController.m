//
//  ViewController.m
//  LocationAndMap
//
//  Created by Ashraf on 3/22/20.
//  Copyright © 2020 Ashraf. All rights reserved.
//

#import "ViewController.h"
#import "PinAnnotation.h"
@interface ViewController ()

@end

@implementation ViewController{
    float lat ;
    float lon ;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _locationManager = [CLLocationManager new ];
    [_locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    [_locationManager setDistanceFilter:kCLDistanceFilterNone];
    _locationManager.delegate = self;
    [_locationManager startUpdatingLocation];
    [_locationManager location];
    [_locationManager requestAlwaysAuthorization];
    _myMap.delegate = self;
}
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    CLLocation *lastLocation = [locations lastObject];
    printf("lon:%f  lat:%f\n",lastLocation.coordinate.longitude,lastLocation.coordinate.latitude);
    [_myMap setCenterCoordinate:lastLocation.coordinate];
    lat = lastLocation.coordinate.latitude;
    lon = lastLocation.coordinate.longitude;
}



- (IBAction)send:(id)sender {
    CGPoint touchPoint = [sender locationInView:_myMap];
    CLLocationCoordinate2D touchCoordinate = [_myMap convertPoint:touchPoint toCoordinateFromView:_myMap];
    lon = touchCoordinate.longitude;
    lat = touchCoordinate.latitude;
    printf("selected %f  %f\n",lon,lat);
    PinAnnotation *pin = [PinAnnotation new];
    [pin setCoordinate:touchCoordinate];
    pin.title = @"MAD";
    pin.subtitle = @"iti";

    [_myMap removeAnnotations:[_myMap annotations]];
    [_myMap addAnnotation:pin];
    [_delegator setLongitude:lon setLatitude:lat];
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}
@end
