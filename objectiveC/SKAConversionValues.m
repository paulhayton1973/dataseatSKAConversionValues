//
//  SKAConverionValues.m
//  DataseatTrackingTester
//
//  Created by Paul Hayton on 01/02/2021.
//  Copyright © 2021 Paul Hayton. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SKAConversionValues.h"

@implementation SKAConversionValues

+ (void)registerAppOpen {
    
    if (@available(iOS 14.0, *)) {
        NSInteger currentValue = [[NSUserDefaults standardUserDefaults] integerForKey:@"SKAConversionValue"];
        if (currentValue == 0) {
            NSCalendar *cal = [NSCalendar currentCalendar];
            [cal setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
            NSDateComponents *dateComponents = [cal components:NSCalendarUnitWeekday fromDate:[NSDate date]];
            long weekday = [dateComponents weekday];
            [SKAdNetwork updateConversionValue:weekday & 0x07];
            // Store this value so we can update it.
            [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithLong:weekday] forKey:@"SKAConversionValue"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
    }
}

+ (void)updateConversionValue:(int)value {
    if (@available(iOS 14.0, *)) {
        NSInteger upper3Bits = (value & 0x07) << 3;
        NSInteger currentValue = [[NSUserDefaults standardUserDefaults] integerForKey:@"SKAConversionValue"];
        NSInteger lower3Bits = currentValue & 0x07;
        
        NSInteger newValue = upper3Bits | lower3Bits;
        if (newValue > currentValue) {
            [SKAdNetwork updateConversionValue:newValue];
            // Store this value so we can update it.
            [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithLong:newValue] forKey:@"SKAConversionValue"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
    }
}

@end
