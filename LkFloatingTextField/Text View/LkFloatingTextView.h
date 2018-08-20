//
//  LkFloatingTextView.h
//  LkFloatingTextField
//
//  Created by Apple on 18/08/18.
//  Copyright © 2018 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, UITextViewAnimation){
    UITextViewAnimationTypeShow = 0,
    UITextViewAnimationTypeHide
};

@interface LkFloatingTextView : UITextView
@property (nonatomic, strong) IBInspectable NSString *placeholder;
@property (nonatomic, strong) IBInspectable UIColor *placeholderColor;//red
@property (nonatomic, strong) IBInspectable UIColor *activePlaceholderColor;//white
@property (nonatomic, strong) UIFont *placeholderFont;
@end
