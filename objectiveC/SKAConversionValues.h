//
//  SKAConversionValues.h
//  DataseatTrackingTester
//
//  Created by Paul Hayton on 01/02/2021.
//  Copyright © 2021 Paul Hayton. All rights reserved.
//

#ifndef SKAConversionValues_h
#define SKAConversionValues_h

#import <AdSupport/AdSupport.h>
#import <StoreKit/StoreKit.h>

@interface SKAConversionValues : NSObject

+ (void)registerAppOpen;
+ (void)updateConversionValue:(int)value;

@end

#endif /* SKAConversionValues_h */
