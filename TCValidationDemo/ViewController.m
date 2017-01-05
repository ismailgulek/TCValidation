//
//  ViewController.m
//  TCValidation
//
//  Created by Ismail GULEK on 05/01/2017.
//  Copyright © 2017 Ismail Gulek. All rights reserved.
//

#import "ViewController.h"
#import "NSString+TCValidation.h"

@implementation ViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	[self decideTCValidationResult];
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldTextDidChange:) name:UITextFieldTextDidChangeNotification object:self.tcTextField];
}

#pragma mark - Methods

-(void) textFieldTextDidChange:(NSNotification *)notification
{
	[self decideTCValidationResult];
}

-(void) decideTCValidationResult
{
	NSString * text = [self.tcTextField.text copy];
	
	if([text isValidTCNumber])
	{
		self.resultLabel.textColor = [UIColor colorWithRed:86/255.0 green:147/255.0 blue:78/255.0 alpha:1];
		self.resultLabel.text = @"Valid";
	}
	else
	{
		self.resultLabel.textColor = [UIColor redColor];
		self.resultLabel.text = @"Not Valid!";
	}
}

#pragma mark - UITextFieldDelegate

-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
	[textField resignFirstResponder];
	
	return NO;
}

#pragma mark - Memory Management

-(void) dealloc
{
	[[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
