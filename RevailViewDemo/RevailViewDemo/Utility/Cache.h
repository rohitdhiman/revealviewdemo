//
//  Cache.h
//  RevailViewDemo
//
//  Created by Rohit on 02/06/15.
//  Copyright (c) 2015 IBM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Cache : NSObject

@property (nonatomic, strong) UIView *touchIntercepterView;

/**
 Designated Initilizer.
 */
+ (Cache *) cache;


/**
 Method to separate string based on comma and space
 @param paramString string to separate
 @param paramSeparator string seprator identifer
 */
+(NSArray *) seperateStringBySeperator : (NSString *)paramString
                          andSeparator : (NSString *)paramSeparator;

/**
 Push - 1
 */

- (void) cehckLog;

/**
 Push - 2
  */
-(void) showLog;
@end
