//
//  CalculatorLogic.h
//  dd_homework_1
//
//  Created by Andrey on 09/10/2017.
//  Copyright © 2017 Andrey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CalculatorLogic : NSObject

@property (copy, nonatomic) NSString *currentOperation;
@property (nonatomic) CGFloat firstOperand;

-(CGFloat)executeOperation:(CGFloat)operand sender:(UIButton *)sender;

@end
