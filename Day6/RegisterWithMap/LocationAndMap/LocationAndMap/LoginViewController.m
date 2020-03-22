//
//  LoginViewController.m
//  LocationAndMap
//
//  Created by Ashraf on 3/22/20.
//  Copyright © 2020 Ashraf. All rights reserved.
//

#import "LoginViewController.h"
#import "DetailsViewController.h"
@interface LoginViewController ()

@end

@implementation LoginViewController{
    NSMutableData *myData;
    NSData *data;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    myData = [NSMutableData new];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)login:(id)sender {
    NSString* phone = _phone.text;
    if([phone isEqualToString:@""]){
        UIAlertView *noPhoneAlert =[[UIAlertView alloc] initWithTitle:@"Wrong Input" message:@"Please Enter Phone Number" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
        [noPhoneAlert show];
    }else{
        NSString* phone = _phone.text;
        NSString* baseUrl =@"http://jets.iti.gov.eg/FriendsApp/services/user/findUser?phone=";
        baseUrl = [baseUrl stringByAppendingString:phone];
        printf("%s",[baseUrl UTF8String]);
        
        NSURL *endPoint = [[NSURL alloc] initWithString:baseUrl];
        
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:endPoint];
        
        NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        
        [connection start];
    }
        
}


- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    printf("recive response");
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    printf("recive Data");
    if(myData == nil){
        myData = [NSMutableData new];
    }
    [myData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    UIAlertView *noPhoneAlert =[[UIAlertView alloc] initWithTitle:@"Connection Error" message:@"Please Check Your Internet Connection" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [noPhoneAlert show];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    
    printf("finish response");
    

    NSError *error = nil;
        NSDictionary *results = [NSJSONSerialization
                          JSONObjectWithData:myData
                          options:0
                          error:&error];

        if(error) {
            UIAlertView *noPhoneAlert =[[UIAlertView alloc] initWithTitle:@"Connection Error" message:@"Please Check Your Internet Connection" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [noPhoneAlert show];
            return;
        }

        
            printf("is dictionary");
            NSString* status = [results valueForKey:@"status"];
        if([status isEqualToString:@"FAILING"]){
            UIAlertView *noPhoneAlert =[[UIAlertView alloc] initWithTitle:@"Wrong Input" message:@"Please Check Your Phone Number" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [noPhoneAlert show];
            return;
        }
            NSDictionary *userInfo = [results valueForKey:@"result"];
            NSString* name = [userInfo valueForKey:@"name"];
            NSString* phone = [userInfo valueForKey:@"phone"];
            printf("status:%s name:%s phone:%s",[status UTF8String],[name UTF8String],[phone UTF8String]);
            if([status isEqualToString:@"SUCCESS"]){
                DetailsViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"detail"];
                [detailVC setUserName:name setUserPhone:phone setUserAge:@"" setUserLocation:@""];
                [self presentViewController:detailVC animated:YES completion:nil];
            }else{
                UIAlertView *noPhoneAlert =[[UIAlertView alloc] initWithTitle:@"Wrong Input" message:@"Please Check Your Phone Number" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
                [noPhoneAlert show];
            }
            
        
        
    myData = nil;
    
}

@end
