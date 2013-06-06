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
    context(@"String calculator test funcion add", ^{
        __block StringParser *parser;
        __block Math *math;
        __block StringCalculator *obj;
        __block NSString *addedString;
        
        beforeEach(^{
            parser = [StringParser mock];
            math = [Math mock];
            obj = [[StringCalculator alloc] init];
            obj.parser = parser;
            obj.math = math;
        });
        
        afterEach(^{
            parser = nil;
            math = nil;
            addedString = nil;
        });
        
        it(@"property parser, math shoud not be nil", ^{
            [obj.parser shouldNotBeNil];
            [obj.math shouldNotBeNil];
        });
        it(@"add an empty string", ^{
            addedString = @"";
            NSArray *arrayStringAfterParser = @[@""];
            [parser stub:@selector(stringParser:) andReturn:arrayStringAfterParser withArguments:addedString];
            NSInteger re = 0;
            [math stub:@selector(sumArray:) andReturn:@(re) withArguments:arrayStringAfterParser];
            
            NSInteger val = [obj add:addedString];
            [[theValue(val) should] equal:theValue(0)];            
        });
        
        it(@"add a string with 2 numbers", ^{
            addedString = @"1,2";
            NSArray *arrayStringAfterParser = @[@"1", @"2"];
            [parser stub:@selector(stringParser:) andReturn:arrayStringAfterParser withArguments:addedString];
            NSInteger re = 3;
            [math stub:@selector(sumArray:) andReturn:@(re) withArguments:arrayStringAfterParser];
            
            NSInteger val = [obj add:addedString];
            [[theValue(val) should] equal:theValue(3)];
        });
        
        it(@"add a string with 4 numbers", ^{
            addedString = @"1,2,3,4";
            NSArray *arrayStringAfterParser = @[@"1", @"2", @"3", @"4"];
            [parser stub:@selector(stringParser:) andReturn:arrayStringAfterParser withArguments:addedString];
            NSInteger re = 10;
            [math stub:@selector(sumArray:) andReturn:@(re) withArguments:arrayStringAfterParser];
            
            NSInteger val = [obj add:addedString];
            [[theValue(val) should] equal:theValue(re)];
        });
        
        it(@"add a string with new line character", ^{
            addedString = @"1,2\n3,4";
            NSArray *arrayStringAfterParser = @[@"1", @"2", @"3", @"4"];
            [parser stub:@selector(stringParser:) andReturn:arrayStringAfterParser withArguments:addedString];
            NSInteger re = 10;
            [math stub:@selector(sumArray:) andReturn:@(re) withArguments:arrayStringAfterParser];
            
            NSInteger val = [obj add:addedString];
            [[theValue(val) should] equal:theValue(re)];
        });
        
        it(@"add a string with new delimter is define character", ^{
            addedString = @"//;\n1;2\n3,4";
            NSArray *arrayStringAfterParser = @[@"1", @"2", @"3", @"4"];
            [parser stub:@selector(stringParser:) andReturn:arrayStringAfterParser withArguments:addedString];
            NSInteger re = 10;
            [math stub:@selector(sumArray:) andReturn:@(re) withArguments:arrayStringAfterParser];
            
            NSInteger val = [obj add:addedString];
            [[theValue(val) should] equal:theValue(re)];
        });
        
        it(@"add a string number bigger than 1000", ^{
            addedString = @"//;\n1;2\n3,4000";
            NSArray *arrayStringAfterParser = @[@"1", @"2", @"3", @"4000"];
            [parser stub:@selector(stringParser:) andReturn:arrayStringAfterParser withArguments:addedString];
            NSInteger re = 7;
            [math stub:@selector(sumArray:) andReturn:@(re) withArguments:arrayStringAfterParser];
            
            NSInteger val = [obj add:addedString];
            [[theValue(val) should] equal:theValue(re)];
        });
        
        it(@"add a string with new multiple delimiter is define character", ^{
            addedString = @"//[;;]\n1;;2\n3,4000";
            NSArray *arrayStringAfterParser = @[@"1", @"2", @"3", @"4000"];
            [parser stub:@selector(stringParser:) andReturn:arrayStringAfterParser withArguments:addedString];
            NSInteger re = 7;
            [math stub:@selector(sumArray:) andReturn:@(re) withArguments:arrayStringAfterParser];
            
            NSInteger val = [obj add:addedString];
            [[theValue(val) should] equal:theValue(re)];
        });
    });
});
SPEC_END
