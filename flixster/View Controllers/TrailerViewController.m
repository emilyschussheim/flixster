//
//  TrailerViewController.m
//  flixster
//
//  Created by Emily Schussheim on 6/28/18.
//  Copyright © 2018 Emily Schussheim. All rights reserved.
//

#import "TrailerViewController.h"

@interface TrailerViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webVIew;
@property (weak, nonatomic) IBOutlet UILabel *movieLabel;

@end

@implementation TrailerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.movieLabel.text = self.movie[@"title"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
