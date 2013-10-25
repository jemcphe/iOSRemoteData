//
//  CustomTableCell.h
//  Remote Data
//
//  Created by James McPherson on 10/21/13.
//  Copyright (c) 2013 James McPherson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableCell : UITableViewCell

    // Define UITextViews
    @property (weak, nonatomic) IBOutlet UILabel* nameLabel;
    @property (weak, nonatomic) IBOutlet UILabel* phoneLabel;
    @property (weak, nonatomic) IBOutlet UILabel* emailLabel;
    @property (weak, nonatomic) IBOutlet UILabel* compLabel;
    @property (weak, nonatomic) IBOutlet UILabel* statusLabel;

@end
