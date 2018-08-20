//
//  ViewController.m
//  LkFloatingTextField
//
//  Created by Apple on 17/08/18.
//  Copyright © 2018 Apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate,UITextViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.txtFieldOne.activeLabelColor = [UIColor whiteColor];
//    self.txtFieldTwo.activeLabelColor = [UIColor whiteColor];
//    self.txtFieldOne.placeholderColor = [UIColor whiteColor];
//    self.txtFieldTwo.placeholderColor = [UIColor whiteColor];
//    self.txtViewMessage.placeholderColor = [UIColor whiteColor];
//    self.txtViewMessage.placeholder = @"Address";
    self.txtViewMessage.placeholderFont = self.txtViewMessage.font;
    // Do any additional setup after loading the view, typically from a nib.
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark UITextField Delegate's
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    [self changeTheColorOfLine:textField];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

// here, we changed the color of bottom line of UITextField
- (void)changeTheColorOfLine :(UITextField *)textField{
    for (UIView *view in self.view.subviews) {
        if ([view isKindOfClass:[UILabel class]]) {
            if (view.tag == textField.tag) {
                view.backgroundColor = [UIColor whiteColor];
            }else{
                view.backgroundColor = [UIColor darkGrayColor];
            }
        }
    }
}

#pragma mark UITextView Delegate's
- (void)textViewDidBeginEditing:(UITextView *)textView{
    [self changeActiveLineColorOfTextView:textView];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}


// here, we changed the color of bottom line of UITextView
- (void)changeActiveLineColorOfTextView :(UITextView *)textView{
    for (UIView *view in self.view.subviews) {
        if ([view isKindOfClass:[UILabel class]]) {
            if (view.tag == textView.tag) {
                view.backgroundColor = [UIColor whiteColor];
            }else{
                view.backgroundColor = [UIColor darkGrayColor];
            }
        }
    }
}

@end
