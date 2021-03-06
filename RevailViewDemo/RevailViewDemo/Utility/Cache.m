//
//  Cache.m
//  RevailViewDemo
//
//  Created by Rohit on 02/06/15.
//  Copyright (c) 2015 IBM. All rights reserved.
//

#import "Cache.h"

static Cache *objCache = nil;

@implementation Cache
@synthesize touchIntercepterView = _touchIntercepterView;

+ (Cache *) cache
{
    if(objCache == nil)
    {
        objCache = [[Cache alloc] init];
    }
    return objCache;
}

+(NSArray *) seperateStringBySeperator : (NSString *)paramString
                          andSeparator : (NSString *)paramSeparator {
    NSArray *sepratedStringArray = nil;
    if ([paramSeparator isEqualToString:@" ,"]) {
        sepratedStringArray = [paramString componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@" ,"]];
        sepratedStringArray = [sepratedStringArray filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF!= ''"]];
    }
    return sepratedStringArray;
}

- (void) cehckLog {
    NSLog(@"1st log=-Push");
}

/**
 Log method
 */
-(void) showLog{
    NSLog(@"2nd Log");
}

//Comment from tempCode branch
- (void) showBasicLog {
    NSLog(@"showBasicLog");
}

//show log
- (void) showDel{
    NSLog(@"show log");
}

//hide log
- (void) hideDel{
    NSLog(@"hide log");
}

////====TempCode branch modification==//
- (void) showHello {
    NSLog(@"ShowHello");
}

@end
