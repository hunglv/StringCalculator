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
        __block StringCalculator *_object;
        beforeEach(^{
            _object = [[StringCalculator alloc] init];
        });
        
        afterEach(^{
            _object = nil;
        });
        
        it(@"Object is an instance of StringCalculator class must be exist", ^{
            [_object shouldNotBeNil];
        });
        it(@"add with empty string", ^{
            NSInteger result = [_object add:@""];
            [[theValue(result) should] equal:theValue(0)];
        });
        
        it(@"add a string with simple number", ^{
            NSInteger result = [_object add:@"10"];
            [[theValue(result) should] equal:theValue(10)];
        });
        
        it(@"add a string with two number delimiter by ,", ^{
            NSInteger result = [_object add:@"10, 1"];
            [[theValue(result) should] equal:theValue(11)];
        });
    });
    context(@"Allow the Add method to handle an unknown amount of numbers", ^{
        it(@"add a string with 5 number", ^{
            StringCalculator *object = [[StringCalculator alloc] init];
            NSInteger result = [object add:@"0,1,2,3,40"];
            [[theValue(result) should] equal:theValue(46)];
        });
    });
    context(@"Allow the Add method to handle new lines between numbers (instead of commas)", ^{
        it(@"add a string with 3 number", ^{
            StringCalculator *object = [[StringCalculator alloc] init];
            NSInteger result = [object add:@"1\n2,3"];
            [[theValue(result) should] equal:theValue(6)];
        });
    });
    context(@"Support different delimiters", ^{
        
    });
    context(@"Calling Add with a negative number will throw an exception “negatives not allowed” - and the negative that was passed", ^{
        
    });
    
});
SPEC_END
