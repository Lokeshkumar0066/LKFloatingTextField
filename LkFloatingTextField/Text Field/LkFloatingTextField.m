//
//  LkFloatingTextField.m
//  LkFloatingTextField
//
//  Created by Apple on 17/08/18.
//  Copyright © 2018 Apple. All rights reserved.
//

#import "LkFloatingTextField.h"

@interface LkFloatingTextField() <UITextFieldDelegate>
@property (nonatomic, strong) UILabel *activeLbl;
@end


@implementation LkFloatingTextField

#pragma mark - Initialization
- (id)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}


#pragma mark - Setup

- (void)setup{
    [self setUpTextField];
    [self setUpLabel];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(textDidChange:)
                                                 name:UITextFieldTextDidChangeNotification object:nil];
}

- (void)setUpTextField{
    // Text Alignment
    [self setTextAlignment:NSTextAlignmentLeft];
    
    // Enable clearButton when textField becomes firstResponder
    self.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    // Remove suggestion's
    self.autocorrectionType = UITextAutocorrectionTypeNo;
    
    // Delegate Call
    self.delegate = self;
    
}

- (void)setUpLabel{
    self.activeLbl = [UILabel new];
    self.activeLbl.frame = CGRectMake(0, self.frame.size.height - 12, self.frame.size.width - 20, 12);
    self.activeLbl.font = [UIFont boldSystemFontOfSize:10.0f];
    self.activeLbl.text = self.placeholder;
    self.activeLbl.alpha = 0.0f;
    [self addSubview:self.activeLbl];
}


#pragma mark IBInspectable Calls
-(void)layoutSubviews{
    [super layoutSubviews];
    self.activeLbl.textColor = self.activeLabelColor;
    [self setAttributedPlaceholder:self.placeholderColor textfield:self];
}


#pragma mark Change The Bottom Insets Of UITextField
- (UIEdgeInsets)floatLabelInsets{
    CGFloat top = [self.text length] ? 5.0f : 0.0f;
    return UIEdgeInsetsMake(top, 0.0f, -5.0f, 5.0f);
}


- (CGRect)textRectForBounds:(CGRect)bounds
{
    return UIEdgeInsetsInsetRect([super textRectForBounds:bounds], [self floatLabelInsets]);
}

- (CGRect)editingRectForBounds:(CGRect)bounds
{
    return UIEdgeInsetsInsetRect([super editingRectForBounds:bounds], [self floatLabelInsets]);
}


#pragma mark Actice Label Animation Show And hide

- (void)textDidChange :(NSNotification *)notification{
    if (self.text.length > 0) {
        [self activeLabelAnimation:UIActiveLabelAnimationTypeShow];
    }else{
        [self activeLabelAnimation:UIActiveLabelAnimationTypeHide];
    }
}


- (void)activeLabelAnimation :(UIActiveLabelAnimation)animationType{
    if (animationType == UIActiveLabelAnimationTypeShow) {
        [UIView animateWithDuration:0.5f delay:0.0f options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.activeLbl.frame = CGRectMake(0, 0, self.frame.size.width - 20, 12);
            self.activeLbl.alpha = 1.0f;
        } completion:^(BOOL finished) {
            
        }];
    }else if (animationType == UIActiveLabelAnimationTypeHide){
        [UIView animateWithDuration:0.5f delay:0.0f options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.activeLbl.frame = CGRectMake(0, self.frame.size.height - 20, self.frame.size.width - 20, 12);
            self.activeLbl.alpha = 0.0f;
        } completion:^(BOOL finished) {
        }];
    }
}


#pragma mark Change The Placeholder Color of UITextField
- (void)setAttributedPlaceholder:(UIColor *)placeholdeColor textfield:(UITextField *)textfield{
    textfield.attributedPlaceholder = [[NSAttributedString alloc] initWithString:textfield.placeholder attributes:@{NSForegroundColorAttributeName: placeholdeColor}];
}


- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UITextFieldTextDidChangeNotification
                                                  object:self];
}


@end
