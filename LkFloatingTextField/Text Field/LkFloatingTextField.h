//
//  LkFloatingTextField.h
//  LkFloatingTextField
//
//  Created by Apple on 17/08/18.
//  Copyright © 2018 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, UIActiveLabelAnimation){
    UIActiveLabelAnimationTypeShow = 0,
    UIActiveLabelAnimationTypeHide
};

@interface LkFloatingTextField : UITextField
@property (nonatomic,strong) IBInspectable UIColor *activeLabelColor;
@property (nonatomic,strong) IBInspectable UIColor *placeholderColor;
@end
