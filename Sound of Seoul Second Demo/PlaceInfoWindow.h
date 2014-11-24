//
//  PlaceInfoWindow.h
//  Sound of Seoul Second Demo
//
//  Created by rchung on 2014. 11. 23..
//  Copyright (c) 2014년 rchung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlaceInfoWindow : UIView
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UIButton *moreButton;

@end
