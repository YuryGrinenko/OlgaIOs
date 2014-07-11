//
//  CLCMath.h
//  Calculator
//
//  Created by Ольга Николаева on 10.07.14.
//  Copyright (c) 2014 Internship. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CLCMath : NSObject

 typedef enum _CLCOperations {PLUS, MINUS, DIVIDE, MULTIPLY, EQUALITY, NONE} CLCOperation; // операции калькулятора

 @property(nonatomic, strong) NSNumber *x; // 1й аргумент выражения
 @property(nonatomic, strong) NSNumber *y; // 2й аргумент выражения
 @property(nonatomic) CLCOperation xyOperation; // операция
 @property(nonatomic,strong) NSNumber *result; // результат операции
 @property(nonatomic,strong) NSString *strExpression; //тектовое выражение

// метод возвращает результат вычисления заданной операции
//-(void)mathOperation:(NSNumber *)firstArgument secondArgument:(NSNumber *)secondArgument withOperation:(CLCOperation)operationName;

// метод возвращает результат вычисления заданной операции
-(void)mathOperation:(CLCOperation)operationName;

-(void)setPlusMinusYArgument;

//очистить аргументы и результат
-(void)clearAll;

//формирование текстового математического выражения
-(NSString *)makeMathExpression;

@end
