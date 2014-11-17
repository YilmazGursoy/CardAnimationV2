//
//  ViewController.m
//  CardAnimationV2
//
//  Created by MostWanted on 11/10/14.
//  Copyright (c) 2014 yilmaz gursoy. All rights reserved.
//

#import "ViewController.h"
#define RadToDeg(angle) ((M_PI*angle)/180.0)
@interface ViewController ()
@property (strong, nonatomic) NSMutableArray *YerdekiKartlar;
@property (nonatomic) int Counter;
@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) NSMutableArray *AllCompButtons;
@property (strong, nonatomic) NSMutableArray *randomNumbersArray;
@property (nonatomic) int Controller;
@end

@implementation ViewController
-(NSMutableArray *)randomNumbersArray{
    if(!_randomNumbersArray) _randomNumbersArray=[[NSMutableArray alloc]init];
    return _randomNumbersArray;
}
-(NSMutableArray *)AllCompButtons{
    if(!_AllCompButtons) _AllCompButtons=[[NSMutableArray alloc]init];
    return _AllCompButtons;
}
-(NSMutableArray *)YerdekiKartlar{
    if(!_YerdekiKartlar) _YerdekiKartlar=[[NSMutableArray alloc]init];
    return _YerdekiKartlar;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.Controller=1;
    [self setButtonFunctions];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark-CardButtonDefinitions
-(void)setButtonFunctions{
    //Frame ataması ve kartların tanıtılması
    self.cardButton1=[[UIButton alloc]initWithFrame:CGRectMake(105, 399, 111, 151)];
    self.cardButton2=[[UIButton alloc]initWithFrame:CGRectMake(105, 390, 111, 151)];
    self.cardButton3=[[UIButton alloc]initWithFrame:CGRectMake(105, 390, 111, 151)];
    self.cardButton4=[[UIButton alloc]initWithFrame:CGRectMake(105, 399, 111, 151)];
    self.cardCompButton1=[[UIButton alloc]initWithFrame:CGRectMake(105, -9, 65, 89)];
    self.cardCompButton2=[[UIButton alloc]initWithFrame:CGRectMake(105, 0, 65, 89)];
    self.cardCompButton3=[[UIButton alloc]initWithFrame:CGRectMake(105, 0, 65, 89)];
    self.cardCompButton4=[[UIButton alloc]initWithFrame:CGRectMake(105, -9, 65, 89)];
    
    
    
    //Kartlara fonksiyon ve gorev verimi
    [self.cardButton1 addTarget:self action:@selector(cardButton1Pressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.cardButton1 actionsForTarget:self forControlEvent:UIControlEventTouchUpInside];
    
    [self.cardButton2 addTarget:self action:@selector(cardButton2Pressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.cardButton2 actionsForTarget:self forControlEvent:UIControlEventTouchUpInside];
    
    [self.cardButton3 addTarget:self action:@selector(cardButton3Pressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.cardButton3 actionsForTarget:self forControlEvent:UIControlEventTouchUpInside];
    
    [self.cardButton4 addTarget:self action:@selector(cardButton4Pressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.cardButton4 actionsForTarget:self forControlEvent:UIControlEventTouchUpInside];
    
    //Bilgisayarın Kartlarının Fonksiyon Ve Görevleri
    [self.cardCompButton1 actionsForTarget:self forControlEvent:UIControlEventTouchUpInside];
    [self.cardCompButton2 actionsForTarget:self forControlEvent:UIControlEventTouchUpInside];
    [self.cardCompButton3 actionsForTarget:self forControlEvent:UIControlEventTouchUpInside];
    [self.cardCompButton4 actionsForTarget:self forControlEvent:UIControlEventTouchUpInside];
    
    //Buttonların Grafikksel ozellikleri

    self.cardButton1.backgroundColor=[UIColor greenColor];
    self.cardButton2.backgroundColor=[UIColor yellowColor];
    self.cardButton3.backgroundColor=[UIColor redColor];
    self.cardButton4.backgroundColor=[UIColor purpleColor];
    
    //Bilgisayarın Buttonlarının Grafiksel Ozellikleri
    self.cardCompButton1.backgroundColor=[UIColor cyanColor];
    self.cardCompButton2.backgroundColor=[UIColor magentaColor];
    self.cardCompButton3.backgroundColor=[UIColor orangeColor];
    self.cardCompButton4.backgroundColor=[UIColor grayColor];
    
    //Köşe noktalarının ovalleştirilmesi
    self.cardButton1.layer.cornerRadius=10;
    self.cardButton2.layer.cornerRadius=10;
    self.cardButton3.layer.cornerRadius=10;
    self.cardButton4.layer.cornerRadius=10;
    
    //Köşe Noktaları Bilgisayarın Kartları
    self.cardCompButton1.layer.cornerRadius=10;
    self.cardCompButton2.layer.cornerRadius=10;
    self.cardCompButton3.layer.cornerRadius=10;
    self.cardCompButton4.layer.cornerRadius=10;
    
    //Gölgelendirme Rengi her Button için
    self.cardButton1.layer.shadowColor=[UIColor blackColor].CGColor;
    self.cardButton2.layer.shadowColor=[UIColor blackColor].CGColor;
    self.cardButton3.layer.shadowColor=[UIColor blackColor].CGColor;
    self.cardButton4.layer.shadowColor=[UIColor blackColor].CGColor;
    
    //Gölgelendirme Bilgisayarın Buttonları için
    self.cardCompButton1.layer.shadowColor=[UIColor blackColor].CGColor;
    self.cardCompButton2.layer.shadowColor=[UIColor blackColor].CGColor;
    self.cardCompButton3.layer.shadowColor=[UIColor blackColor].CGColor;
    self.cardCompButton4.layer.shadowColor=[UIColor blackColor].CGColor;
    
    //Gölgelendirme miktarı her button için
    self.cardButton1.layer.shadowOpacity=0.5;
    self.cardButton2.layer.shadowOpacity=0.5;
    self.cardButton3.layer.shadowOpacity=0.5;
    self.cardButton4.layer.shadowOpacity=0.5;
    [self KartlarinAcilmasi];
    
    //Gmlgelendirme Miktarı Bilgisayarın Her Buttonu için
    self.cardCompButton1.layer.shadowOpacity=0.5;
    self.cardCompButton2.layer.shadowOpacity=0.5;
    self.cardCompButton3.layer.shadowOpacity=0.5;
    self.cardCompButton4.layer.shadowOpacity=0.5;
    [self CompKartlarinAcilmasi];
    
    //Buttonların Ekrana Eklenilmesi
    [self.view addSubview:self.cardButton1];
    [self.view addSubview:self.cardButton2];
    [self.view addSubview:self.cardButton3];
    [self.view addSubview:self.cardButton4];
    
    //BilgisayarınButtonlarının Ekrana Eklenilmesi
    [self.AllCompButtons addObject:self.cardCompButton1];
    [self.AllCompButtons addObject:self.cardCompButton2];
    [self.AllCompButtons addObject:self.cardCompButton3];
    [self.AllCompButtons addObject:self.cardCompButton4];
    
    [self.view addSubview:self.cardCompButton1];
    [self.view addSubview:self.cardCompButton2];
    [self.view addSubview:self.cardCompButton3];
    [self.view addSubview:self.cardCompButton4];
}




#pragma mark-ButtonPressedFunctions
-(void)cardButton1Pressed:(UIButton*)button
{
    if(self.Controller==1){
        self.cardButton1.hidden=YES;
        self.cardImage1.hidden=NO;
        [self.cardImage1.layer setAnchorPoint:CGPointMake(0.5, 0.5)];
        [self.view bringSubviewToFront:self.cardImage1];
        int RandSayiButton1=(int)(arc4random() % 130) - 110;
        [UIImageView animateWithDuration:1 animations:^{
            self.cardImage1.layer.bounds=CGRectMake(0, 0, 67, 92);
            self.cardImage1.layer.position=CGPointMake(self.view.center.x,self.view.center.y);
            [self.cardImage1 setTransform:CGAffineTransformMakeRotation(RadToDeg(RandSayiButton1))];
        }completion:^(BOOL finished) {
            [self karsiElinHamlesi];
        }];
        [self.YerdekiKartlar addObject:self.cardImage1];
        self.Controller=0;
    }

    }
-(void)cardButton2Pressed:(UIButton*)button
{
    if(self.Controller==1){
        self.cardButton2.hidden=YES;
        self.cardImage2.hidden=NO;
        [self.cardImage2.layer setAnchorPoint:CGPointMake(0.5, 0.5)];
        [self.view bringSubviewToFront:self.cardImage2];
        int RandSayiButton2=(int)(arc4random() % 140) - 110;
        [UIImageView animateWithDuration:1 animations:^{
            self.cardImage2.layer.bounds=CGRectMake(0, 0, 67, 92);
            self.cardImage2.layer.position=CGPointMake(self.view.center.x,self.view.center.y);
            [self.cardImage2 setTransform:CGAffineTransformMakeRotation(RadToDeg(RandSayiButton2))];
        }completion:^(BOOL finished) {
            [self karsiElinHamlesi];
        }];
        [self.YerdekiKartlar addObject:self.cardImage2];
        self.Controller=0;
    }
    }
-(void)cardButton3Pressed:(UIButton*)button
{
    if(self.Controller==1){
        self.cardButton3.hidden=YES;
        self.cardImage3.hidden=NO;
        [self.cardImage3.layer setAnchorPoint:CGPointMake(0.5, 0.5)];
        [self.view bringSubviewToFront:self.cardImage3];
        int RandSayiButton3=(int)(arc4random() % 100) - 36;
        [UIImageView animateWithDuration:1 animations:^{
            self.cardImage3.layer.bounds=CGRectMake(0, 0, 67, 92);
            self.cardImage3.layer.position=CGPointMake(self.view.center.x,self.view.center.y);
            [self.cardImage3 setTransform:CGAffineTransformMakeRotation(RadToDeg(RandSayiButton3))];
        }completion:^(BOOL finished) {
            [self karsiElinHamlesi];
        }];
        [self.YerdekiKartlar addObject:self.cardImage3];
        self.Controller=0;
    }
    
}
-(void)cardButton4Pressed:(UIButton*)button
{
    if(self.Controller==1){
        self.cardButton4.hidden=YES;
        self.cardImage4.hidden=NO;
        [self.cardImage4.layer setAnchorPoint:CGPointMake(0.5, 0.5)];
        [self.view bringSubviewToFront:self.cardImage4];
        int RandSayiButton4=(int)(arc4random() % 100) - 10;
        [UIImageView animateWithDuration:1 animations:^{
            self.cardImage4.layer.bounds=CGRectMake(0, 0, 67, 92);
            self.cardImage4.layer.position=CGPointMake(self.view.center.x,self.view.center.y);
            [self.cardImage4 setTransform:CGAffineTransformMakeRotation(RadToDeg(RandSayiButton4))];
        }completion:^(BOOL finished) {
            [self karsiElinHamlesi];
        }];
        [self.YerdekiKartlar addObject:self.cardImage4];
        self.Controller=0;
    }
}



#pragma mark-ElimizdekiKartlarinAcilmasi
-(void)KartlarinAcilmasi{
    self.cardButton1.hidden=NO;
    self.cardButton2.hidden=NO;
    self.cardButton3.hidden=NO;
    self.cardButton4.hidden=NO;
    
    [self.cardButton1 setTransform:CGAffineTransformMakeRotation(RadToDeg(0))];
    [self.cardButton2 setTransform:CGAffineTransformMakeRotation(RadToDeg(0))];
    [self.cardButton3 setTransform:CGAffineTransformMakeRotation(RadToDeg(0))];
    [self.cardButton4 setTransform:CGAffineTransformMakeRotation(RadToDeg(0))];
    
    [self.cardButton1 setFrame:CGRectMake(105, 399, 111, 151)];
    [self.cardButton2 setFrame:CGRectMake(105, 399, 111, 151)];
    [self.cardButton3 setFrame:CGRectMake(105, 399, 111, 151)];
    [self.cardButton4 setFrame:CGRectMake(105, 399, 111, 151)];
    
    
    [self.cardButton1.layer setAnchorPoint:CGPointMake(0.5, 0.5)];
    [UIButton animateWithDuration:1 animations:^{
        [self.cardButton1 setFrame:CGRectMake(40, 399, 111, 151)];
        [self.cardButton1 setTransform:CGAffineTransformMakeRotation(RadToDeg(-25))];
    }];
    self.cardImage1=[[UIImageView alloc]initWithFrame:CGRectMake(40, 399, 111, 151)];
    //Atılacak KartImageView
    [self.cardImage1 setTransform:CGAffineTransformMakeRotation(RadToDeg(-25))];
    self.cardImage1.backgroundColor=[UIColor greenColor];
    self.cardImage1.layer.cornerRadius=10;
    self.cardImage1.hidden=YES;
    [self.view addSubview:self.cardImage1];
    
    
    [self.cardButton2.layer setAnchorPoint:CGPointMake(0.5, 0.5)];
    [UIButton animateWithDuration:1 animations:^{
        [self.cardButton2 setFrame:CGRectMake(85, 390, 111, 151)];
        [self.cardButton2 setTransform:CGAffineTransformMakeRotation(RadToDeg(-15))];
    }];
    self.cardImage2=[[UIImageView alloc]initWithFrame:CGRectMake(85, 390, 111, 151)];
    
    //Atılacak KartImageView
    
    [self.cardImage2 setTransform:CGAffineTransformMakeRotation(RadToDeg(-15))];
    self.cardImage2.backgroundColor=[UIColor yellowColor];
    self.cardImage2.layer.cornerRadius=10;
    self.cardImage2.hidden=YES;
    [self.view addSubview:self.cardImage2];
    
    
    
    
    [self.cardButton3.layer setAnchorPoint:CGPointMake(0.5, 0.5)];
    [UIButton animateWithDuration:1 animations:^{
        [self.cardButton3 setFrame:CGRectMake(130, 390, 111, 151)];
        [self.cardButton3 setTransform:CGAffineTransformMakeRotation(RadToDeg(15))];
    }];
    self.cardImage3=[[UIImageView alloc]initWithFrame:CGRectMake(130, 390, 111, 151)];
    //Atılacak KartImageView
    [self.cardImage3 setTransform:CGAffineTransformMakeRotation(RadToDeg(15))];
    self.cardImage3.backgroundColor=[UIColor redColor];
    self.cardImage3.layer.cornerRadius=10;
    self.cardImage3.hidden=YES;
    [self.view addSubview:self.cardImage3];
    
    
    
    
    [self.cardButton4.layer setAnchorPoint:CGPointMake(0.5, 0.5)];
    [UIButton animateWithDuration:1 animations:^{
        [self.cardButton4 setFrame:CGRectMake(175, 399, 111, 151)];
        [self.cardButton4 setTransform:CGAffineTransformMakeRotation(RadToDeg(25))];
    }];
    self.cardImage4=[[UIImageView alloc]initWithFrame:CGRectMake(175, 399, 111, 151)];
    //Atılacak KartImageView
    [self.cardImage4 setTransform:CGAffineTransformMakeRotation(RadToDeg(25))];
    self.cardImage4.backgroundColor=[UIColor purpleColor];
    self.cardImage4.layer.cornerRadius=10;
    self.cardImage4.hidden=YES;
    [self.view addSubview:self.cardImage4];
    
    
    
}
- (IBAction)buttonPressed:(UIButton *)sender {
    [self CompKartlarinAcilmasi];
    [self KartlarinAcilmasi];
}
- (IBAction)YerdekiKartlarRakibe:(UIButton *)sender {
    self.Counter=(int)self.YerdekiKartlar.count;
    self.timer=[NSTimer scheduledTimerWithTimeInterval:0.04 target:self selector:@selector(kartHareketleriRakibin) userInfo:nil repeats:YES];
    
}
- (IBAction)yerdekiKartlarBana:(UIButton *)sender {
    self.Counter=(int)self.YerdekiKartlar.count;
    self.timer=[NSTimer scheduledTimerWithTimeInterval:0.04 target:self selector:@selector(kartHareketleriOyuncunun) userInfo:nil repeats:YES];
    
}
-(void)kartHareketleriOyuncunun{
   static int abc=0;
    if(abc>self.YerdekiKartlar.count) abc=0;
    if([self.YerdekiKartlar count]>0){
        UIImageView *imageView=self.YerdekiKartlar[abc];
        [UIImageView animateWithDuration:0.8 animations:^{
            imageView.layer.position=CGPointMake(105,700);
        }completion:^(BOOL finished) {
            }];
    }
    abc++;
    if(abc==[self.YerdekiKartlar count]){
        [self.timer invalidate];
        self.YerdekiKartlar=nil;
    }

}
-(void)kartHareketleriRakibin{
    static int abc=0;
    if(abc>self.YerdekiKartlar.count) abc=0;
    if([self.YerdekiKartlar count]>0){
        UIImageView *imageView=self.YerdekiKartlar[abc];
        [UIImageView animateWithDuration:0.8 animations:^{
            imageView.layer.position=CGPointMake(105,-100);
        }completion:^(BOOL finished) {
            abc++;
            if(abc==[self.YerdekiKartlar count]){
                [self.timer invalidate];
                self.YerdekiKartlar=nil;
            }
            
        }];
    }
}
-(void)CompKartlarinAcilmasi{
    self.randomNumbersArray=[self RandomcardsComp];
    self.cardCompButton1.hidden=NO;
    self.cardCompButton2.hidden=NO;
    self.cardCompButton3.hidden=NO;
    self.cardCompButton4.hidden=NO;
    
    [self.cardCompButton1 setTransform:CGAffineTransformMakeRotation(RadToDeg(0))];
    [self.cardCompButton2 setTransform:CGAffineTransformMakeRotation(RadToDeg(0))];
    [self.cardCompButton3 setTransform:CGAffineTransformMakeRotation(RadToDeg(0))];
    [self.cardCompButton4 setTransform:CGAffineTransformMakeRotation(RadToDeg(0))];
    
    [self.cardCompButton1 setFrame:CGRectMake(105, -6, 65, 89)];
    [self.cardCompButton2 setFrame:CGRectMake(105, 0, 65, 89)];
    [self.cardCompButton3 setFrame:CGRectMake(105, 0, 65, 89)];
    [self.cardCompButton4 setFrame:CGRectMake(105, -6, 65, 89)];
    
    
    [self.cardCompButton1.layer setAnchorPoint:CGPointMake(0.5, 0.5)];
    [UIButton animateWithDuration:1 animations:^{
        [self.cardCompButton1 setFrame:CGRectMake(80, -6, 65, 89)];
        [self.cardCompButton1 setTransform:CGAffineTransformMakeRotation(RadToDeg(25))];
    }];
    self.cardCompImage1=[[UIImageView alloc]initWithFrame:CGRectMake(80,-6, 65,89)];
    //Atılacak KartImageView
    [self.cardCompImage1 setTransform:CGAffineTransformMakeRotation(RadToDeg(25))];
    self.cardCompImage1.backgroundColor=[UIColor cyanColor];
    self.cardCompImage1.layer.cornerRadius=10;
    self.cardCompImage1.hidden=YES;
    [self.view addSubview:self.cardCompImage1];
    
    
    
    
    
    [self.cardCompButton2.layer setAnchorPoint:CGPointMake(0.5, 0.5)];
    [UIButton animateWithDuration:1 animations:^{
        [self.cardCompButton2 setFrame:CGRectMake(112, 0, 65, 89)];
        [self.cardCompButton2 setTransform:CGAffineTransformMakeRotation(RadToDeg(15))];
    }];
    self.cardCompImage2=[[UIImageView alloc]initWithFrame:CGRectMake(112,0, 65,89)];
    //Atılacak KartImageView
    [self.cardCompImage2 setTransform:CGAffineTransformMakeRotation(RadToDeg(15))];
    self.cardCompImage2.backgroundColor=[UIColor magentaColor];
    self.cardCompImage2.layer.cornerRadius=10;
    self.cardCompImage2.hidden=YES;
    [self.view addSubview:self.cardCompImage2];
    
    
    
    
    
    
    [self.cardCompButton3.layer setAnchorPoint:CGPointMake(0.5, 0.5)];
    [UIButton animateWithDuration:1 animations:^{
        [self.cardCompButton3 setFrame:CGRectMake(144, 0, 65, 89)];
        [self.cardCompButton3 setTransform:CGAffineTransformMakeRotation(RadToDeg(-15))];
    }];
    self.cardCompImage3=[[UIImageView alloc]initWithFrame:CGRectMake(144,0, 65,89)];
    //Atılacak KartImageView
    [self.cardCompImage3 setTransform:CGAffineTransformMakeRotation(RadToDeg(-15))];
    self.cardCompImage3.backgroundColor=[UIColor orangeColor];
    self.cardCompImage3.layer.cornerRadius=10;
    self.cardCompImage3.hidden=YES;
    [self.view addSubview:self.cardCompImage3];
    
    
    
    
    
    
    
    
    [self.cardCompButton4.layer setAnchorPoint:CGPointMake(0.5, 0.5)];
    [UIButton animateWithDuration:1 animations:^{
        [self.cardCompButton4 setFrame:CGRectMake(176, -6, 65, 89)];
        [self.cardCompButton4 setTransform:CGAffineTransformMakeRotation(RadToDeg(-25))];
    }];
    self.cardCompImage4=[[UIImageView alloc]initWithFrame:CGRectMake(176,-6, 65,89)];
    //Atılacak KartImageView
    [self.cardCompImage4 setTransform:CGAffineTransformMakeRotation(RadToDeg(-25))];
    self.cardCompImage4.backgroundColor=[UIColor grayColor];
    self.cardCompImage4.layer.cornerRadius=10;
    self.cardCompImage4.hidden=YES;
    [self.view addSubview:self.cardCompImage4];
    
}
-(void)karsiElinHamlesi{
    static int i=0;
    
    int ButtonNumber=[self.randomNumbersArray[i] intValue];
    UIButton *button=self.AllCompButtons[ButtonNumber];

    if([button.backgroundColor isEqual:[UIColor cyanColor]]){
        NSLog(@"Hello1");
        self.cardCompButton1.hidden=YES;
        self.cardCompImage1.hidden=NO;
        [self.cardCompImage1.layer setAnchorPoint:CGPointMake(0.5, 0.5)];
        [self.view bringSubviewToFront:self.cardCompImage1];
        int RandSayiButton3=(int)(arc4random() % 100) - 36;
        [UIImageView animateWithDuration:1 animations:^{
            self.cardCompImage1.layer.bounds=CGRectMake(0, 0, 67, 92);
            self.cardCompImage1.layer.position=CGPointMake(self.view.center.x,self.view.center.y);
            [self.cardCompImage1 setTransform:CGAffineTransformMakeRotation(RadToDeg(RandSayiButton3))];
        }completion:^(BOOL finished) {
                    self.Controller=1;
        }];
        [self.YerdekiKartlar addObject:self.cardCompImage1];

    }

    
    
    
    if([button.backgroundColor isEqual:[UIColor magentaColor]]){
        NSLog(@"Hello2");
        self.cardCompButton2.hidden=YES;
        self.cardCompImage2.hidden=NO;
        [self.cardCompImage2.layer setAnchorPoint:CGPointMake(0.5, 0.5)];
        [self.view bringSubviewToFront:self.cardCompImage2];
        int RandSayiButton3=(int)(arc4random() % 100) - 36;
        [UIImageView animateWithDuration:1 animations:^{
            self.cardCompImage2.layer.bounds=CGRectMake(0, 0, 67, 92);
            self.cardCompImage2.layer.position=CGPointMake(self.view.center.x,self.view.center.y);
            [self.cardCompImage2 setTransform:CGAffineTransformMakeRotation(RadToDeg(RandSayiButton3))];
        }completion:^(BOOL finished) {
                    self.Controller=1;
        }];
        [self.YerdekiKartlar addObject:self.cardCompImage2];

    }

    
    
    if([button.backgroundColor isEqual:[UIColor orangeColor]]){
        NSLog(@"Hello3");
        self.cardCompButton3.hidden=YES;
        self.cardCompImage3.hidden=NO;
        [self.cardCompImage3.layer setAnchorPoint:CGPointMake(0.5, 0.5)];
        [self.view bringSubviewToFront:self.cardCompImage3];
        int RandSayiButton3=(int)(arc4random() % 100) - 36;
        [UIImageView animateWithDuration:1 animations:^{
            self.cardCompImage3.layer.bounds=CGRectMake(0, 0, 67, 92);
            self.cardCompImage3.layer.position=CGPointMake(self.view.center.x,self.view.center.y);
            [self.cardCompImage3 setTransform:CGAffineTransformMakeRotation(RadToDeg(RandSayiButton3))];
        }completion:^(BOOL finished) {
                    self.Controller=1;
        }];
        [self.YerdekiKartlar addObject:self.cardCompImage3];

    }

    
    
    if([button.backgroundColor isEqual:[UIColor grayColor]]){
        NSLog(@"Hello4");
        self.cardCompButton4.hidden=YES;
        self.cardCompImage4.hidden=NO;
        [self.cardCompImage4.layer setAnchorPoint:CGPointMake(0.5, 0.5)];
        [self.view bringSubviewToFront:self.cardCompImage4];
        int RandSayiButton3=(int)(arc4random() % 100) - 36;
        [UIImageView animateWithDuration:1 animations:^{
            self.cardCompImage4.layer.bounds=CGRectMake(0, 0, 67, 92);
            self.cardCompImage4.layer.position=CGPointMake(self.view.center.x,self.view.center.y);
            [self.cardCompImage4 setTransform:CGAffineTransformMakeRotation(RadToDeg(RandSayiButton3))];
        }completion:^(BOOL finished) {
                     self.Controller=1;
         }];
        [self.YerdekiKartlar addObject:self.cardCompImage4];

    }
     i++;
    if(i==4){
        i=0;
    }
}
-(NSMutableArray*)RandomcardsComp{
    
    
    NSMutableArray *uniqueNumbers =[[NSMutableArray alloc] init];
    
    int r;
    
    while ([uniqueNumbers count] < 4) {
        
        r = arc4random()%4;
        
        if (![uniqueNumbers containsObject:[NSNumber numberWithInt:r]]) {
            
            [uniqueNumbers addObject:[NSNumber numberWithInt:r]];
        }
    }
    return uniqueNumbers;
}

@end
