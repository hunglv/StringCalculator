//
//  StringCalculator.m
//  StringCalulator
//
//  Created by El Nino on 5/27/13.
//  Copyright (c) 2013 El Nino. All rights reserved.
//

#import "StringCalculator.h"

@implementation StringCalculator

@synthesize parser;
@synthesize math;

- (id)init
{
    self = [super init];
    if (self) {
        parser = [[StringParser alloc] init];
        math = [[Math alloc] init];
    }
    return self;
}

- (NSInteger)add:(NSString *)addedString {
    NSArray *stringArray = [parser stringParser:addedString];
    NSNumber *sumNumber = [math sumArray:stringArray];
    
    if (math.negativeNumber.count > 0) {
        NSMutableString *reason = [[NSMutableString alloc] initWithFormat:@"negative numbers:"];
        for (int i = 0; i < math.negativeNumber.count; i ++) {
            if (i == 0) {
                [reason appendFormat:@"%@", math.negativeNumber[i]];
                continue;
            }
            [reason appendFormat:@",%@", math.negativeNumber[i]];
        }
        @throw ([NSException exceptionWithName:@"AddNegativeNumber" reason:reason userInfo:nil]);
    }
    
    return [sumNumber integerValue];
}

@end
