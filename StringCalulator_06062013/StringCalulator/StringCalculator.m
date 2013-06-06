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
    return [sumNumber integerValue];
}

@end
