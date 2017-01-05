//
//  TCValidationDemoTests.m
//  TCValidationDemoTests
//
//  Created by Ismail GULEK on 05/01/2017.
//  Copyright © 2017 Ismail Gulek. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+TCValidation.h"

@interface TCValidationDemoTests : XCTestCase

@end

@implementation TCValidationDemoTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
	
	//	False values
	XCTAssertFalse([@"" isValidTCNumber]);
	XCTAssertFalse([@"-12dvasd)_+<>?" isValidTCNumber]);
	XCTAssertFalse([@"a" isValidTCNumber]);
	XCTAssertFalse([@"asdfgh" isValidTCNumber]);
	XCTAssertFalse([@"qwer12345678" isValidTCNumber]);
	XCTAssertFalse([@"01234567891" isValidTCNumber]);
	XCTAssertFalse([@"11111111111" isValidTCNumber]);
	XCTAssertFalse([@"12345678901" isValidTCNumber]);
	
	//	15456172348 is a valid TC
	
	//	True values
	XCTAssertTrue([@"15456172348" isValidTCNumber]);
	
	//	Additional characters besides a valid TC should break the validation
	XCTAssertFalse([@"15456172348a" isValidTCNumber]);
	XCTAssertFalse([@"15456172348)_+" isValidTCNumber]);
	XCTAssertFalse([@"154561723480" isValidTCNumber]);
	
	//	Two valid TC's concatenated should also break the validation
	XCTAssertFalse([@"1545617234815456172348" isValidTCNumber]);
}

@end
