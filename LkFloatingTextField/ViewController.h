//
//  ViewController.h
//  LkFloatingTextField
//
//  Created by Apple on 17/08/18.
//  Copyright © 2018 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LkFloatingTextField.h"
#import "LkFloatingTextView.h"

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet LkFloatingTextField *txtFieldOne;
@property (weak, nonatomic) IBOutlet LkFloatingTextField *txtFieldTwo;
@property (weak, nonatomic) IBOutlet LkFloatingTextView *txtViewMessage;
@end

