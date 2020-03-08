//
//  DetailViewController.m
//  TableViewController
//
//  Created by Ashraf on 3/7/20.
//  Copyright © 2020 Ashraf. All rights reserved.
//

#import "DetailViewController.h"
#import "Friend.h"
@interface DetailViewController ()

@end

@implementation DetailViewController{
    Friend *recivedFriend;
}
@synthesize name,email,phone,address,age;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)displayFriend:(Friend *)friend{
    recivedFriend = friend;
    printf("$d",recivedFriend.age);
    [self displayDetails];
}

-(void)displayDetails{
    name.text = recivedFriend.name;
    email.text = recivedFriend.email;
    phone.text = recivedFriend.phone;
    address.text = recivedFriend.address;
    age.text = [NSString stringWithFormat:@"%d",recivedFriend.age];
}

@end
