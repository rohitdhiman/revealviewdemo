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

- (id)initWithMenuModel : (NSString *)andMenuId
            andMenuName : (NSString *)andMenuName;

@end
