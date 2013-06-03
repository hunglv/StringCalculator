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
    });
});
SPEC_END
