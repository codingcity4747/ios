//
//  ViewController.m
//  BouncBall
//
//  Created by Ashraf on 3/9/20.
//  Copyright © 2020 Ashraf. All rights reserved.
//

#import "ViewController.h"
static bool isOrange;
@interface ViewController ()

@end

@implementation ViewController{
    UIColor *color;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    isOrange = YES;
    _ball.layer.cornerRadius=25;
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    [self doAnimation];
    // Do any additional setup after loading the view.
}

-(void)doAnimation{
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[self.ball]];
    
    UICollisionBehavior *collision =[[UICollisionBehavior alloc] initWithItems:@[self.ball]];
    [collision setCollisionDelegate:self];
    [collision setTranslatesReferenceBoundsIntoBoundary:YES];
    UIDynamicItemBehavior *elstic = [[UIDynamicItemBehavior alloc] initWithItems:@[self.ball]];
    
    elstic.elasticity = 0.75;
    [self.animator addBehavior:gravity];
    [self.animator addBehavior:elstic];
    [self.animator addBehavior:collision];
}

- (void)collisionBehavior:(UICollisionBehavior *)behavior endedContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier{
    printf("collaps");
       if([color isEqual:[UIColor purpleColor]]){
           color = [UIColor orangeColor];
           isOrange = !isOrange;
       }else{
           color = [UIColor purpleColor];
           _ball.backgroundColor = color;
       }
    _ball.backgroundColor = color;
}

@end
