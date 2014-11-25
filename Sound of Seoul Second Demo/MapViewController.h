//
//  MapViewController.h
//  Sound of Seoul Second Demo
//
//  Created by Jinho Chung on 2014. 11. 16..
//  Copyright (c) 2014년 rchung. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>
#import "SWRevealFrontUIViewController.h"

@interface MapViewController : SWRevealFrontUIViewController <GMSMapViewDelegate>

- (IBAction) showMusicPlayerView:(id)sender;
@end
