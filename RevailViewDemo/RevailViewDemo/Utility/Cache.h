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

+ (Cache *) cache;

@end