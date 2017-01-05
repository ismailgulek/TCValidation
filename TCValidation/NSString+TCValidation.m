//
//  NSString+TCValidation.m
//  TCValidation
//
//  Created by Ismail GULEK on 05/01/2017.
//  Copyright © 2017 Ismail Gulek. All rights reserved.
//

#import "NSString+TCValidation.h"

@implementation NSString (TCValidation)

-(BOOL) isValidForRegexPattern:(NSString *)pattern
{
	NSError * error = nil;
	NSRegularExpression * expression = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error];
	if(error)
	{
		NSLog(@"Regular expression error: %@", error);
		return NO;
	}
	NSRange completeRange = NSMakeRange(0, self.length);
	NSRange rangeOfFirstMatch = [expression rangeOfFirstMatchInString:self options:0 range:completeRange];
	
	//	returns true if complete string matches the pattern
	return NSEqualRanges(completeRange, rangeOfFirstMatch);
}

-(BOOL) isValidTCNumber
{
	/*
	 Rules:
	 1. 11 hanelidir.
	 2. Her hanesi rakamsal değer içerir.
	 3. İlk hane 0 olamaz.
	 4. 1. 3. 5. 7. ve 9. hanelerin toplamının 7 katından, 2. 4. 6. ve 8. hanelerin toplamı çıkartıldığında, elde edilen sonucun 10’a bölümünden kalan, yani Mod 10’u bize 10. haneyi verir.
	 5. 1. 2. 3. 4. 5. 6. 7. 8. 9. ve 10. hanelerin toplamından elde edilen sonucun 10’a bölümünden kalan, yani Mod10’u bize 11. haneyi verir.
	*/
	
	//	Rule 1 & 2 & 3
	NSString * pattern = @"[1-9][0-9]{10}";
	if(![self isValidForRegexPattern:pattern])
	{
		return NO;
	}
	
	//	preparations
	NSInteger digits[11];
	
	for(NSInteger i = 0; i < 11; i++)
	{
		NSString * character = [self substringWithRange:NSMakeRange(i, 1)];
		digits[i] = [character integerValue];
	}
	
	//	Rule 4
	NSInteger sumOdd = digits[0] + digits[2] + digits[4] + digits[6] + digits[8];
	NSInteger sumEven = digits[1] + digits[3] + digits[5] + digits[7];
	
	NSInteger modValue = (sumOdd * 7 - sumEven) % 10;
	if(modValue != digits[9])
	{
		return NO;
	}
	
	//	Rule 5
	NSInteger sumFirstTen = sumOdd + sumEven + digits[9];
	NSInteger modValue2 = sumFirstTen % 10;
	if(modValue2 != digits[10])
	{
		return NO;
	}
	
	//	all rules applied, receiver is a valid TC number
	return YES;
}

@end
