//
//  Place.m
//  Sound of Seoul Second Demo
//
//  Created by rchung on 2014. 11. 23..
//  Copyright (c) 2014년 rchung. All rights reserved.
//

#import "Place.h"

@implementation Place

- (Place *)initWithTitle:(NSString *) title
             address:(NSString *) address
                latitude:(float) latitude
               longitude:(float) longitude
{
    self = [super init];
    if(self) {
        _title = title;
        _address = address;
        _latitude = latitude;
        _longitude = longitude;
    }
    return self;
}

@end
