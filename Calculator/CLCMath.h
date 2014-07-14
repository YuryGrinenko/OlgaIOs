//
//  CLCMath.h
//  Calculator
//
//  Created by Ольга Николаева on 10.07.14.
//  Copyright (c) 2014 Internship. All rights reserved.
//

#import <UIKit/UIKit.h>

#warning Из имени класса непонятно, что он делает
@interface CLCMath : NSObject

#warning Если хочешь комментировать свой код, то делай это на английском. Если замечаешь, что пишешь много комментариев, задумайся, зачем ты их пишешь. Возможно, следует более явно назвать метод/переменную, чтоб не было необходимости в комментировании
typedef enum _CLCOperations {PLUS, MINUS, DIVIDE, MULTIPLY, EQUALITY, NONE} CLCOperation; // операции калькулятора

#warning Операнды лучше бы назвать firstOperand и secondOperand, тогда не будет необходимости в комментариях.
 @property(nonatomic, strong) NSNumber *x; // 1й аргумент выражения
 @property(nonatomic, strong) NSNumber *y; // 2й аргумент выражения
 @property(nonatomic) CLCOperation xyOperation; // операция
 @property(nonatomic,strong) NSNumber *result; // результат операции

#warning лучше назвать expressionString, в конце имени явно указываем на тип, если необходимо
 @property(nonatomic,strong) NSString *strExpression; //тектовое выражение

#warning Не стоит коммитить закомментированный код. Не нужно боятся его удалять, всегда можно найти его в истории git'а
// метод возвращает результат вычисления заданной операции
//-(void)mathOperation:(NSNumber *)firstArgument secondArgument:(NSNumber *)secondArgument withOperation:(CLCOperation)operationName;

// метод возвращает результат вычисления заданной операции
#warning Название метода не говорит о том, что метод делает. В данном случае следовало бы назвать как-то вроде executeOperation или performOperation
-(void)mathOperation:(CLCOperation)operationName;

-(void)setPlusMinusYArgument;

//очистить аргументы и результат
-(void)clearAll;

#warning Этот метод не должен быть в модели, форматированием занимается отдельный объект-форматтер
//формирование текстового математического выражения
-(NSString *)makeMathExpression;

@end
