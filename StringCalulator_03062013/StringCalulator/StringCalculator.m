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
        delimiter = [NSString stringWithFormat:@",\n"];
    }
    return self;
}

-(NSInteger)add:(NSString *)addedString {
    NSInteger result = 0;
    if (addedString.length > 0) {
        NSArray *subStrings = [addedString componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:delimiter]];
        
        NSString *firstSubString = [subStrings objectAtIndex:0];
        if (firstSubString.length >= 3 && ([firstSubString rangeOfString:@"//"].location != NSNotFound)) {
            NSString *newDelimter = [firstSubString substringWithRange:NSMakeRange(2, firstSubString.length - 2)];
            delimiter = [NSString stringWithFormat:@"%@%@", delimiter, newDelimter];
            subStrings = [addedString componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:delimiter]];
        }
        
        for (NSString *subString in subStrings) {
            result += [subString integerValue];
        }
    }
    return result;
}

@end
