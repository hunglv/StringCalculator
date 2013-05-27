//
//  StringCalculator.m
//  StringCalulator
//
//  Created by El Nino on 5/27/13.
//  Copyright (c) 2013 El Nino. All rights reserved.
//

#import "StringCalculator.h"

@implementation StringCalculator

-(NSInteger)add:(NSString *)string {
    if (string.length == 0) {
        return 0;
    } else {
        NSArray *stringAfterSplitArray = [string componentsSeparatedByString:@","];
        NSInteger result = 0;
        for (int i = 0; i < stringAfterSplitArray.count; i ++) {
            result = result + [[stringAfterSplitArray objectAtIndex:i] integerValue];
        }        
        return result;
    }
}

@end
