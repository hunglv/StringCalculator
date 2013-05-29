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
        it(@"add a empty string", ^{
            StringCalculator *object = [[StringCalculator alloc] init];
            NSInteger re = [object add:@""];
            [[theValue(re) should] equal:theValue(0)];
        });
        
        it(@"add a simple string with one number", ^{
            StringCalculator *object = [[StringCalculator alloc] init];
            NSInteger re = [object add:@"123"];
            [[theValue(re) should] equal:theValue(123)];
        });
        
        it(@"add a string with 2 number", ^{
            StringCalculator *object = [[StringCalculator alloc] init];
            NSInteger re = [object add:@"123, 654"];
            [[theValue(re) should] equal:theValue(777)];
        });
    });
    
    context(@"allow handle a string with unknown number", ^{
        it(@"add a string with 5 numbers", ^{
            StringCalculator *object = [[StringCalculator alloc] init];
            NSInteger re = [object add:@"1,2,3,4,5"];
            [[theValue(re) should] equal:theValue(15)];
        });
    });
    
    context(@"allow handle new line character", ^{
        it(@"add a string with new line character", ^{
            StringCalculator *object = [[StringCalculator alloc] init];
            NSInteger re = [object add:@"1\n2\n3,4"];
            [[theValue(re) should] equal:theValue(10)];
        });
    });
    
    context(@"support different delimiters", ^{
        it(@"default delimiter must equal comma character", ^{
            StringCalculator *object = [[StringCalculator alloc] init];
            [[object.delimiter should] equal:@","];
        });
        
        it(@"add a string should change delimiter", ^{
            StringCalculator *object = [[StringCalculator alloc] init];
            [object add:@"//;\n1"];
            [[object.delimiter should] equal:@";"];
        });
        
        it(@"add a string with new delimiter", ^{
            StringCalculator *object = [[StringCalculator alloc] init];
            NSInteger re = [object add:@"//$$\n1$$2$$3\n4"];
            [[theValue(re) should] equal:theValue(10)];
        });
    });
    
});
SPEC_END
