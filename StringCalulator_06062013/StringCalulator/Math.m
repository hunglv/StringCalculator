//
//  Math.m
//  StringCalulator
//
//  Created by El Nino on 6/6/13.
//  Copyright (c) 2013 El Nino. All rights reserved.
//

#import "Math.h"

@implementation Math

-(NSNumber *)sumArray:(NSArray *)array {
    NSInteger val = 0;
    for (NSString *numberString in array) {
        val += [numberString integerValue];
    }
    return @(val);
}

@end
