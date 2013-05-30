//
//  StringCalculator.h
//  StringCalulator
//
//  Created by El Nino on 5/27/13.
//  Copyright (c) 2013 El Nino. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StringCalculator : NSObject

-(NSInteger)add:(NSString *)addString;

@property (nonatomic, strong) NSString *delimiter;

@end
