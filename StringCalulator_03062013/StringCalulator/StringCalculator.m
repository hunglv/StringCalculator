//
//  StringCalculator.m
//  StringCalulator
//
//  Created by El Nino on 5/27/13.
//  Copyright (c) 2013 El Nino. All rights reserved.
//

#import "StringCalculator.h"

@implementation StringCalculator

-(NSInteger)add:(NSString *)addedString {
    NSInteger result = 0;
    if (addedString.length > 0) {
        result = [addedString integerValue];
    }
    return result;
}

@end
