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
    }
    return result;
}

@end
