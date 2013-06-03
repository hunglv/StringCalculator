//
//  StringCalculatorTest.m
//  StringCalulator
//
//  Created by El Nino on 5/27/13.
//  Copyright (c) 2013 El Nino. All rights reserved.
//

#import "Kiwi.h"
#import "StringCalculator.h"

SPEC_BEGIN(StringCalculatorTest)
describe(@"StringCalculator test", ^{
    context(@"Create a simple String calculator", ^{
        it(@"add an empty string", ^{
            StringCalculator *obj = [[StringCalculator alloc] init];
            NSInteger val = [obj add:@""];
            [[theValue(val) should] equal:theValue(0)];
        });
        
        it(@"add a simple number", ^{
            StringCalculator *obj = [[StringCalculator alloc] init];
            NSInteger val = [obj add:@"123"];
            [[theValue(val) should] equal:theValue(123)];
        });
        
        it(@"add a string with 2 numbers", ^{
            StringCalculator *obj = [[StringCalculator alloc] init];
            NSInteger val = [obj add:@"1,2"];
            [[theValue(val) should] equal:theValue(3)];
        });
    });
    
    context(@"Allow the Add method to handle an unknown amount of numbers", ^{
        it(@"add a string with 5 numbers", ^{
            StringCalculator *obj = [[StringCalculator alloc] init];
            NSInteger val = [obj add:@"1,2,3,4,5"];
            [[theValue(val) should] equal:theValue(15)];
        });
    });
    
    context(@"Allow the Add method to handle new lines between numbers (instead of commas)", ^{
        it(@"object has property with name delimiter with default is comma string", ^{
            StringCalculator *obj = [[StringCalculator alloc] init];
            [obj.delimiter shouldNotBeNil];
            [[theValue(([obj.delimiter rangeOfString:@","].location != NSNotFound)) should] equal:theValue(YES)];
        });
        
        it(@"delimiter object has new line character", ^{
            StringCalculator *obj = [[StringCalculator alloc] init];
            [[theValue([obj.delimiter rangeOfString:@"\n"].location != NSNotFound) should] equal:theValue(YES)];
        });
    });
});
SPEC_END
