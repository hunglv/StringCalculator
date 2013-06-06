//
//  StringCalculator.h
//  StringCalulator
//
//  Created by El Nino on 5/27/13.
//  Copyright (c) 2013 El Nino. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StringParser.h"
#import "Math.h"

@interface StringCalculator : NSObject

@property (nonatomic, strong) StringParser *parser;
@property (nonatomic, strong) Math *math;

- (NSInteger)add:(NSString *)addedString;

@end
