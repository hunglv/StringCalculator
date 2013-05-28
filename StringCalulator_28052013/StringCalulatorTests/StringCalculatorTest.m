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
    __block StringCalculator *object;
    beforeEach(^{
        object = [[StringCalculator alloc] init];
    });
    afterEach(^{
        object = nil;
    });
    
    context(@"Create a simple String calculator", ^{
        
        it(@"add a empty string should return 0", ^{
            NSInteger result = [object add:@""];
            [[theValue(result) should] equal:theValue(0)];
        });
        
        it(@"add a string with simple number", ^{
            NSInteger result = [object add:@"1000"];
            [[theValue(result) should] equal:theValue(1000)];
        });
        
        it(@"add a string with two number", ^{
            NSInteger result = [object add:@"1000,590"];
            [[theValue(result) should] equal:theValue(1590)];
        });
    });
    
    context(@"Allow the Add method to handle an unknown amount of numbers", ^{
        it(@"add a string with unknown amount of number ", ^{
            NSInteger result = [object add:@"100,200,500,50,30,10"];
            [[theValue(result) should] equal:theValue(890)];
        });
    });
    
    context(@"Allow the Add method to handle new lines between numbers (instead of commas)", ^{
        it(@"add a string with new line character", ^{
            NSInteger result = [object add:@"1\n2,3"];
            [[theValue(result) should] equal:theValue(6)];
        });
        
        it(@"the following input is NOT ok:  “1,\n”", ^{
            
        });
    });
    
    context(@"Support different delimiters", ^{
        
    });
    
});
SPEC_END
