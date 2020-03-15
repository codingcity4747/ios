//
//  ViewController.m
//  Networking
//
//  Created by JETS Mobile Lab on 3/11/20.
//  Copyright © 2020 ITI. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end
const NSString *url =@"http://www.omdbapi.com/?t=bad+boy";

@implementation ViewController{
    NSMutableData *myData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    myData = [NSMutableData new];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)search:(id)sender {
    NSURL *endpoint = [[NSURL alloc] initWithString:url];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:endpoint];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    [connection start];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    printf("recive response");
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    printf("recive Data");
    [myData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    printf("finish response");
    NSString *resultString = [[NSString alloc] initWithData:myData encoding:NSUTF8StringEncoding];
    _result.text = resultString;
}
@end
