//
//  ViewController.m
//  tableViewWithNetwork
//
//  Created by JETS Mobile Lab on 3/11/20.
//  Copyright © 2020 ITI. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
@interface ViewController ()

@end

@implementation ViewController{
    NSString *itiUrl ;
    NSMutableData *myData;
}
@synthesize  name , phone;
- (void)viewDidLoad {
    [super viewDidLoad];
    itiUrl = @"http://jets.iti.gov.eg/FriendsApp/services/user/register?";
    myData = [NSMutableData new];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)reg:(id)sender {
    NSString* userName = name.text;
    NSString *userPhone = phone.text;
    printf("name :%s  phone: %s",[userName UTF8String],[userPhone UTF8String]);
    NSString *userNameQuery = [@"name=" stringByAppendingString:userName];
    NSString *userPhoneQuery = [@"&phone=" stringByAppendingString:userPhone];
    NSString *fullUrl = [itiUrl stringByAppendingString:userNameQuery];
    fullUrl = [fullUrl stringByAppendingString:userPhoneQuery];
    printf("url :%s",[fullUrl UTF8String]);

    NSURL *url = [[NSURL alloc] initWithString:fullUrl];

    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    [connection start];

}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:myData options:0 error:nil];
    NSString *status = [dict objectForKey:@"status"];
    NSString *message = [dict objectForKey:@"result"];
    _status.text = status;
    [myData setData:nil];

    if([status isEqualToString:@"FAILING"]){
        
    }else{
        SecondViewController *second =[self.storyboard instantiateViewControllerWithIdentifier:@"second"];
        [self presentViewController:second animated:YES completion:nil];
    }
//    if([status isEqualToString:@"FAILING"]){
//        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Wrong Registration" message:@"user Exist" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK"];
//        [alert show];
//    }else{
//
//    }

}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [myData appendData:data];
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    _status.text = @"Connection Lost";
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 0:
            break;
            
        case 1:
            break;
    }
}
@end
