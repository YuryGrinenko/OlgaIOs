//
//  CLCViewController.h
//  Calculator
//
//  Created by Ольга Николаева on 08.07.14.
//  Copyright (c) 2014 Internship. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CLCMath.h"

@interface CLCViewController : UIViewController
{
 IBOutlet UILabel *calculationsResultLabel;
 IBOutlet UILabel *expressionLabel;
 IBOutlet UIButton *plusMinusButton;
 IBOutlet UIButton *percentButton;
 IBOutlet UIButton *divideButton;
 IBOutlet UIButton *multyplyButton;
 IBOutlet UIButton *minusButton;
 IBOutlet UIButton *plusButton;
 IBOutlet UIButton *equalButton;
 IBOutlet UIButton *cButton;
}
-(IBAction)clearResult:(id)sender;
-(IBAction)digit:(id)sender;
-(IBAction)operation:(id)sender;
-(void)enableButtons;
-(void)disableButtons;
-(void)enableEquals;


@end
