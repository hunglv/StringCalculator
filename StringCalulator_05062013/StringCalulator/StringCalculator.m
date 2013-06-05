//
//  StringCalculator.m
//  StringCalulator
//
//  Created by El Nino on 5/27/13.
//  Copyright (c) 2013 El Nino. All rights reserved.
//

#import "StringCalculator.h"

@implementation StringCalculator

@synthesize delimter;
- (id)init
{
    self = [super init];
    if (self) {
        delimter = [[NSMutableString alloc] initWithFormat:@"\n,"];
    }
    return self;
}

-(NSInteger)add:(NSString *)addedString {
    NSInteger re = 0;
    if (addedString.length) {
        NSArray *subStringArrFromAddedString = [addedString componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:delimter]];
        
        NSString *firstStringAfterSplit = [subStringArrFromAddedString objectAtIndex:0];
        if ([firstStringAfterSplit rangeOfString:@"//"].length == 2 && firstStringAfterSplit.length > 2) {
            
            NSArray *arrayDelimter = [[firstStringAfterSplit substringFromIndex:2] componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"[]"]];
            
            for (NSString *delimterString in arrayDelimter) {
                if (delimterString.length > 0) {
                    [delimter appendString:delimterString];
                }
            }
            subStringArrFromAddedString = [addedString componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:delimter]];
        }
        
        NSMutableArray *negativeNumbers = [[NSMutableArray alloc] init];
        
        for (NSString *stringNumber in subStringArrFromAddedString) {
            if ([stringNumber integerValue] < 0) {
                [negativeNumbers addObject:@([stringNumber integerValue])];
                continue;
            }
            if ([stringNumber integerValue] > 1000) {
                continue;
            }
            re += [stringNumber integerValue];
        }
        
        if (negativeNumbers.count > 0) {
            NSMutableString *reason = [[NSMutableString alloc] initWithFormat:@"add negative numbers:"];
            for (int i = 0; i < negativeNumbers.count; i ++) {
                if (i == 0) {
                    [reason appendFormat:@"%@", negativeNumbers[i]];
                    continue;
                }
                [reason appendFormat:@",%@", negativeNumbers[i]];
            }
           @throw ( [NSException exceptionWithName:@"AddNegativeNumber" reason:reason userInfo:nil]);
        }
    }
    return re;
}

@end
