//
//  CLCViewController.m
//  Calculator
//
//  Created by Ольга Николаева on 08.07.14.
//  Copyright (c) 2014 Internship. All rights reserved.
//

#import "CLCViewController.h"

@interface CLCViewController ()

@property (strong,nonatomic) CLCMath *calculation;
@property (strong,nonatomic) UIColor *buttonsUpColor;
@property (strong,nonatomic) UIColor *buttonsRight;
@property (strong,nonatomic) UIColor *disableColor;

@end

@implementation CLCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// инициализируем объект для вычислений
    _calculation = [[CLCMath alloc]init];
    //запоминаем исходные цвета кнопок
    _buttonsRight = plusButton.backgroundColor;
    _buttonsUpColor = plusMinusButton.backgroundColor;
    _disableColor = [[UIColor alloc] initWithRed:150 green:150 blue:150 alpha:0.5];
    //отключаем кнопки
    [self disableButtons];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

//доступность кнопок
-(void)enableButtons
{
    [plusMinusButton setEnabled:YES];
    [percentButton setEnabled:YES];
    [divideButton setEnabled:YES];
    [multyplyButton setEnabled:YES];
    [minusButton setEnabled:YES];
    [plusButton setEnabled:YES];
    plusMinusButton.backgroundColor = _buttonsUpColor;
    percentButton.backgroundColor = _buttonsUpColor;
    cButton.backgroundColor = _buttonsUpColor;
    divideButton.backgroundColor = _buttonsRight;
    multyplyButton.backgroundColor = _buttonsRight;
    minusButton.backgroundColor = _buttonsRight;
    plusButton.backgroundColor = _buttonsRight;
}

//доступность кнопок
-(void)enableEquals
{
    [equalButton setEnabled:YES];
    equalButton.backgroundColor = _buttonsRight;
}

//недоступность кнопок
-(void)disableButtons
{
    [plusMinusButton setEnabled:NO];
    [percentButton setEnabled:NO];
    [divideButton setEnabled:NO];
    [multyplyButton setEnabled:NO];
    [minusButton setEnabled:NO];
    [plusButton setEnabled:NO];
    [equalButton setEnabled:NO];
    plusMinusButton.backgroundColor = _disableColor;
    percentButton.backgroundColor = _disableColor;
    cButton.backgroundColor = _disableColor;
    divideButton.backgroundColor = _disableColor;
    multyplyButton.backgroundColor = _disableColor;
    minusButton.backgroundColor = _disableColor;
    plusButton.backgroundColor = _disableColor;
    equalButton.backgroundColor = _disableColor;
}

//очистить всё
-(IBAction)clearResult:(id)sender
{
    [_calculation clearAll];
    [self refreshLabelAfterDigitPress];
    [expressionLabel setText:_calculation.makeMathExpression];
    // кнопки недоступны
    [self disableButtons];
}

//нажата цифра
-(IBAction)digit:(UIButton *)sender
{
    NSNumberFormatter *strFormat = [[NSNumberFormatter alloc]init];
    NSString *tempStr =[NSString stringWithFormat:@"%1@", _calculation.y ];
    tempStr = [tempStr stringByAppendingString:sender.titleLabel.text];
    _calculation.y = [strFormat numberFromString:tempStr];
    [self refreshLabelAfterDigitPress];
    // формируем тектовое мат.выражение
    [expressionLabel setText:_calculation.makeMathExpression];
    // кнопки теперь доступны
    [self enableButtons];
    //если есть второй аргумент, то доступно и =
    if ([_calculation.x floatValue]>0) {
         [self enableEquals];
    }
}

  //нажатие на кнопку с операцией
-(IBAction)operation:(UIButton *)sender
{
    if ([sender.titleLabel.text isEqualToString:@"x"]) {
        [_calculation mathOperation: MULTIPLY];
    } else if ([sender.titleLabel.text isEqualToString:@"+"])
    {
         [_calculation mathOperation: PLUS];
    } else if([sender.titleLabel.text isEqualToString:@"-"])
    {
        [_calculation mathOperation: MINUS];
    }else if ([sender.titleLabel.text isEqualToString:@"/"])
    {
         [_calculation mathOperation: DIVIDE];
    }else if ([sender.titleLabel.text isEqualToString:@"="])
    {
      [_calculation mathOperation: EQUALITY];
    } else if ([sender.titleLabel.text isEqualToString:@"+/-"])
    {
         //если нажат +/- то умножаем у на -1
        [_calculation setPlusMinusYArgument];
    }
    
    if ([sender.titleLabel.text isEqualToString:@"+/-"])
    {
        [self refreshLabelAfterDigitPress];
    } else
    {
     [self refreshLabelAfterOperationPress];
     [self disableButtons];
    }
    // формируем тектовое мат.выражение
    [expressionLabel setText:_calculation.makeMathExpression];
    
}

//обновить лэйбл после нажатия цифры
-(void)refreshLabelAfterDigitPress{
    NSString *labelText = [NSString stringWithFormat:@"%1.2f",[_calculation.y floatValue]];
    [calculationsResultLabel setText:labelText];
}

//обновить после нажатия операцииы
-(void)refreshLabelAfterOperationPress{
    NSString *labelText = [NSString stringWithFormat:@"%1.2f",[_calculation.result floatValue]];
   [calculationsResultLabel setText:labelText];
}


@end
