//
//  AlbumDetailsViewController.h
//  TestTechniqueAdria
//
//  Created by Noureddine on 30/09/2018.
//  Copyright © 2018 Noureddine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "UIImageView+UIActivityIndicatorForSDWebImage.h"
@interface AlbumDetailsViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>{
    IBOutlet UICollectionView *collectionViewPack;
}
@property (nonatomic) NSMutableArray *list;

@end
