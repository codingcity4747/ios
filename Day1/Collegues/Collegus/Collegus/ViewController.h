//
//  ViewController.h
//  Collegus
//
//  Created by Ashraf on 3/6/20.
//  Copyright © 2020 Ashraf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (nonatomic,strong)NSMutableArray *names;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property int position;
-(void)setNameWithPosition:(int)p;
@end

