//
//  Math.m
//  StringCalulator
//
//  Created by El Nino on 6/6/13.
//  Copyright (c) 2013 El Nino. All rights reserved.
//

#import "Math.h"

@implementation Math

@synthesize negativeNumber;

-(NSNumber *)sumArray:(NSArray *)array {
    NSInteger val = 0;
    for (NSString *numberString in array) {
        if ([numberString integerValue] > 1000) {
            continue;
        }
        val += [numberString integerValue];
    }
    return @(val);
}

@end
