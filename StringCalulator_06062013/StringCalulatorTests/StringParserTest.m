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
   });
});
SPEC_END
