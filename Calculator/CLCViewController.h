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

#warning Аутлеты не стоит показывать в *.h, их необходимо перенести в *.m и сделать как @property. Если необходимо какой-то аутлет показать наружу, то его лучше объявить в *.h как readonly, то есть @property (nonatomic, weak, readonly), чтоб нельзя было его изменить снаружи
{

    
#warning calculationsResultLabel объявлена в Storyboard как hidden. В коде ее видимость не меняется. Зачем она тогда нужна?
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

#warning Actions без надобности не стоит показывать в *.h
-(IBAction)clearResult:(id)sender;
-(IBAction)digit:(id)sender;
-(IBAction)operation:(id)sender;
-(void)enableButtons;
-(void)disableButtons;
-(void)enableEquals;


@end
