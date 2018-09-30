//
//  AlbumViewCell.h
//  TestTechniqueAdria
//
//  Created by Noureddine on 30/09/2018.
//  Copyright © 2018 Noureddine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Album.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "UIImageView+UIActivityIndicatorForSDWebImage.h"
@interface AlbumViewCell : UICollectionViewCell{
    IBOutlet UIImageView *imgAlbum;
    IBOutlet UILabel *labTitreAlbum;
}
-(void)remplireAlbum:(Album *)album;
@end
