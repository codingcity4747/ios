//
//  ViewController.h
//  BouncBall
//
//  Created by Ashraf on 3/9/20.
//  Copyright © 2020 Ashraf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UICollisionBehaviorDelegate>
@property (weak, nonatomic) IBOutlet UIView *ball;
@property UIDynamicAnimator *animator;

-(void)doAnimation;

@end

