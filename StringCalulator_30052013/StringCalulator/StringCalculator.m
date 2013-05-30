//
//  StringCalculator.m
//  StringCalulator
//
//  Created by El Nino on 5/27/13.
//  Copyright (c) 2013 El Nino. All rights reserved.
//

#import "StringCalculator.h"

@implementation StringCalculator
@synthesize delimiter = _delimiter;

- (id)init
{
    self = [super init];
    if (self) {
        _delimiter = @",";
    }
    return self;
}

-(NSInteger)add:(NSString *)addString {
    NSInteger result = 0;
    if (addString.length > 0) {
        NSString *firstTwoChar = [addString substringWithRange:NSMakeRange(0, 2)];
        NSString *realString = addString;
        if ([firstTwoChar isEqualToString:@"//"]) {
            NSArray *subRealStrings = [realString componentsSeparatedByString:@"\n"];
            NSString *firstSub = [subRealStrings objectAtIndex:0];
            NSString *newDelimiter = [firstSub substringWithRange:NSMakeRange(2, firstSub.length - 2)];
            realString = [addString substringWithRange:NSMakeRange(firstSub.length, addString.length - firstSub.length)];
            _delimiter = newDelimiter;
        }
        
        NSCharacterSet *charSet = [NSCharacterSet characterSetWithCharactersInString:[NSString stringWithFormat:@"\n%@", _delimiter]];
        NSArray *subStrings = [realString componentsSeparatedByCharactersInSet:charSet];
        for (NSString *subString in subStrings) {
            result += [subString integerValue];
        }
    }
    return result;
}

@end
