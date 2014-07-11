//
//  CLCMath.m
//  Calculator
//
//  Created by Ольга Николаева on 10.07.14.
//  Copyright (c) 2014 Internship. All rights reserved.
//

#import "CLCMath.h"

@implementation CLCMath

-(id)init
{
    self = [super init];
    self.x = [NSNumber numberWithFloat:0];
    self.y = [NSNumber numberWithFloat:0];
    self.xyOperation = NONE;
    self.result = [NSNumber numberWithFloat:0];
    self.strExpression = @"";
    return self;
}

-(void)mathOperation:(CLCOperation)operationName
{
    float number1 = [self.x floatValue];
    float number2 = [self.y floatValue];
    float thisResult = [self.result floatValue];
    
    if (self.xyOperation == NONE)
    {
        self.x = self.y;
        self.result = self.y;
        self.y = [NSNumber numberWithFloat:0];
        self.xyOperation = operationName;
    } else {
        if (self.xyOperation == PLUS)
        {
            thisResult = number1 + number2;
        } else if (self.xyOperation == MINUS){
            thisResult = number1 - number2;
            
        }else if (self.xyOperation == DIVIDE){
            thisResult = number1 / number2;
        }else if (self.xyOperation == MULTIPLY){
            thisResult = number1 * number2;
        }
        
         self.x = [NSNumber numberWithFloat:thisResult];
         self.y = [NSNumber numberWithFloat:0];
         self.result = [NSNumber numberWithFloat:thisResult];
         self.xyOperation = operationName;
        
        if(self.xyOperation == EQUALITY)
        {
             self.xyOperation = operationName;
            //    self.x = self.y;
            //  self.result = [NSNumber numberWithFloat:0];
        }
    }
}

-(void)setPlusMinusYArgument{
    float tempValue = [self.y floatValue];
    tempValue = tempValue * (-1.0);
    self.y = [NSNumber numberWithFloat:tempValue];
}

// очистить всё. аргументы и результат
-(void)clearAll{
    self.x = [NSNumber numberWithFloat:0];
    self.y = [NSNumber numberWithFloat:0];
    self.result = [NSNumber numberWithFloat:0];
    self.xyOperation = NONE;
}

-(NSString *)makeMathExpression{
    CLCOperation tempOperation = self.xyOperation;
    NSString *strSign;
    NSString *strExpr;
    
    switch (tempOperation) {
        case PLUS:
            strSign = @"+";
            break;
        case MINUS:
            strSign = @"-";
            break;
        case DIVIDE:
            strSign = @"/";
            break;
        case MULTIPLY:
            strSign = @"*";
            break;
        default:
            strSign = @"";
            break;
    }
    if ((tempOperation == NONE) || ([self.x floatValue] == 0.0) )
    {
        strExpr = [NSString stringWithFormat:@"%1.2f",[self.y floatValue]];
    } else if  (tempOperation == EQUALITY)
    {
   //  strExpr = [NSString stringWithFormat:@"%1.2f",[self.result floatValue]];
        strExpr = [NSString stringWithFormat:@"%@ = %1.2f",self.strExpression, [self.result floatValue]];
    }

    else if ([self.y floatValue] == 0.0)
    {
         strExpr = [NSString stringWithFormat:@"%1.2f %@ ",[self.x floatValue],strSign];
    }  else
    {
        strExpr = [NSString stringWithFormat:@"%1.2f %@ %1.2f",[self.x floatValue],strSign,[self.y floatValue]];
        self.strExpression = strExpr;
    }
    return strExpr;
}


@end
