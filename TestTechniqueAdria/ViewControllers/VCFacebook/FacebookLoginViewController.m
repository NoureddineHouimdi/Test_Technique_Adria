//
//  FacebookLoginViewController.m
//  TestTechniqueAdria
//
//  Created by Noureddine on 30/09/2018.
//  Copyright © 2018 Noureddine. All rights reserved.
//

#import "FacebookLoginViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "AlbumViewController.h"
@interface FacebookLoginViewController ()

@end

@implementation FacebookLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"FB Login";
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    // Optional: Place the button in the center of your view.
    loginButton.center = self.view.center;
    [self.view addSubview:loginButton];
    
    // Request Facebook permission on user's login
    loginButton.readPermissions = @[@"public_profile",@"user_photos"];
    //loginButton.readPermissions = @[@"user_photos"];
    
    
}
-(IBAction)GotoAlbum:(id)sender{
    if ([FBSDKAccessToken currentAccessToken]) {
        [self performSegueWithIdentifier:@"gotoAlbum" sender:nil];
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Information" message:@"Vous n'etes pas connecté à Facebook." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"gotoAlbum"]) {
        
        AlbumViewController *albumVC = segue.destinationViewController;
        albumVC.userID=FBSDKAccessToken.currentAccessToken.userID;
        albumVC.token=FBSDKAccessToken.currentAccessToken.tokenString;
    }
    
}

@end
