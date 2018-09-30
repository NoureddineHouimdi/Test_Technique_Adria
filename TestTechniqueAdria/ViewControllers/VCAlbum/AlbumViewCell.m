//
//  AlbumViewCell.m
//  TestTechniqueAdria
//
//  Created by Noureddine on 30/09/2018.
//  Copyright © 2018 Noureddine. All rights reserved.
//

#import "AlbumViewCell.h"

@implementation AlbumViewCell
-(void)remplireAlbum:(Album *)album{
    labTitreAlbum.text=album.titreAlbum;
    [imgAlbum setImageWithURL:[NSURL URLWithString:album.urlImageAlbum] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
    } usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
}
@end
