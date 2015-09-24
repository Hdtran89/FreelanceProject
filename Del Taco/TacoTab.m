//
//  TacoTab.m
//  Del Taco
//
//  Created by iOSDev on 9/2/15.
//  Copyright (c) 2015 United Tax. All rights reserved.
//

#import "TacoTab.h"

@implementation TacoTab
- (void)awakeFromNib {
    [self setImage:self.image]; // calls setter below to adjust image from storyboard / nib file
    self.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    
}

- (void)setImage:(UIImage *)image {
    image = [self imageWithImage:image scaledToSize:CGSizeMake(40, 40)];
    
    [super setImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    self.selectedImage = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}

- (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
