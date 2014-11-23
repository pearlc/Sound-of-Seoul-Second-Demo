//
//  SWRevealFrontUIViewController.m
//  Sound of Seoul Second Demo
//
//  Created by rchung on 2014. 11. 18..
//  Copyright (c) 2014년 rchung. All rights reserved.
//

#import "SWRevealFrontUIViewController.h"
#import "SWRevealViewController.h"

@interface SWRevealFrontUIViewController ()

@end

@implementation SWRevealFrontUIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self swRevealViewControllerSetup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) swRevealViewControllerSetup {
    SWRevealViewController *revealViewController = self.revealViewController;
    
    UIBarButtonItem *barButtonItem = self.navigationItem.leftBarButtonItem;
    
    if ( revealViewController )
    {
        [barButtonItem setTarget: self.revealViewController];
        [barButtonItem setAction: @selector( revealToggle: )];
        [self.navigationController.navigationBar addGestureRecognizer: self.revealViewController.panGestureRecognizer];
    }
}

- (void) setNavigationBarWithTitle:(NSString *)title andBackButtonTitle:(NSString *)backbuttonTitle {
    
    self.navigationItem.title = title;
    
    if ([self.navigationItem.leftBarButtonItems count] > 0) {
        self.navigationItem.leftBarButtonItem.title = backbuttonTitle;
    } else {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:backbuttonTitle
                                                                                 style:UIBarButtonItemStylePlain
                                                                                target:self.revealViewController
                                                                                action:@selector(revealToggle:)];
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
