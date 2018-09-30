//
//  AlbumViewController.h
//  TestTechniqueAdria
//
//  Created by Noureddine on 30/09/2018.
//  Copyright © 2018 Noureddine. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlbumViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>{
    IBOutlet UICollectionView *collectionViewPack;
    NSMutableArray *liste;
    int indice;
}
@property (nonatomic) NSString *userID;
@property (nonatomic) NSString *token;

@end
