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
        
        it(@"add a string with simple number", ^{
            StringCalculator *obj = [[StringCalculator alloc] init];
            NSInteger val = [obj add:@"1"];
            [[theValue(val) should] equal:theValue(1)];
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
    
    context(@"Allow the Add method to handle new lines between numbers (instead of commas).", ^{
        it(@"property delimter should have commas character in default", ^{
            StringCalculator *obj = [[StringCalculator alloc] init];
            [[theValue([obj.delimter rangeOfString:@","].length == 1) should] equal:theValue(YES)];
        });
        
        it(@"property delimter should have new line character in default", ^{
            StringCalculator *obj = [[StringCalculator alloc] init];
            [[theValue([obj.delimter rangeOfString:@"\n"].length == 1) should] equal:theValue(YES)];
        });
        
        it(@"add a string with new line character, commas as delimiter", ^{
            StringCalculator *obj = [[StringCalculator alloc] init];
            NSInteger val = [obj add:@"1,2\n3"];
            [[theValue(val) should] equal:theValue(6)];
        });
    });
    
    context(@"Support different delimiters", ^{
        it(@"property delimter should have new delimiter character", ^{
            StringCalculator *obj = [[StringCalculator alloc] init];
            [obj add:@"//#\n1"];
            [[theValue([obj.delimter rangeOfString:@"#"].location != NSNotFound) should] equal:theValue(YES)];
        });
        
        it(@"Add a string with new delimter define", ^{
            StringCalculator *obj = [[StringCalculator alloc] init];
            NSInteger val = [obj add:@"//@\n1@2@3,4\n5"];
            [[theValue(val) should] equal:theValue(15)];
        });
    });
    
    context(@"Calling Add with a negative number will throw an exception", ^{
        it(@"add a string with 3 negative numbers will throw an exeption", ^{
            [[theBlock(^{
                StringCalculator *obj = [[StringCalculator alloc] init];
                [obj add:@"1,2,-3,4,-5,-6"];
            }) should] raiseWithName:@"AddNegativeNumber" reason:@"add negative numbers:-3,-5,-6"];
        });
    });
    
    context(@"Numbers bigger than 1000 should be ignored", ^{
        it(@"add a string with number bigger than 1000", ^{
            StringCalculator *obj = [[StringCalculator alloc] init];
            NSInteger val = [obj add:@"1001,1,2"];
            [[theValue(val) should] equal:theValue(3)];
        });
    });
    
});
SPEC_END
