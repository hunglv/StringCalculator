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
    __block StringCalculator *_instance = nil;
    
    beforeAll(^{
        
    });
    
    afterAll(^{
        _instance = nil;
    });
    
    beforeEach(^{
        
    });
    
    afterEach(^{
        _instance = nil;
    });
    
    context(@"Create a simple String calculator", ^{
        it(@"add an empty string", ^{
            StringCalculator *obj = [[StringCalculator alloc] init];
            NSInteger re = [obj add:@""];
            [[theValue(re) should] equal:theValue(0)];
        });
        
        it(@"add a string with a number", ^{
            StringCalculator *obj = [[StringCalculator alloc] init];
            NSInteger re = [obj add:@"123"];
            [[theValue(re) should] equal:theValue(123)];
        });
        
        it(@"add a string with 2 numbers", ^{
            StringCalculator *obj = [[StringCalculator alloc] init];
            NSInteger re = [obj add:@"1,2"];
            [[theValue(re) should] equal:theValue(3)];
        });
    });
    
    context(@"Allow the Add method to handle an unknown amount of numbers", ^{
        it(@"add a string with 5 numbers", ^{
            StringCalculator *obj = [[StringCalculator alloc] init];
            NSInteger re = [obj add:@"1,2,3,4,5"];
            [[theValue(re) should] equal:theValue(15)];
        });
    });
    
    context(@"Allow the Add method to handle new lines between numbers (instead of commas)", ^{
        it(@"property delimiterString should have character comma in default", ^{
            StringCalculator *obj = [[StringCalculator alloc] init];
            NSRange rangeOfString = [obj.delimiterString rangeOfString:@","];
            [[theValue(rangeOfString.location != NSNotFound) should] equal:theValue(YES)];
        });
        
        it(@"add a string with new line", ^{
            StringCalculator *obj = [[StringCalculator alloc] init];
            NSInteger re = [obj add:@"1\n2,3,4\n5"];
            [[theValue(re) should] equal:theValue(15)];
        });
    });
    
    context(@"Support different delimiters", ^{
        it(@"delimiterString should contain new delimiter", ^{
            StringCalculator *obj = [[StringCalculator alloc] init];
            [obj add:@"//;\n12"];
            NSRange rangeOfString = [obj.delimiterString rangeOfString:@";"];
            [[theValue(rangeOfString.location != NSNotFound) should] equal:theValue(YES)];
        });
        
        it(@"test with new delimter", ^{
            StringCalculator *obj = [[StringCalculator alloc] init];
            NSInteger re = [obj add:@"//;\n1;2;3,4\n5,6"];
            [[theValue(re) should] equal:theValue(21)];
        });
    });
    
    context(@"Calling Add with a negative number will throw an exception “negatives not allowed”", ^{
        it(@"add a negative number", ^{
            StringCalculator *obj = [[StringCalculator alloc] init];
            [obj add:@"-1"];
            [[theBlock(^{
                [NSException exceptionWithName:@"negatives not allowed"  reason:@"negatives not allowed" userInfo:nil];
            }) should] raise];
        });
    });
});
SPEC_END
