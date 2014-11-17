//
//  ViewController.h
//  CardAnimationV2
//
//  Created by MostWanted on 11/10/14.
//  Copyright (c) 2014 yilmaz gursoy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

//IBAction Definitions
@property (strong, nonatomic) UIButton *cardButton1;
@property (strong, nonatomic) UIButton *cardButton2;
@property (strong, nonatomic) UIButton *cardButton3;
@property (strong, nonatomic) UIButton *cardButton4;

//Comp Button
@property (strong, nonatomic) UIButton *cardCompButton1;
@property (strong, nonatomic) UIButton *cardCompButton2;
@property (strong, nonatomic) UIButton *cardCompButton3;
@property (strong, nonatomic) UIButton *cardCompButton4;


//Yere düşecek kartlar
@property (strong, nonatomic) UIImageView *cardImage1;
@property (strong, nonatomic) UIImageView *cardImage2;
@property (strong, nonatomic) UIImageView *cardImage3;
@property (strong, nonatomic) UIImageView *cardImage4;

//Comp Yere Düşecek Kartlar
@property (strong, nonatomic) UIImageView *cardCompImage1;
@property (strong, nonatomic) UIImageView *cardCompImage2;
@property (strong, nonatomic) UIImageView *cardCompImage3;
@property (strong, nonatomic) UIImageView *cardCompImage4;
@end

