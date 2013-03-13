//
//  DetailViewController.h
//  ScaryBugs
//
//  Created by Administrator on 3/9/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RateView.h"

@class  ScaryBugDoc;

@interface DetailViewController : UIViewController <UITextFieldDelegate, RateViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) ScaryBugDoc * detailItem;

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@property (strong, nonatomic) IBOutlet UITextField *titleField;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet RateView *rateView;
@property (strong, nonatomic) UIImagePickerController * picker;

- (IBAction)addPictureTapped:(id)sender;
- (IBAction)titleFieldTextChanged:(id)sender;
@end
