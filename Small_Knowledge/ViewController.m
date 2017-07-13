//
//  ViewController.m
//  Small_Knowledge
//
//  Created by 马金丽 on 17/7/12.
//  Copyright © 2017年 majinli. All rights reserved.
//

#import "ViewController.h"
#import "MJLFirstViewController.h"
#import "EncryptionTool.h"
#import "UIView+addBorder.h"
#import "NSString+idCardVerify.h"
#ifdef DEBUG
# define DSLog(fmt, ...) NSLog((@"[文件名:%s]\n" "[函数名:%s]\n" "[行号:%d] \n" fmt), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
# define DSLog(...);
#endif

#define RADIANS(degrees) (((degrees) * M_PI) / 180.0)



@interface ViewController ()


@property(nonatomic,strong)NSData *imageData;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _testLabel.numberOfLines = 0;
    _testLabel.font = [UIFont systemFontOfSize:15.0];
    NSString *str = @"设置UILabel的行间距设置UILabel的行间距设置UILabel的行间距设置UILabel的行间距设置UILabel的行间距设置UILabel的行间距设置UILabel的行间距设置UILabel的行间距设置UILabel的行间距设置UILabel的行间距";
    _testLabel.text = str;
    [self settingLineSpeacewithText:str];
    [self compareCGRectfirstRect:_testLabel.frame SecondRect:_test2Label.frame];
//    [self playAnimationImageView];
    UIImage *image = [UIImage imageNamed:@"animation_0"];
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(image.size.height *0.5, image.size.width *0.5, image.size.height *0.5, image.size.width *0.5) resizingMode:UIImageResizingModeStretch];
    self.testImageView.image = image;
    [self checkStrIsNumberwithStr:@"123"];
    [self createPDFfromUIView:self.view saveToDocumentFileName:@"/image_PDF"];
    //让一个view在父视图中心
//    self.testImageView.center = [self.view convertPoint:self.view.center fromView:self.view];
    [self saveImagefromPath:@"/saveImage"];
    NSString *md5str1 = [EncryptionTool MD5ForLower16Bite:@"12345-!@#$%^&*()_+QWERTYUIOP{ASDFGHJKL:XCVBNM<>"];
    DSLog(@"%@",md5str1);
    NSString *md5str2 = [EncryptionTool MD5ForLower32Bite:@"12345"];
    NSLog(@"%@",md5str2);
    NSString *md5str3 = [EncryptionTool MD5ForUpper16Bite:@"12345"];
    NSLog(@"%@",md5str3);
    NSString *md5str4 = [EncryptionTool MD5ForUpper32Bite:@"12345"];
    NSLog(@"%@",md5str4);
    NSString *base64str1 = [EncryptionTool base64EncodeString:@"马金丽"];
    NSLog(@"%@",base64str1);
    NSString *base64str2 = [EncryptionTool base64DecodeString:base64str1];
    NSLog(@"%@",base64str2);
    [self.testLabel addBorder:BorderDirectionLeft color:[UIColor redColor] width:5.0];
    [self.testLabel addBorder:BorderDirectionRight color:[UIColor redColor] width:3.0];
    NSString *idcardStr = @"41088155555555555";
    NSLog(@"%d",[idcardStr validateIdentityCard]);
}


#pragma mark -设置UILabel的行间距
- (void)settingLineSpeacewithText:(NSString *)text
{
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc]initWithString:text];
    //NSMutableParagraphStyle 用于设定文本段落有关的设置,比如行间距,文本缩进,段间距等
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc]init];
    [style setLineSpacing:10]; //段落行距
//    [style setHeadIndent:5];    //非首行文本缩进
//    [style setTailIndent:-20];  //文本缩进(右端)
    [style setFirstLineHeadIndent:20];  //首行文本缩进
    [attrString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, _testLabel.text.length)];
    _testLabel.attributedText = attrString;
}

#pragma mark -比较两个CGRect/CGSize/CGPoint是否相等
- (BOOL)compareCGRectfirstRect:(CGRect)firstRect SecondRect:(CGRect)secRect
{
    if (CGRectEqualToRect(firstRect, secRect)) {
        return YES;
    }else{
        return NO;
    }
}
- (BOOL)compareCGSizetfirstRect:(CGSize)firstSize SecondRect:(CGSize)secSize
{
    if (CGSizeEqualToSize(firstSize, secSize)) {
        return YES;
    }else{
        return NO;
    }
}
- (BOOL)compareCGPointtfirstRect:(CGPoint)firstpoint SecondRect:(CGPoint)secpoint
{
    if (CGPointEqualToPoint(firstpoint, secpoint)) {
        return YES;
    }else{
        return NO;
    }
}


#pragma mark -播放连续的图片--帧动画
- (void)playAnimationImageView
{
//    _testImageView.animationImages = @[[UIImage imageNamed:@"animation_0"],[UIImage imageNamed:@"animation_1"],[UIImage imageNamed:@"animation_2"]];
//    _testImageView.animationDuration = 1.0;
//    [_testImageView startAnimating];
    //第二种方法
    _testImageView.image = [UIImage animatedImageNamed:[NSString stringWithFormat:@"animation_"] duration:1.0];
    
}

#pragma mark -判断字符串是否是数字
- (BOOL)checkStrIsNumberwithStr:(NSString *)str
{
    NSCharacterSet *set = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    if ([str stringByTrimmingCharactersInSet:set].length > 0) {
        return YES;
    }else{
        return NO;
    }
}

#pragma mark -将view保存为pdf
- (void)createPDFfromUIView:(UIView *)aView saveToDocumentFileName:(NSString *)fileName
{
    NSMutableData *pdData = [NSMutableData data];
    UIGraphicsBeginPDFContextToData(pdData, aView.bounds, nil);
    UIGraphicsBeginPDFPage();
    CGContextRef pdfContext = UIGraphicsGetCurrentContext();
    [aView.layer renderInContext:pdfContext];
    UIGraphicsEndPDFContext();
    
    NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)firstObject];
    NSString *pdfPath = [filePath stringByAppendingPathComponent:fileName];
    [pdData writeToFile:pdfPath atomically:YES];
    NSLog(@"%@",pdfPath);
    
}

#pragma mark -保存UIImage到本地
- (void)saveImagefromPath:(NSString *)imagfileName
{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)firstObject];
    NSString *imagePath = [path stringByAppendingPathComponent:imagfileName];
    UIImage *image = [UIImage imageNamed:@"animation_0"];
    [UIImagePNGRepresentation(image) writeToFile:imagePath atomically:YES];
    NSLog(@"%@",imagePath);
}

- (IBAction)jumpVC:(UIButton *)sender {
//    MJLFirstViewController *firstVC = [[MJLFirstViewController alloc]init];
//    [self.navigationController pushViewController:firstVC animated:YES];
    sender.selected = !sender.selected;
    if (sender.selected) {
        [self startAnimate];
    }else{
        [self stopAnimate];
    }
}


#pragma mark -仿苹果抖动
- (void)startAnimate
{
    self.testImageView.transform = CGAffineTransformRotate(CGAffineTransformIdentity, RADIANS(-5));
    [UIView animateWithDuration:0.25 delay:0.0 options:UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionRepeat|UIViewAnimationOptionAutoreverse animations:^{
        self.testImageView.transform = CGAffineTransformRotate(CGAffineTransformIdentity, RADIANS(5));
    } completion:^(BOOL finished) {
        
    }];
}

- (void)stopAnimate
{
    [UIView animateWithDuration:0.25 delay:0.0 options:UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionBeginFromCurrentState|UIViewAnimationOptionCurveLinear animations:^{
        self.testImageView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        
    }];
}

- (IBAction)screenShotClick:(id)sender {
    
    [self saveScreenShot];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, [UIScreen mainScreen].bounds.size.height - 200, [UIScreen mainScreen].bounds.size.width - 40, 200)];
    imageView.image = [UIImage imageWithData:_imageData];
    [self.view addSubview:imageView];
}

//保存屏幕截图
- (void)saveScreenShot
{
    UIImage *image = [self getNormalImage:self.view];
    UIImageWriteToSavedPhotosAlbum(image, self, nil, nil);
    NSString *screenShotPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)firstObject];
    screenShotPath = [screenShotPath stringByAppendingPathComponent:[NSString stringWithFormat:@"/pic_%.f.png",[NSDate timeIntervalSinceReferenceDate]]];
    _imageData = [NSData dataWithData:UIImagePNGRepresentation(image)];
    [_imageData writeToFile:screenShotPath atomically:YES];
    NSLog(@"%@",screenShotPath);
    
}

#pragma mark -获取屏幕截图
- (UIImage *)getNormalImage:(UIView *)view
{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, YES, 0.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:context];
    UIImage *imgae = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return imgae;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
