//
//  LkFloatingTextView.m
//  LkFloatingTextView
//
//  Created by Apple on 18/08/18.
//  Copyright © 2018 Apple. All rights reserved.
//

#import "LkFloatingTextView.h"


@interface LkFloatingTextView()<UITextViewDelegate>
@property (nonatomic, strong) UILabel *activeLbl;
@end

@implementation LkFloatingTextView

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
    [self setUpTextView];
    [self setUpLabel];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(textDidChange:)
                                                 name:UITextViewTextDidChangeNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(textEndEditing:)
                                                 name:UITextViewTextDidEndEditingNotification object:nil];
}

- (void)setUpTextView{
    // Text Alignment
    [self setTextAlignment:NSTextAlignmentLeft];
    
    // Remove suggestion's
    self.autocorrectionType = UITextAutocorrectionTypeNo;
    
    // Delegate Call
    self.delegate = self;
    
    // Add Insets
    self.textContainerInset = UIEdgeInsetsMake(15.0, -5.0f, 0.0f, 5.0f);
    
}

- (void)setUpLabel{
    self.activeLbl = [UILabel new];
    self.activeLbl.frame = CGRectMake(0, 15, self.frame.size.width - 20, 12);
    [self addSubview:self.activeLbl];
}


#pragma mark IBInspectable Calls
- (void)layoutSubviews{
    [super layoutSubviews];
    self.activeLbl.text = self.placeholder;
    if (self.text.length > 0) {
        self.activeLbl.textColor = (self.activePlaceholderColor)?self.activePlaceholderColor:[UIColor whiteColor];
    }else{
        self.activeLbl.textColor = (self.placeholderColor)?self.placeholderColor:[UIColor whiteColor];
    }
    self.activeLbl.font = self.placeholderFont;
}


#pragma mark Actice Label Animation Show & hide

- (void)textEndEditing :(NSNotification *)notification{
    [self setContentOffset:CGPointZero animated:YES];
}

- (void)textDidChange :(NSNotification *)notification{
    if (self.text.length > 0) {
        self.placeholderFont = [UIFont boldSystemFontOfSize:10.0f];
        [self activeLabelAnimation:UITextViewAnimationTypeShow];
    }else{
        self.placeholderFont = self.font;
        [self activeLabelAnimation:UITextViewAnimationTypeHide];
    }
}


- (void)activeLabelAnimation :(UITextViewAnimation)animationType{
    if (animationType == UITextViewAnimationTypeShow) {
        [UIView animateWithDuration:0.5f delay:0.0f options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.activeLbl.frame = CGRectMake(0, 0, self.frame.size.width - 20, 12);
            self.activeLbl.textColor = (self.activePlaceholderColor)?self.activePlaceholderColor:[UIColor whiteColor];
            self.activeLbl.font = [UIFont boldSystemFontOfSize:10.0f];
        } completion:^(BOOL finished) {
            
        }];
    }else if (animationType == UITextViewAnimationTypeHide){
        [UIView animateWithDuration:0.5f delay:0.0f options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.activeLbl.frame = CGRectMake(0, 15, self.frame.size.width - 20, 12);
            self.activeLbl.textColor = (self.placeholderColor)?self.placeholderColor:[UIColor whiteColor];
            self.activeLbl.font = self.font;
        } completion:^(BOOL finished) {
        }];
    }
}


- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UITextViewTextDidChangeNotification
                                                  object:self];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UITextViewTextDidEndEditingNotification
                                                  object:self];
}

@end
