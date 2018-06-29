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
    self.movieLabel.text = self.videoUrl;
    NSString *url = self.videoUrl;
    NSLog(@"The url in trailer view c: %@", url);
    
    // Convert the url String to a NSURL object.
    NSURL *videoNSurl = [NSURL URLWithString:self.videoUrl];
    
    // Place the URL in a URL Request.
    NSURLRequest *request = [NSURLRequest requestWithURL:videoNSurl
                                             cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                                         timeoutInterval:10.0];

    [self.webVIew loadRequest:request];
    
}

    //Create a view controller with a web view. Pass the tailer url to the web view (in prepare(forSegue)) when presenting it using a modal segue. Pass in the id from the movie you want to get the video for as a query parameter to the Get Videos endpoint. In the response back from the Get Videos endpoint, the value returned from the key, "key" is the youtube video key. For instance, in https://www.youtube.com/watch?v=SUXWAEX2jlg the key is, https://www.youtube.com/watch?v=\(key)

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
