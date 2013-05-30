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
    __block NSInteger re;
    beforeEach(^{
        object = [[StringCalculator alloc] init];
        re = -1;
    });
    
    afterEach(^{
        object = nil;
        re = -1;
    });

    context(@"Create a simple String calculator", ^{
        it(@"add an empty string", ^{
            re = [object add:@""];
            [[theValue(re) should] equal:theValue(0)];
        });
        
        it(@"add a string with simple number", ^{
            re = [object add:@"1234"];
            [[theValue(re) should] equal:theValue(1234)];
        });
        
        it(@"add a string with 2 numbers", ^{
            re = [object add:@"1,5"];
            [[theValue(re) should] equal:theValue(6)];
        });
    });
    
    context(@"Allow the Add method to handle an unknown amount of numbers", ^{
        it(@"add a string with 5 numbers", ^{
             re = [object add:@"1,2,3,4,5"];
            [[theValue(re) should] equal:theValue(15)];
        });
    });
    
    context(@"Allow the Add method to handle new lines between numbers (instead of commas)", ^{
        it(@"add a string with two line", ^{
            re = [object add:@"1\n2,3,4"];
            [[theValue(re) should] equal:theValue(10)];
        });
    });
    
    context(@"Support different delimiters", ^{
        it(@"default delimiter property is comma", ^{
            [[object.delimiter should] equal:@","];
        });
        
        it(@"add a string should change delimiter", ^{
            [object add:@"//$\n1"];
            [[object.delimiter should] equal:@"$"];
        });
        
        it(@"add a string with new delimiter", ^{
            re = [object add:@"//;;\n1;;2;;3\n3;;4;;5"];
            [[theValue(re) should] equal:theValue(18)];
        });
    });
});
SPEC_END
