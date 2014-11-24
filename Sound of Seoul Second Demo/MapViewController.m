//
//  MapViewController.m
//  Sound of Seoul Second Demo
//
//  Created by Jinho Chung on 2014. 11. 16..
//  Copyright (c) 2014년 rchung. All rights reserved.
//

#import "MapViewController.h"
#import <GoogleMaps/GoogleMaps.h>
#import "PlaceInfoWindow.h"
#import "SWRevealViewController.h"
#import "Place.h"
#import "SoundMetaData.h"

/**
 홍대 : 37.550740, 126.925495
 신사동 : 37.517581, 127.019291
 */

@interface MapViewController ()

@end

@implementation MapViewController

GMSMapView *mapView_;

NSArray *locations;

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the
    
    NSArray *places = [self placeLoadFromHardcoding];
    NSArray *soundMetaDatas = [self soundMetaDataLoadFromHardCoding];
    [self mapInitialSettingWithPlaces:places];
}


- (NSArray *) placeLoadFromHardcoding
{
    NSArray *places;
    Place *place1;
    Place *place2;
    Place *place3;
    
    place1 = [[Place alloc] initWithTitle:@"1번 장소" address:@"가나다" latitude:-33.86 longitude:151.20];
    place2 = [[Place alloc] initWithTitle:@"2번 장소" address:@"가나다라" latitude:-35.86 longitude:153.20];
    place3 = [[Place alloc] initWithTitle:@"3번 장소" address:@"가나다라마바" latitude:-37.86 longitude:160.20];
    
    places = [[NSArray alloc] initWithObjects:place1, place2, place3, nil];
    
    return places;
}

- (NSArray *) soundMetaDataLoadFromHardCoding
{
    NSArray *soundMetaDatas;
    
    SoundMetaData *soundMetaData1;
    SoundMetaData *soundMetaData2;
    SoundMetaData *soundMetaData3;
    
    NSDateFormatter *mmddccyy = [[NSDateFormatter alloc] init];
    mmddccyy.timeStyle = NSDateFormatterNoStyle;
    mmddccyy.dateFormat = @"MM/dd/yyyy";
    
    soundMetaData1 = [[SoundMetaData alloc] initWithUrl:[NSURL URLWithString:@"http://r3.douban.com/201411231617/e33652adf30b864981c0510bb474b697/view/song/small/p628720.mp4"]
                                                  image:[NSURL URLWithString:@""]
                                                 length:71
                                                 userId:1
                                                adminId:0
                                              ipAddress:@"1.2.3.4"
                                                placeId:1
                                              deletedAt:[mmddccyy dateFromString:@"12/10/2005"]
                                              createdAt:[mmddccyy dateFromString:@"12/10/2005"]
                                              updatedAt:[mmddccyy dateFromString:@"12/10/2005"]];
    
    soundMetaData2 = [[SoundMetaData alloc] initWithUrl:[NSURL URLWithString:@"http://mr4.douban.com/201411231617/939f3feabd397d37cbd810524ab0678f/view/song/small/p628722.mp4"]
                                                  image:[NSURL URLWithString:@""]
                                                 length:72
                                                 userId:1
                                                adminId:0
                                              ipAddress:@"1.2.3.4"
                                                placeId:1
                                              deletedAt:[mmddccyy dateFromString:@"12/11/2006"]
                                              createdAt:[mmddccyy dateFromString:@"12/11/2006"]
                                              updatedAt:[mmddccyy dateFromString:@"12/11/2006"]];
    
    soundMetaData3 = [[SoundMetaData alloc] initWithUrl:[NSURL URLWithString:@"http://mr3.douban.com/201411231617/cfafdf7358075686b0439c841b58ecff/view/song/small/p190357.mp4"]
                                                  image:[NSURL URLWithString:@""]
                                                 length:73
                                                 userId:1
                                                adminId:0
                                              ipAddress:@"1.2.3.4"
                                                placeId:1
                                              deletedAt:[mmddccyy dateFromString:@"12/12/2007"]
                                              createdAt:[mmddccyy dateFromString:@"12/12/2007"]
                                              updatedAt:[mmddccyy dateFromString:@"12/12/2007"]];
    
    soundMetaDatas = [[NSArray alloc] initWithObjects:soundMetaData1, soundMetaData2, soundMetaData3, nil];
    
    return soundMetaDatas;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) mapInitialSettingWithPlaces:(NSArray *) places {
    
    // Create a GMSCameraPosition that tells the map to display the
    // coordinate -33.86,151.20 at zoom level 6.
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:-33.86
                                                            longitude:151.20
                                                                 zoom:6];
    mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView_.myLocationEnabled = YES;
    mapView_.delegate = self;
    mapView_.settings.myLocationButton = YES;
    mapView_.settings.indoorPicker = YES;
    mapView_.settings.compassButton = YES;
    
    self.view = mapView_;
    
    // Creates a marker in the center of the map.
    Place *place = nil;
    
    int size = [places count];
    NSLog(@"there are %d objects in the array", size);
    
    for (place in places) {
        GMSMarker *marker = [[GMSMarker alloc] init];
        marker.position = CLLocationCoordinate2DMake(place.latitude, place.longitude);
        marker.title = place.title;
        marker.snippet = place.address;
        marker.map = mapView_;
    }
    
//    GMSMarker *marker = [[GMSMarker alloc] init];
//    marker.position = CLLocationCoordinate2DMake(-33.86, 151.20);
//    marker.title = @"Sydney";
//    marker.snippet = @"Australia";
//    marker.map = mapView_;
    
    //self.navigationController.navigationBarHidden = YES;
    
    //NSLog(@"User's location: %@", mapView_.myLocation);
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - GMSMapViewDelegate
- (UIView *) mapView:(GMSMapView *)mapView markerInfoWindow:(GMSMarker *)marker
{
    PlaceInfoWindow *placeInfoWindow = [[[NSBundle mainBundle] loadNibNamed:@"PlaceInfoWindow"
                                                                      owner:self
                                                                    options:nil] objectAtIndex:0];
    
    placeInfoWindow.title.text = marker.title;
    placeInfoWindow.address.text = marker.snippet;
    // placeInfoWindow.moreButton;
    
    return placeInfoWindow;
}

@end
