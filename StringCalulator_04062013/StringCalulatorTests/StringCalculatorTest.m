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
            NSInteger re = [obj add:@""];
            [[theValue(re) should] equal:theValue(0)];
        });
        
        it(@"add a string with a number", ^{
            StringCalculator *obj = [[StringCalculator alloc] init];
            NSInteger re = [obj add:@"1"];
            [[theValue(re) should] equal:theValue(1)];
        });
        
        it(@"add a string with 2 numbers", ^{
            StringCalculator *obj = [[StringCalculator alloc] init];
            NSInteger re = [obj add:@"1,2"];
            [[theValue(re) should] equal:theValue(3)];
        });
    });
    
    context(@"Allow the Add method to handle an unknown amount of numbers", ^{
        it(@"add a string with 6 numbers", ^{
            StringCalculator *obj = [[StringCalculator alloc] init];
            NSInteger re = [obj add:@"1,2,3,4,5,6"];
            [[theValue(re) should] equal:theValue(21)];
        });
    });
    
    context(@"Allow the Add method to handle new lines between numbers (instead of commas).", ^{
        it(@"default delimiter should contain commas character", ^{
            StringCalculator *obj = [[StringCalculator alloc] init];
            [[theValue( [obj.delimiters rangeOfString:@","].length == 1)  should] equal:theValue(YES)];
        });
        
        it(@"default delimter should contain new lines character", ^{
            StringCalculator *obj = [[StringCalculator alloc] init];
            [[theValue( [obj.delimiters rangeOfString:@"\n"].length == 1)  should] equal:theValue(YES)];
        });
        
        it(@"add a string with with new line character", ^{
            StringCalculator *obj = [[StringCalculator alloc] init];
            NSInteger re = [obj add:@"1,2\n3,4"];
            [[theValue(re) should] equal:theValue(10)];
        });
    });
    
    context(@"Support different delimiters", ^{
        it(@"add a string with new delimiter, delimiters should contain new delimiter", ^{
            StringCalculator *obj = [[StringCalculator alloc] init];
            [obj add:@"//;\n1"];
            [[theValue( [obj.delimiters rangeOfString:@";"].length == 1)  should] equal:theValue(YES)];
        });
        
        it(@"add a string with multiple delimters", ^{
            StringCalculator *obj = [[StringCalculator alloc] init];
            NSInteger re = [obj add:@"//$\n1$2$3$4,5,6\n7\n8\n9"];
            [[theValue(re) should] equal:theValue(45)];
        });
    });
    
    context(@"Calling Add with a negative number will throw an exception", ^{
        [[theBlock(^{
            StringCalculator *obj = [[StringCalculator alloc] init];
            [obj add:@"1,2,-3,-4,-5"];
        }) should] raiseWithName:@"AddNegativeNumbers" reason:@"add negative numbers:-3,-4,-5"];
    });
    
    context(@"Numbers bigger than 1000 should be ignored", ^{
        it(@"add a string with number bigger than 1000", ^{
            StringCalculator *obj = [[StringCalculator alloc] init];
            NSInteger re = [obj add:@"1,1001,2"];
            [[theValue(re) should] equal:theValue(3)];
        });
    });
    
    context(@"Delimiters can be of any length", ^{
        it(@"add a string with new delimiter with 3 characters", ^{
            StringCalculator *obj = [[StringCalculator alloc] init];
            [obj add:@"//[$$$]\n12"];
            [[theValue( [obj.delimiters rangeOfString:@"$$$"].location != NSNotFound)  should] equal:theValue(YES)];
        });
        
        it(@"add a string with multiple delimiter", ^{
            StringCalculator *obj = [[StringCalculator alloc] init];
            NSInteger re = [obj add:@"//[****]\n1****2****4,3"];
            [[theValue(re) should] equal:theValue(10)];
        });
    });
    
    context(@"Multiple delimter", ^{
        it(@"add a string with multiple delimter seperate by []", ^{
            StringCalculator *obj = [[StringCalculator alloc] init];
            NSInteger re = [obj add:@"//[*][%]\n1*2%4\n3"];
            [[theValue(re) should] equal:theValue(10)];
        });
    });
    
    context(@"make sure you can also handle multiple delimiters with length longer than one char", ^{
        it(@"add a string with multiple delimter with dif length seperate by []", ^{
            StringCalculator *obj = [[StringCalculator alloc] init];
            NSInteger re = [obj add:@"//[**][^^^]\n1**2^^^4\n3"];
            [[theValue(re) should] equal:theValue(10)];
        });
    });
});
SPEC_END
