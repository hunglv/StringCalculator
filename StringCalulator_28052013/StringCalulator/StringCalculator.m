//
//  StringCalculator.m
//  StringCalulator
//
//  Created by El Nino on 5/27/13.
//  Copyright (c) 2013 El Nino. All rights reserved.
//

#import "StringCalculator.h"

@implementation StringCalculator

-(NSInteger)add:(NSString *)string {
    if (!string.length) {
        return 0;
    } else {
        NSCharacterSet *charSet = [NSCharacterSet characterSetWithCharactersInString:@"\n,"];
        NSArray *strArray = [string componentsSeparatedByCharactersInSet:charSet];
        NSInteger result = 0;
        if (strArray.count > 1) {
            for (NSString *subString in strArray) {
                result += [subString integerValue];
            }
        } else {
            result = [string integerValue];
        }
        return result;
    }
}

@end
