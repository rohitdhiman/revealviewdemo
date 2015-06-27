//
//  MenuModel.h
//  RevailViewDemo
//
//  Created by Rohit on 27/06/15.
//  Copyright (c) 2015 IBM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MenuModel : NSObject

@property (nonatomic, strong) NSString *menuId;
@property (nonatomic, strong) NSString *menuName;

/**
 Method to init menu model.
 @param meunuId for menuId
 @param menuName for menuName
 */
- (id)initWithMenuModel : (NSString *)andMenuId
            andMenuName : (NSString *)andMenuName;

/**
 Method for simple log
 */
-(void)simpleTestLog;

@end
