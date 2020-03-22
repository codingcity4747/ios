//
//  RegistrationViewController.m
//  LocationAndMap
//
//  Created by Ashraf on 3/22/20.
//  Copyright © 2020 Ashraf. All rights reserved.
//

#import "RegistrationViewController.h"
#import "ImageListViewController.h"
#import "ViewController.h"

@interface RegistrationViewController ()

@end

@implementation RegistrationViewController{
    NSString *name;
    NSString *age;
    NSString *phone;
    NSString *_imgUrl;
    float _lat ;
    float _lon;
    NSMutableData* myData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    name = @"";
    age = @"";
    phone =@"";
    _imgUrl = @"";
    
}

- (IBAction)selectImage:(id)sender {
    ImageListViewController *imgRef = [self.storyboard instantiateViewControllerWithIdentifier:@"imageList"];
    [imgRef setDelegator:self];
    [self presentViewController:imgRef animated:YES completion:nil ];
}

- (IBAction)selectLocation:(id)sender {
    ViewController *ref = [self.storyboard instantiateViewControllerWithIdentifier:@"mapView"];
    [ref setDelegator:self];
    [self presentViewController:ref animated:YES completion:nil ];
}

- (IBAction)done:(id)sender {
    if([name isEqualToString:@""]||[phone isEqualToString:@""]||[age isEqualToString:@""]){
        _state.text = @"Missing Input";
    }
    NSString *baseUrl  = @"http://jets.iti.gov.eg/FriendsApp/services/user/register?";
    name = _name.text;
    phone = _phone.text;
    age = _age.text;
    
    NSString *lonStr = [NSString stringWithFormat:@"%f", _lon];
    NSString *latStr = [NSString stringWithFormat:@"%f", _lat];
    
    baseUrl = [baseUrl stringByAppendingString:@"name="];
    
    baseUrl = [baseUrl stringByAppendingString:[name stringByAppendingString:@"&"]];
   
    baseUrl = [baseUrl stringByAppendingString:@"phone="];
    
    baseUrl = [baseUrl stringByAppendingString:[phone stringByAppendingString:@"&"]];
    
    baseUrl = [baseUrl stringByAppendingString:@"age="];
    
    baseUrl = [baseUrl stringByAppendingString:[age stringByAppendingString:@"&"]];
    
    baseUrl = [baseUrl stringByAppendingString:@"imageURL="];
    
    baseUrl = [baseUrl stringByAppendingString:[_imgUrl stringByAppendingString:@"&"]];
    
    baseUrl = [baseUrl stringByAppendingString:@"longitude="];
    
    baseUrl = [baseUrl stringByAppendingString:[lonStr stringByAppendingString:@"&"]];
    
    baseUrl = [baseUrl stringByAppendingString:@"latitude="];
    
    baseUrl = [baseUrl stringByAppendingString:latStr];
    
    
    printf("BASE URL : %s",[baseUrl UTF8String]);
    NSURL *endpoint = [[NSURL alloc] initWithString:baseUrl];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:endpoint];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    [connection start];
    
    //make connection and register
}



//delegate function to set image url
- (void)setSelectedImageUrl:(NSString *)imgUrl {
    _imgUrl = imgUrl;
}

//delegate function to set longitude and latitude
- (void)setLongitude:(float)lat setLatitude:(float)lon {
    printf("reg  selected lon:%f  lat:%f",lon,lat);
    _lat = lat;
    _lon = lon;
}

//connection delegate methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    printf("recive response");
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    printf("recive Data");
    [myData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    _state.text = @"Error";
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    printf("finish response");
    NSString *resultString = [[NSString alloc] initWithData:myData encoding:NSUTF8StringEncoding];
    if([resultString containsString:@"SUCCESS"]){
    _state.text = @"SUCCESS";
    }else{
        _state.text = @"FAUILER";

    }
    
}
@end
