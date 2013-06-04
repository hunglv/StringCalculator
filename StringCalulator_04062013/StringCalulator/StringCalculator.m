//
//  StringCalculator.m
//  StringCalulator
//
//  Created by El Nino on 5/27/13.
//  Copyright (c) 2013 El Nino. All rights reserved.
//

#import "StringCalculator.h"

@implementation StringCalculator

@synthesize delimiters;

- (id)init
{
    self = [super init];
    if (self) {
        delimiters = [NSString stringWithFormat:@",\n"];
    }
    return self;
}

-(NSInteger)add:(NSString *)addedString {
    NSInteger re = 0;
    if (addedString.length) {
        NSCharacterSet *delimiterCharset = [NSCharacterSet characterSetWithCharactersInString:delimiters];
        NSArray *subStrings = [addedString componentsSeparatedByCharactersInSet:delimiterCharset];
        
        NSString *firstSub = [subStrings objectAtIndex:0];
        if (firstSub.length > 2 && ([firstSub rangeOfString:@"//"].location != NSNotFound)) {
            NSString *newDelimterString = [firstSub substringWithRange:NSMakeRange(2, firstSub.length - 2)];
            NSArray *subDelimiterArray = [newDelimterString componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"[]"]];
            
            for (NSString *subDelimter in subDelimiterArray) {
                if (subDelimter.length > 0) {
                    delimiters = [NSString stringWithFormat:@"%@%@", delimiters, subDelimter];
                }
            }           
            
            delimiterCharset = [NSCharacterSet characterSetWithCharactersInString:delimiters];
            subStrings = [addedString componentsSeparatedByCharactersInSet:delimiterCharset];
        }
        
        NSMutableArray *negativeNumbers = [[NSMutableArray alloc] init];
        
        for (NSString *subString in subStrings) {
            if ([subString integerValue] < 0) {
                [negativeNumbers addObject:@([subString integerValue])];
                continue;
            }
            if ([subString integerValue] > 1000) {
                continue;
            }
            re += [subString integerValue];
        }
        
        if (negativeNumbers.count > 0) {
            NSString *reasonString = [NSString stringWithFormat:@"add negative numger:"];
            for (int i = 0; i < negativeNumbers.count; i ++) {
                NSNumber *number = [negativeNumbers objectAtIndex:i];
                if (i == 0) {
                    reasonString = [NSString stringWithFormat:@"%@%@", reasonString, number];
                    continue;
                }
                reasonString = [NSString stringWithFormat:@"%@,%@", reasonString, number];
            }
            NSException *exp = [NSException exceptionWithName:@"AddNegativeNumbers" reason:reasonString userInfo:nil];
            @throw exp;
        }
    }
    return re;
}

@end
