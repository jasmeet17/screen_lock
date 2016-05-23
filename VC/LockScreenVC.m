//
//  LockScreenVC.m
//  Cards Lock
//
//  Created by Abhi on 02/11/15.
//  Copyright (c) 2015 Abhi. All rights reserved.
//

#import "LockScreenVC.h"


@interface LockScreenVC (){
    // To count the number of the Circles been Circled Dark
    short circlesFilled;
}

@end

@implementation LockScreenVC

#pragma mark - Starting Delegates
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    [self action_EditDigitButtons:self.arr_DigitButtons];
    
    [self action_EditPasscodeViews:self.arr_CircleViews];
    
    // Setting back Ground color clear
    [self.otl_DigitSubview setBackgroundColor:[UIColor clearColor]];
    [self.otl_PassCodeCircles setBackgroundColor:[UIColor clearColor]];
    [self.btn_Delete setBackgroundColor:[UIColor clearColor]];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - edit buttons shape & Size
-(void) action_EditDigitButtons:(NSArray *) digitButtons{
    
    for(UIButton *btn in self.arr_DigitButtons){
        btn.layer.cornerRadius=35.0f;
        btn.layer.borderColor=[UIColor whiteColor].CGColor;
        btn.layer.borderWidth=1.0f;
        
        [btn setBackgroundColor:[UIColor clearColor]];
        [btn addTarget:self action:@selector(action_ButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [btn setBackgroundImage:[self imageWithColor:[UIColor colorWithWhite:255 alpha:.80f]] forState:UIControlStateHighlighted];
    }
}

#pragma mark - edit passcode views
-(void) action_EditPasscodeViews:(NSArray *) circularViews{
    
    for(UIView *view in circularViews){
        view.layer.cornerRadius=7.0f;
        view.layer.borderColor=[UIColor whiteColor].CGColor;
        view.layer.borderWidth=1.0f;
        [view setBackgroundColor:[UIColor clearColor]];
    }
}

#pragma mark - Actions
-(void) action_ShakeScreen{
    CAKeyframeAnimation * anim = [ CAKeyframeAnimation animationWithKeyPath:@"transform" ] ;
    anim.values = @[ [ NSValue valueWithCATransform3D:CATransform3DMakeTranslation(-40.0f, 0.0f, 0.0f) ], [ NSValue valueWithCATransform3D:CATransform3DMakeTranslation(40.0f, 0.0f, 0.0f) ] ] ;
    anim.autoreverses = YES ;
    anim.repeatCount = 2.0f ;
    anim.duration = 0.07f ;
    [self.otl_PassCodeCircles.layer addAnimation:anim forKey:nil] ;
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);

}

-(void) action_ButtonPressed:(UIButton *) sender{
    AudioServicesPlaySystemSound(1104);
    if(circlesFilled==3){
        [self action_ShakeScreen];
        circlesFilled=0;
        for(UIButton *btn in self.arr_CircleViews){
            [btn setBackgroundColor:[UIColor clearColor]];
        }
    }else{
        [[self.arr_CircleViews objectAtIndex:circlesFilled] setBackgroundColor:[UIColor colorWithWhite:255 alpha:.70f]];
        circlesFilled++;
    }
}

#pragma mark - Change Colors Actions
-(void) changeButtonBackGroundColor:(UIButton *) sender{
    [sender setBackgroundColor:[UIColor colorWithWhite:255 alpha:.70f]];
}

-(void) resetButtonBackGroundColor:(UIButton *) sender{
    [sender setBackgroundColor:[UIColor clearColor]];
}

- (IBAction)action_DeleteCancel:(UIButton *)sender{
    if(circlesFilled!=0){
        circlesFilled--;
        AudioServicesPlaySystemSound(1104);
        [[self.arr_CircleViews objectAtIndex:circlesFilled] setBackgroundColor:[UIColor clearColor]];
    }
}

#pragma mark - Create Image
- (UIImage *)imageWithColor:(UIColor *)color {
    
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
