//
//  ViewController.m
//  dd_homework_1
//
//  Created by Andrey on 08/10/2017.
//  Copyright © 2017 Andrey. All rights reserved.
//

#import "ViewController.h"
#import "CalculatorLogic.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UILabel *display;
@property (strong, nonatomic) CalculatorLogic *logic;
@property (nonatomic) BOOL hasDot;
@property (nonatomic) BOOL waitNextOperand;
@property (copy, nonatomic) NSString *string;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.logic = [[CalculatorLogic alloc] init];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onDigitOrDotPressed:(UIButton *)sender {
    NSString *nowDisplay = self.display.text;
    
    if ([nowDisplay isEqual:@"0"] || self.waitNextOperand || [nowDisplay isEqual:@"inf"]) {
        nowDisplay = @"";
        if ([sender.titleLabel.text isEqual:@"."])
            nowDisplay = @"0";
        self.waitNextOperand = NO;
    }
    
    if (![sender.titleLabel.text isEqual:@"."] || !self.hasDot)
        nowDisplay = [nowDisplay stringByAppendingString:sender.titleLabel.text];
    
    if ([sender.titleLabel.text isEqual:@"."] && !self.hasDot)
        self.hasDot = YES;
    
    self.display.text = nowDisplay;
}

- (IBAction)onClearPressed:(UIButton *)sender {
    self.logic.currentOperation = nil;
    self.logic.firstOperand = 0;
    self.display.text = @"0";
}

- (IBAction)onSignPressed:(UIButton *)sender {
    if (!self.waitNextOperand) {
        NSString *nowString = self.display.text;
        if ([nowString hasPrefix:@"-"])
            self.display.text = [nowString substringFromIndex:1];
        else
            self.display.text = [NSString stringWithFormat:@"-%@", nowString];
    }
}

- (IBAction)onCalculateResultPressed:(UIButton *)sender {
    NSString *result = [NSString stringWithFormat:@"%f",
                        [self.logic executeOperation:self.display.text.doubleValue
                                              sender:sender]];
    
    while ([result rangeOfString:@"."].location != NSNotFound && ([result hasSuffix:@"0"] || [result hasSuffix:@"."])) {
        result = [result substringToIndex:[result length] - 1];
    }
    
    if ([result isEqual:@""]) {
        result = @"0";
    }
    
    self.display.text = [NSString stringWithFormat:@"%@", result];
    self.logic.firstOperand = result.doubleValue;
    self.waitNextOperand = YES;
    self.hasDot = NO;
}

- (IBAction)onOperationPressed:(UIButton *)sender {
    self.waitNextOperand = YES;
    self.hasDot = NO;
    self.logic.currentOperation = sender.titleLabel.text;
    self.logic.firstOperand = self.display.text.doubleValue;
}

@end
