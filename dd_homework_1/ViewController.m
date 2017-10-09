//
//  ViewController.m
//  dd_homework_1
//
//  Created by Andrey on 08/10/2017.
//  Copyright © 2017 Andrey. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UILabel *display;
@property BOOL hasDot;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _hasDot = NO;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onDigitOrDotPressed:(UIButton *)sender {
    NSString *nowDisplay = self.display.text;
    
    if ([nowDisplay isEqual:@"0"])
        nowDisplay = @"";
    
    if (![sender.titleLabel.text isEqual:@"."] || !_hasDot)
        nowDisplay = [nowDisplay stringByAppendingString:sender.titleLabel.text];
    
    if ([sender.titleLabel.text isEqual:@"."] && !_hasDot)
        _hasDot = YES;
    
    self.display.text = nowDisplay;
}

- (IBAction)onClearPressed:(UIButton *)sender {
}

- (IBAction)onSignPressed:(UIButton *)sender {
}

- (IBAction)onCalculateResultPressed:(UIButton *)sender {
}

- (IBAction)onOperationPressed:(UIButton *)sender {
}

//- (IBAction)dasf:(UIButton *)sender {
//    [_culc changeCurrentNumber:sender.titleLabel.text];
//    double number = [_culc currentNumber];
//    numberOnDisplay.text = [NSString stringWithFormat:@"%f", number];
//    NSString * digit = sender.titleLabel.text;
//    if ([numberOnDisplay.text  isEqual: @"0"] && ![digit isEqual:@"."]) {
//        numberOnDisplay.text = digit;
//    } else {
//        if (![digit isEqual:@"."] || !hasPoint)
//            numberOnDisplay.text = [NSString stringWithFormat:@"%@%@", numberOnDisplay.text, digit];
//    }
//
//    if ([digit isEqual:@"."])
//        hasPoint = true;
//}


@end
