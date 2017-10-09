//
//  CalculatorLogic.m
//  dd_homework_1
//
//  Created by Andrey on 09/10/2017.
//  Copyright © 2017 Andrey. All rights reserved.
//

#import "CalculatorLogic.h"

@implementation CalculatorLogic

-(CGFloat)executeOperation:(CGFloat)operand sender:(UIButton *)sender {
    
    CGFloat secondOperand;
    if ([sender.titleLabel.text isEqual:@"="])
        secondOperand = operand;
    else
        secondOperand = (self.firstOperand * operand) / 100;
    
    CGFloat result = self.firstOperand;
    if ([self.currentOperation isEqualToString:@"/"])
        result /= secondOperand;
    else if ([self.currentOperation isEqualToString:@"x"])
        result *= secondOperand;
    else if ([self.currentOperation isEqualToString:@"-"])
        result -= secondOperand;
    else if ([self.currentOperation isEqualToString:@"+"])
        result += secondOperand;
    
    return result;
}

@end
