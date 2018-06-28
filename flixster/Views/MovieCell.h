//
//  MovieCell.h
//  flixster
//
//  Created by Emily Schussheim on 6/27/18.
//  Copyright © 2018 Emily Schussheim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *synopsisLabel;

@property (weak, nonatomic) IBOutlet UIImageView *posterView;

@end
