//
//  StringParser.m
//  StringCalulator
//
//  Created by El Nino on 6/6/13.
//  Copyright (c) 2013 El Nino. All rights reserved.
//

#import "StringParser.h"

@implementation StringParser

-(NSArray *)stringParser:(NSString *)string {
    NSMutableArray *result = [[NSMutableArray alloc] init];
    if (string.length == 0) {
        [result addObject:string];
    } else {
        NSMutableString *delimiterString = [[NSMutableString alloc] initWithFormat:@",\n"];
        NSArray *subArray = [string componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:delimiterString]];
        
        NSString *firstString = [subArray objectAtIndex:0];
        if (firstString.length > 2 && [firstString rangeOfString:@"//"].location != NSNotFound) {
            NSArray *arrDelimter = [firstString componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"//[]"]];
            for (NSString *delimter in arrDelimter) {
                 [delimiterString appendString:delimter];
            }           
            subArray = [string componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:delimiterString]];
        }
        for (NSString *numString in subArray) {
            if ([numString integerValue] != 0) {
                [result addObject:numString];
            }
        }
    }
    
    return result;
}

@end
