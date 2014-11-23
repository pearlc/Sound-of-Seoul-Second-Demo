//
//  SoundMetaData.m
//  Sound of Seoul Second Demo
//
//  Created by rchung on 2014. 11. 23..
//  Copyright (c) 2014년 rchung. All rights reserved.
//

#import "SoundMetaData.h"

@implementation SoundMetaData

- (SoundMetaData *)initWithUrl:(NSURL *)url
                         image:(NSURL *)image
                        length:(int) length
                        userId:(int) userId
                       adminId:(int) adminId
                     ipAddress:(NSString *)ipAddress
                        placeId:(int) placeId
                     deletedAt:(NSDate *)deletedAt
                     createdAt:(NSDate *)createdAt
                     updatedAt:(NSDate *)updatedAt
{

    self = [super init];
    if(self) {
        _url = url;
        _image = image;
        _length = length;
        _userId = userId;
        _adminId = adminId;
        _ipAddress = ipAddress;
        _placeId = placeId;
        _deletedAt = deletedAt;
        _createdAt = createdAt;
        _updatedAt = updatedAt;
    }
    return self;
}


@end
