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
    NSMutableArray *result = [[NSMutableArray alloc] init];;
    if (string.length == 0) {
        [result addObject:string];
    } else {
        NSArray *subArray = [string componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@",\n"]];
        for (NSString *numString in subArray) {
            if ([numString integerValue] != 0) {
                [result addObject:numString];
            }
        }
    }
    
    return result;
}

@end
