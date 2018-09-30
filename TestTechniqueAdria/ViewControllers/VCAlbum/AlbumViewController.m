//
//  AlbumViewController.m
//  TestTechniqueAdria
//
//  Created by Noureddine on 30/09/2018.
//  Copyright © 2018 Noureddine. All rights reserved.
//

#import "AlbumViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import "AlbumViewCell.h"
#import "Album.h"
#import "Picture.h"
#import "AlbumDetailsViewController.h"
#import "DejalActivityView.h"
static NSString * const kCellReuseIdentifier = @"collectionViewCell";
@interface AlbumViewController ()

@end

@implementation AlbumViewController

@synthesize userID;
@synthesize token;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"Album";
    NSLog(@"user==%@",userID);
    NSLog(@"token==%@",token);
    liste=[[NSMutableArray alloc] init];
    [self getAlbum];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getAlbum{
    [DejalBezelActivityView activityViewForView:self.view withLabel:@"Loading..."/*NSLocalizedString(@"loading", @"")*/];
    FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc]
                                  initWithGraphPath:@"/me"
                                  parameters:@{ @"fields": @"albums.fields(id,name,cover_photo.fields(name,picture,id,source),photos.fields(name,picture,source))",}
                                  HTTPMethod:@"GET"];
    [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
        //NSLog(@"resultDDDDD===%@",[result description]);
        
        NSDictionary *albums =[result objectForKey:@"albums"];
        NSDictionary *data =[albums objectForKey:@"data"];
        NSLog(@"data===%@",data);
        for (NSDictionary *dic in data){
            Album *album=[[Album alloc] init];
            album.titreAlbum=[dic objectForKey:@"name"];
            NSDictionary *cover_photo=[dic objectForKey:@"cover_photo"];
            album.urlImageAlbum=[cover_photo objectForKey:@"source"];
            NSDictionary *photos=[dic objectForKey:@"photos"];
            NSDictionary *dataphotos=[photos objectForKey:@"data"];
            album.arrayPhotos=[[NSMutableArray alloc] init];
            for (NSDictionary *dicphoto in dataphotos){
                Picture *picture=[[Picture alloc] init];
                picture.urlPicture=[dicphoto objectForKey:@"source"];
                [album.arrayPhotos addObject:picture];
            }
            [liste addObject:album];
        }
        
        //sort albums list by name
        NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"titreAlbum" ascending:YES];
        liste = [liste sortedArrayUsingDescriptors:@[sortDescriptor]].mutableCopy;
        
        [self remplirCollection];
        [collectionViewPack reloadData];
        [DejalActivityView removeView];
    }];
    
}

//*************Methode delegué de collection View*****************************************
-(void)remplirCollection{
    // [collectionViewPack registerNib:[UINib nibWithNibName:@"CollectionViewItem" bundle:nil] forCellWithReuseIdentifier:kCellReuseIdentifier];
    collectionViewPack.backgroundColor = [UIColor clearColor];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setItemSize:CGSizeMake(182, 178)];
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
    return liste.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    AlbumViewCell *cell = (AlbumViewCell *) [collectionView dequeueReusableCellWithReuseIdentifier:kCellReuseIdentifier forIndexPath:indexPath];
    
    Album *album=[liste objectAtIndex:indexPath.row];
    [cell remplireAlbum:album];
    return cell;
}

#pragma mark - delegate methods
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    indice=(int)indexPath.row;
    [self performSegueWithIdentifier:@"gotoDetails" sender:nil];
}
//-------------Fin collection view data source methods ////////////////////////////////////
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"gotoDetails"]) {
        AlbumDetailsViewController *details=segue.destinationViewController;
        Album *album=[liste objectAtIndex:indice];
        details.list=album.arrayPhotos;
        
    }
    
}
@end

