//
//  AlbumDetailsViewCell.m
//  TestTechniqueAdria
//
//  Created by Noureddine on 30/09/2018.
//  Copyright © 2018 Noureddine. All rights reserved.
//

#import "AlbumDetailsViewCell.h"

@implementation AlbumDetailsViewCell
-(void)remplirePicture:(Picture *)picture{
    [imgPicture setImageWithURL:[NSURL URLWithString:picture.urlPicture] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
    } usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [imgPicture setContentMode:UIViewContentModeScaleAspectFill];
}

@end
