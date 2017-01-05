//
//  ViewController.h
//  TCValidation
//
//  Created by Ismail GULEK on 05/01/2017.
//  Copyright © 2017 Ismail Gulek. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UITextField	* tcTextField;
@property (nonatomic, weak) IBOutlet UILabel		* resultLabel;

@end
