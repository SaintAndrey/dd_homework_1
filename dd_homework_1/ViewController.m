//
//  ViewController.m
//  dd_homework_1
//
//  Created by Andrey on 08/10/2017.
//  Copyright © 2017 Andrey. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    hasPoint = false;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)typeOnDigit:(UIButton *)sender {
    NSString * digit = sender.titleLabel.text;
    if ([numberOnDisplay.text  isEqual: @"0"] && ![digit isEqual:@","]) {
        numberOnDisplay.text = digit;
    } else {
        if (![digit isEqual:@","] || !hasPoint)
            numberOnDisplay.text = [NSString stringWithFormat:@"%@%@", numberOnDisplay.text, digit];
    }
    
    if ([digit isEqual:@","])
        hasPoint = true;
}

@end
