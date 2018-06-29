//
//  DetailsViewController.m
//  flixster
//
//  Created by Emily Schussheim on 6/27/18.
//  Copyright © 2018 Emily Schussheim. All rights reserved.
//

#import "DetailsViewController.h"
#import "UIImageView+AFNetworking.h"
#import "TrailerViewController.h"

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *backdropView;
@property (weak, nonatomic) IBOutlet UIImageView *posterView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *synopsisLabel;
@property (weak, nonatomic) IBOutlet UIButton *trailerButton;
@property (strong, nonatomic) NSString *videoUrl;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //right off the bat
    [self fetchTrailer];
    
    NSString *baseURLString = @"https://image.tmdb.org/t/p/w500";
    NSString *posterURLString = self.movie[@"poster_path"];
    NSString *fullPosterURLString = [baseURLString stringByAppendingString:posterURLString];
    
    NSURL *posterURL = [NSURL URLWithString:fullPosterURLString];
    [self.posterView setImageWithURL:posterURL];
    
    NSString *backdropURLString = self.movie[@"backdrop_path"];
    NSString *fullBackdropURLString = [baseURLString stringByAppendingString:backdropURLString];
    
    NSURL *backdropURL = [NSURL URLWithString:fullBackdropURLString];
    [self.backdropView setImageWithURL:backdropURL];
    
    self.titleLabel.text = self.movie[@"title"];
    self.synopsisLabel.text = self.movie[@"overview"];
    
    [self.titleLabel sizeToFit];
    [self.synopsisLabel sizeToFit];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)fetchTrailer {
    
    //build the query
    NSString *idNum = [self.movie[@"id"] stringValue];
    NSLog(@"%@", idNum);
        NSString *url = (NSString *)@"https://api.themoviedb.org/3/movie/";
        NSString *buildUrl = [url stringByAppendingString:idNum];
        NSString *endUrl = @"/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed";
        NSString *fullUrl = [buildUrl stringByAppendingString:endUrl];
        NSLog(@"%@", fullUrl);
    
        NSURL *nsurl = [NSURL URLWithString:fullUrl];

        NSURLRequest *request = [NSURLRequest requestWithURL:nsurl cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10.0];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
        NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            
            if (error != nil) {
                NSLog(@"%@", [error localizedDescription]);
            }
            else {
                
                NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                 NSArray *results = dataDictionary[@"results"];
                NSString *beginning = @"https://www.youtube.com/watch?v=";
                NSString *key = results[0][@"key"];
                self.videoUrl = [beginning stringByAppendingString:key];
                NSLog(@"here's the url in details view c: %@", self.videoUrl);
            }
        }];
        [task resume];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    //Create a view controller with a web view. Pass the tailer url to the web view (in prepare(forSegue)) when presenting it using a modal segue. Pass in the id from the movie you want to get the video for as a query parameter to the Get Videos endpoint. In the response back from the Get Videos endpoint, the value returned from the key, "key" is the youtube video key. For instance, in https://www.youtube.com/watch?v=SUXWAEX2jlg the key is, https://www.youtube.com/watch?v=\(key)
    
   
    
    TrailerViewController *trailerViewController = [segue destinationViewController];
    NSString *passedUrl = self.videoUrl;
    trailerViewController.videoUrl = passedUrl;
    
}

@end
