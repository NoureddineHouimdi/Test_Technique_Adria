//
//  FacebookLoginViewController.h
//  TestTechniqueAdria
//
//  Created by Noureddine on 30/09/2018.
//  Copyright © 2018 Noureddine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface FacebookLoginViewController : UIViewController {
    IBOutlet UIButton *btnGotoAlbum;
}
-(IBAction)GotoAlbum:(id)sender;

@end
