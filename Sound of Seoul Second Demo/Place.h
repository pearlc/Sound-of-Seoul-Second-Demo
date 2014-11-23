//
//  Place.h
//  Sound of Seoul Second Demo
//
//  Created by rchung on 2014. 11. 23..
//  Copyright (c) 2014년 rchung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Place : NSObject

@property int placeId;
@property NSString *title;
@property NSString *address;
@property float latitude;
@property float longitude;

- (Place *)initWithTitle:(NSString *) title
                 address:(NSString *) address
                latitude:(float) latitude
               longitude:(float) longitude;

@end
