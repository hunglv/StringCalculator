//
//  MathTest.m
//  StringCalulator
//
//  Created by El Nino on 6/6/13.
//  Copyright (c) 2013 El Nino. All rights reserved.
//

#import "Kiwi.h"
#import "Math.h"

SPEC_BEGIN(MathTest)
describe(@"Math test", ^{
   context(@"Test funciton sumArray", ^{
       it(@"Input array with empty string object", ^{
           Math *obj = [[Math alloc] init];
           NSNumber *val = [obj sumArray:@[@""]];
           [[val should] equal:@0];
       });
       
       it(@"Input array with multiple string", ^{
           Math *obj = [[Math alloc] init];
           NSNumber *val = [obj sumArray:@[@"", @"1", @"2"]];
           [[val should] equal:@3];
       });
       
       it(@"Input array with multiple with a string bigger than 1000", ^{
           Math *obj = [[Math alloc] init];
           NSNumber *val = [obj sumArray:@[@"", @"1", @"2", @"1001"]];
           [[val should] equal:@3];
       });
   });
});
SPEC_END
