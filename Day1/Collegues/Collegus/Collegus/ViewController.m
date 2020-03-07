//
//  ViewController.m
//  Collegus
//
//  Created by Ashraf on 3/6/20.
//  Copyright © 2020 Ashraf. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize position;
- (void)viewDidLoad {
    [super viewDidLoad];
    _names = [NSMutableArray arrayWithCapacity:5];
    position = 0 ;
    [_names addObject:@"Ahmed"];
    
    [_names addObject:@"Eman"];
    
    [_names addObject:@"Reham"];
    
    [_names addObject:@"Monam"];
    
    [_names addObject:@"Ashraf"];
    
    NSString* current = [_names objectAtIndex:position];
    //[_label setText:current];
    // Do any additional setup after loading the view.
}
- (IBAction)left:(id)sender {
    position--;
    if(position == -1){
        position=4;
    }
    [self setNameWithPosition:position];
}

- (IBAction)right:(id)sender {
    position++;
    if(position == 5){
        position = 0;
    }
    [self setNameWithPosition:position];
}
-(void)setNameWithPosition:(int)p{
    NSString* currentName = [_names objectAtIndex:p];
    NSLog(currentName);
    [_label setText:currentName];
}
@end
