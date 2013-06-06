//
//  StringParserTest.m
//  StringCalulator
//
//  Created by El Nino on 6/6/13.
//  Copyright (c) 2013 El Nino. All rights reserved.
//

#import "Kiwi.h"
#import "StringParser.h"

SPEC_BEGIN(StringParserTest)
describe(@"StringParser test", ^{
   context(@"test for funciton stringParser", ^{
       it(@"parse empty string", ^{
           StringParser *pa = [[StringParser alloc] init];
           NSArray *expect = @[@""];
           NSArray *reArray = [pa stringParser:@""];
           [[expect should] equal:reArray];
       });
       
       it(@"parse a string with commas is delimiter", ^{
           StringParser *pa = [[StringParser alloc] init];
           NSArray *expect = @[@"1", @"2", @"3"];
           NSArray *reArray = [pa stringParser:@"1,2,3"];
           [[expect should] equal:reArray];
       });
       
       it(@"parse a string with commas, new line is delimiter", ^{
           StringParser *pa = [[StringParser alloc] init];
           NSArray *expect = @[@"1", @"2", @"3"];
           NSArray *reArray = [pa stringParser:@"1\n2,3"];
           [[expect should] equal:reArray];
       });
       
       it(@"parse a string with new delimter is defined", ^{
           StringParser *pa = [[StringParser alloc] init];
           NSArray *expect = @[@"1", @"2", @"3"];
           NSArray *reArray = [pa stringParser:@"//;\n1;2,3"];
           [[expect should] equal:reArray];
       });
       
       it(@"parse a string with new multiple delimter is defined", ^{
           StringParser *pa = [[StringParser alloc] init];
           NSArray *expect = @[@"1", @"2", @"3"];
           NSArray *reArray = [pa stringParser:@"//[;;;]\n1;;;2,3"];
           [[expect should] equal:reArray];
       });
       
       it(@"parse a string with new multiple delimters are defined", ^{
           StringParser *pa = [[StringParser alloc] init];
           NSArray *expect = @[@"1", @"2", @"3", @"4"];
           NSArray *reArray = [pa stringParser:@"//[;;;][*]\n1;;;2*3,4"];
           [[expect should] equal:reArray];
       });
   });
});
SPEC_END
