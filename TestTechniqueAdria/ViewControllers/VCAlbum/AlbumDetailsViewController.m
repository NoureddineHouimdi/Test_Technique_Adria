//
//  AlbumDetailsViewController.m
//  TestTechniqueAdria
//
//  Created by Noureddine on 30/09/2018.
//  Copyright © 2018 Noureddine. All rights reserved.
//

#import "AlbumDetailsViewController.h"
#import "AlbumDetailsViewCell.h"
static NSString * const kCellReuseIdentifier = @"collectionViewCell";
@interface AlbumDetailsViewController ()

@end

@implementation AlbumDetailsViewController

@synthesize list;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"Details Album";
    [self remplirCollection];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//*************Methode delegué de collection View*****************************************
-(void)remplirCollection{
    // [collectionViewPack registerNib:[UINib nibWithNibName:@"CollectionViewItem" bundle:nil] forCellWithReuseIdentifier:kCellReuseIdentifier];
    collectionViewPack.backgroundColor = [UIColor clearColor];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setItemSize:CGSizeMake(123, 120)];
    flowLayout.sectionInset = UIEdgeInsetsMake(5.0, 5.0, 5.0, 5.0);
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    [collectionViewPack setCollectionViewLayout:flowLayout];
    [collectionViewPack setAllowsSelection:YES];
    collectionViewPack.delegate=self;
    [collectionViewPack reloadData];
    
}
// collection view data source methods ////////////////////////////////////
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return list.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    AlbumDetailsViewCell *cell = (AlbumDetailsViewCell *) [collectionView dequeueReusableCellWithReuseIdentifier:kCellReuseIdentifier forIndexPath:indexPath];
    
    Picture *picture=[list objectAtIndex:indexPath.row];
    [cell remplirePicture:picture];
    
    
    return cell;
}

#pragma mark - delegate methods
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    /*Background *bg=[liste objectAtIndex:indexPath.row];
     bg.bolSelected=1;
     [liste replaceObjectAtIndex:indexPath.row withObject:bg];
     for (int i=0; i<liste.count; i++) {
     Background *bg=[liste objectAtIndex:i];
     if (i!=indexPath.row) {
     bg.bolSelected=0;
     [liste replaceObjectAtIndex:i withObject:bg];
     }
     }
     [collectionViewPack reloadData];*/
}


@end
