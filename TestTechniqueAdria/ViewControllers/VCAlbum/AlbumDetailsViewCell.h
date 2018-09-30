//
//  AlbumDetailsViewCell.h
//  TestTechniqueAdria
//
//  Created by Noureddine on 30/09/2018.
//  Copyright © 2018 Noureddine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Picture.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "UIImageView+UIActivityIndicatorForSDWebImage.h"

@interface AlbumDetailsViewCell : UICollectionViewCell{
    IBOutlet UIImageView *imgPicture;
    
}
-(void)remplirePicture:(Picture *)picture;


@end
