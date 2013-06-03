//
//  StringCalculator.m
//  StringCalulator
//
//  Created by El Nino on 5/27/13.
//  Copyright (c) 2013 El Nino. All rights reserved.
//

#import "StringCalculator.h"

@implementation StringCalculator

-(NSInteger)add:(NSString *)addedString {
    NSInteger result = 0;
    if (addedString.length > 0) {
        NSArray *subStrings = [addedString componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@","]];
        if (subStrings.count == 1) {
            result = [addedString integerValue];
        }
        if (subStrings.count == 2) {
            result = [[subStrings objectAtIndex:0] integerValue] + [[subStrings objectAtIndex:1] integerValue];
        }
    }
    return result;
}

@end
