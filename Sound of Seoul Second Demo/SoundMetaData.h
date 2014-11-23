//
//  SoundMetaData.h
//  Sound of Seoul Second Demo
//
//  Created by rchung on 2014. 11. 23..
//  Copyright (c) 2014년 rchung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SoundMetaData : NSObject

@property int soundId;
@property NSURL *url;
@property NSURL *image;
@property int length;  // seconds
@property int userId;
@property int adminId;
@property int placeId;
@property NSString *ipAddress;
@property NSDate *deletedAt;
@property NSDate *createdAt;
@property NSDate *updatedAt;

- (SoundMetaData *)initWithUrl:(NSURL *)url
                         image:(NSURL *)image
                        length:(int) length
                        userId:(int) userId
                       adminId:(int) adminId
                     ipAddress:(NSString *)ipAddress
                        placeId:(int) placeId
                     deletedAt:(NSDate *)deletedAt
                     createdAt:(NSDate *)createdAt
                     updatedAt:(NSDate *)updatedAt;

@end
