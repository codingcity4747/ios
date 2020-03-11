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

@implementation ViewController{
    NSString *yahooUrlString;
    NSURL *url;
    NSData *myData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    yahooUrlString =@"https://www.yahoo.com";
    url = [[NSURL alloc] initWithString:yahooUrlString];
    myData =[NSData new];
}


- (IBAction)sync:(id)sender {
    printf("sync");
    NSString *content = [[NSString alloc] initWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    
    [_webView loadHTMLString:content baseURL:nil];
}

- (IBAction)Aysnc:(id)sender {
    printf("Aysnc");
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    [_webView loadRequest:request];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    
}
@end
