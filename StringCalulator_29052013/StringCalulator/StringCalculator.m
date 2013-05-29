//
//  StringCalculator.m
//  StringCalulator
//
//  Created by El Nino on 5/27/13.
//  Copyright (c) 2013 El Nino. All rights reserved.
//

#import "StringCalculator.h"

@implementation StringCalculator

@synthesize delimiter;

- (id)init
{
    self = [super init];
    if (self) {
        delimiter = @",";
    }
    return self;
}

-(NSInteger)add:(NSString *)string {
    NSInteger result = 0;
    if (string.length == 0) {
        result = 0;
    } else {
        NSString *realString = [string copy];
        NSString *delimiterString;
        if (string.length > 4) {
            NSString *twoFirstChar = [string substringWithRange:NSMakeRange(0, 2)];
            if ([twoFirstChar isEqualToString:@"//"]) {
                NSArray *stringArrByNewLine = [string componentsSeparatedByString:@"\n"];
                delimiterString = [stringArrByNewLine objectAtIndex:0];
            }
        }
         // Change delimiter
        if (delimiterString) {
            delimiter = [delimiterString substringWithRange:NSMakeRange(2, delimiterString.length - 2)];
            realString = [string substringWithRange:NSMakeRange(delimiterString.length + 1, string.length - delimiterString.length - 1)];
        }        
        
        NSCharacterSet *charSet = [NSCharacterSet characterSetWithCharactersInString:[NSString stringWithFormat:@"\n%@", delimiter]];
        NSArray *subStrings = [realString componentsSeparatedByCharactersInSet:charSet];
        for (NSString *subString in subStrings) {
            result += [subString integerValue];
        }        
       
    }
    return  result;
}

@end
