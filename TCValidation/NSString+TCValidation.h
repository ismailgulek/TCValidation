//
//  NSString+TCValidation.h
//  TCValidation
//
//  Created by Ismail GULEK on 05/01/2017.
//  Copyright © 2017 Ismail Gulek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (TCValidation)

/**
 *	Returns true if the receiver string is valid for the given regex pattern and the number of matches for whole string is 1.
*/
-(BOOL) isValidForRegexPattern:(NSString *)pattern;

/**
 *	Returns true if the receiver string is a valid TC number.
*/
-(BOOL) isValidTCNumber;

@end
