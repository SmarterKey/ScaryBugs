//
//  DetailViewController.m
//  ScaryBugs
//
//  Created by Administrator on 3/9/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"
#import "ScaryBugDoc.h"
#import "ScaryBugData.h"
#import "UIImageExtras.h"


@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

@synthesize detailItem = _detailItem;
@synthesize detailDescriptionLabel = _detailDescriptionLabel;
@synthesize titleField = _titleField;
@synthesize imageView = _imageView;
@synthesize rateView = _rateView;
@synthesize picker = _picker;

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
    self.rateView.notSelectedImage = [UIImage imageNamed:@"shockedface2_empty.png"];
    self.rateView.halfSelectedImage = [UIImage imageNamed:@"shockedface2_half.png"];
    self.rateView.fullSelectedImage = [UIImage imageNamed:@"shockedface2_full.png"];
    self.rateView.editable = YES;
    self.rateView.maxRating = 5;
    self.rateView.delegate = self;
    
    if (self.detailItem) {
        self.titleField.text = self.detailItem.data.title;
        self.rateView.rating = self.detailItem.data.rating;
        self.imageView.image = self.detailItem.fullImage;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)viewDidUnload
{
    [self setTitleField:nil];
    [self setImageView:nil];
    [self setRateView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    self.detailDescriptionLabel = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (IBAction)addPictureTapped:(id)sender {
    if (self.picker == nil) {
        self.picker = [[UIImagePickerController alloc] init ];
        self.picker.delegate = self;
        self.picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        self.picker.allowsEditing = NO;
    }
    [self.navigationController presentModalViewController:_picker animated:YES];
}

#pragma mark UIImagePickerControllerDelegate

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissModalViewControllerAnimated:YES];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [self dismissModalViewControllerAnimated:YES];
    
    UIImage *fullImage = (UIImage *) [info objectForKey:UIImagePickerControllerOriginalImage];
    UIImage *thumbImage = [fullImage imageByScalingAndCroppingForSize:CGSizeMake(44, 44)];
    self.detailItem.fullImage = fullImage;
    self.detailItem.thumbImage = thumbImage;
    self.imageView.image = fullImage;
}


- (IBAction)titleFieldTextChanged:(id)sender {
    self.detailItem.data.title = self.titleField.text;
}

#pragma mark UITextFieldDelegate

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

#pragma mark RateViewDelegate

-(void)rateView:(RateView *)rateView ratingDidChange:(float)rating {
    self.detailItem.data.rating = rating;
}

@end
