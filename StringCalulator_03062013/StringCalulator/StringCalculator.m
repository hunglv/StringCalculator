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
        
        // Negative number array
        NSMutableArray *negativeNumbers = [[NSMutableArray alloc] init];
        for (NSString *subString in subStrings) {
            if ([subString integerValue] < 0) {
                [negativeNumbers addObject:@([subString integerValue])];
                continue;
            }
            result += [subString integerValue];
        }
        if (negativeNumbers.count > 0) {
            NSString *exceptionFomat = [NSString stringWithFormat:@"add negative number:"];
            for (int i = 0; i < negativeNumbers.count; i ++) {
                NSNumber *negative = [negativeNumbers objectAtIndex:i];
                if (i == 0) {
                    exceptionFomat = [NSString stringWithFormat:@"%@%@", exceptionFomat, negative];
                    continue;
                }
                exceptionFomat = [NSString stringWithFormat:@"%@,%@", exceptionFomat, negative];                
            }
            
            NSException *exception = [NSException exceptionWithName:@"AddNegativeNumber" reason:exceptionFomat userInfo:nil];
            @throw exception;
        }
    }
    return result;
}

@end
