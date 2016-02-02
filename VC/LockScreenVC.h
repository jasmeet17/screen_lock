//
//  LockScreenVC.h
//  Cards Lock
//
//  Created by Abhi on 02/04/15.
//  Copyright (c) 2015 Abhi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <CoreImage/CoreImage.h>

@interface LockScreenVC : UIViewController

#pragma mark - Outlets Collections

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *arr_DigitButtons;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *arr_CircleViews;

#pragma mark - Outlets

@property (weak, nonatomic) IBOutlet UIView *otl_DigitSubview;
@property (weak, nonatomic) IBOutlet UIView *otl_PassCodeCircles;
@property (weak, nonatomic) IBOutlet UIButton *btn_Delete;
@property (weak, nonatomic) IBOutlet UILabel *otl_EnterPassCode;

#pragma mark - Actions
- (IBAction)action_DeleteCancel:(UIButton *)sender;


@end
