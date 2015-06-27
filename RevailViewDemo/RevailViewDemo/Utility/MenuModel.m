//
//  MenuModel.m
//  RevailViewDemo
//
//  Created by Rohit on 27/06/15.
//  Copyright (c) 2015 IBM. All rights reserved.
//

#import "MenuModel.h"

@implementation MenuModel
@synthesize menuId;
@synthesize menuName;

- (id)initWithMenuModel : (NSString *)andMenuId
            andMenuName : (NSString *)andMenuName {

    self = [super init];
    if(self) {
        self.menuId = menuId;
        self.menuName = menuName;
    }
    return self;
}

-(void)simpleAlert {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Title"
                                                    message:@"simple alert"
                                                   delegate:nil
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"OK", nil];
    [alert show];
}
@end
