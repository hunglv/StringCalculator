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
        __block StringCalculator *obj;
        beforeEach(^{
            obj = [[StringCalculator alloc] init];
        });
        
        afterEach(^{
            obj = nil;
        });
        it(@"add an empty string", ^{
            NSInteger val = [obj add:@""];
            [[theValue(val) should] equal:theValue(0)];
        });
        
        it(@"add a simple number", ^{
            NSInteger val = [obj add:@"123"];
            [[theValue(val) should] equal:theValue(123)];
        });
        
        it(@"add a string with 2 numbers", ^{
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
        __block StringCalculator *obj;
        beforeEach(^{
            obj = [[StringCalculator alloc] init];
        });
        
        afterEach(^{
            obj = nil;
        });
        it(@"object has property with name delimiter with default is comma string", ^{
            [obj.delimiter shouldNotBeNil];
            [[theValue(([obj.delimiter rangeOfString:@","].location != NSNotFound)) should] equal:theValue(YES)];
        });
        
        it(@"delimiter object has new line character", ^{
            [[theValue([obj.delimiter rangeOfString:@"\n"].location != NSNotFound) should] equal:theValue(YES)];
        });
        
        it(@"add a string with new lines character", ^{
            NSInteger val = [obj add:@"1\n2,3,4,5"];
            [[theValue(val) should] equal:theValue(15)];
        });
    });
    
    context(@"Support different delimiters", ^{
        __block StringCalculator *obj;
        beforeEach(^{
            obj = [[StringCalculator alloc] init];
        });
        
        afterEach(^{
            obj = nil;
        });
        it(@"will add new delimiter character", ^{
            [obj add:@"//;\n1"];
            [[theValue([obj.delimiter rangeOfString:@";"].location != NSNotFound) should] equal:theValue(YES)];
        });
        
        it(@"add a string with multiple delimiter", ^{
            NSInteger val = [obj add:@"//;\n1,2,3;4;5,6\n7\n8\n9"];
            [[theValue(val) should] equal:theValue(45)];
        });
    });
    
    context(@"Calling Add with a negative number will throw an exception “negatives not allowed”", ^{
        __block StringCalculator *obj;
        beforeEach(^{
            obj = [[StringCalculator alloc] init];
        });
        
        afterEach(^{
            obj = nil;
        });
        it(@"add a string with negative number will throw an exeption", ^{
            [[theBlock(^{
                [obj add:@"1,-2,-3"];
            }) should] raiseWithName:@"AddNegativeNumber" reason:@"add negative number:-2,-3"];
        });
    });
});
SPEC_END
