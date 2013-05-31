//
//  StringCalculator.m
//  StringCalulator
//
//  Created by El Nino on 5/27/13.
//  Copyright (c) 2013 El Nino. All rights reserved.
//

#import "StringCalculator.h"

@implementation StringCalculator
@synthesize delimiterString;

- (id)init
{
    self = [super init];
    if (self) {
        delimiterString = [[NSMutableString alloc] initWithFormat:@"\n,"];
    }
    return self;
}

-(NSInteger)add:(NSString *)addedString {
    NSInteger re = 0;
    if (addedString.length > 0) {
        NSCharacterSet *charSet = [NSCharacterSet characterSetWithCharactersInString:[NSString stringWithFormat:@"%@", delimiterString]];
        NSArray *subStringArray = [addedString componentsSeparatedByCharactersInSet:charSet];
        NSString *firstSubString = [subStringArray objectAtIndex:0];
        if (firstSubString.length > 2) {
            if ([[firstSubString substringWithRange:NSMakeRange(0, 2)] isEqualToString:@"//"]) {
                NSString *newDelimiter = [firstSubString substringWithRange:NSMakeRange(2, firstSubString.length - 2)];
                [delimiterString appendString:newDelimiter];
                subStringArray = [addedString componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:[NSString stringWithFormat:@"%@", delimiterString]]];
            }
        }
        for (NSString *numberString in subStringArray) {
            NSInteger number = [numberString integerValue];
            if (number < 0) {
                NSException *exception = [NSException exceptionWithName:@"negatives not allowed" reason:@"negatives not allowed" userInfo:nil];
                [exception raise];
            } else {
                re += number;
            }
        }
    }
    return  re;
}

@end
