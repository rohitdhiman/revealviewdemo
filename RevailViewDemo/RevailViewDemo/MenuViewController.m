//
//  MenuViewController.m
//  RevailViewDemo
//
//  Created by Rohit on 02/06/15.
//  Copyright (c) 2015 IBM. All rights reserved.
//

#import "MenuViewController.h"
#import "DetailViewController.h"
#import "Cache.h"

@interface MenuViewController ()

@property (nonatomic, weak) IBOutlet UIButton *button1;
@property (nonatomic, weak) IBOutlet UIButton *button2;
@property (nonatomic, weak) IBOutlet UIButton *button3;
@property (nonatomic, weak) IBOutlet UIButton *button4;

@end

@implementation MenuViewController
@synthesize button1 = _button1;
@synthesize button2 = _button2;
@synthesize button3 = _button3;
@synthesize button4 = _button4;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark
#pragma mark Button Tap Method
/**
 Button tapped method. to load FrontViewController.
 */
-(IBAction)buttonTappedOnMenu:(UIButton *)sender {
    DetailViewController *dvc = [[DetailViewController alloc] initWithNibName:@"DetailViewController"
                                                                       bundle:nil];
    dvc.notiferString = [NSString stringWithFormat:@"%@",sender.titleLabel.text];
    [self loadViewController:dvc];
}

/**
 Method to load the appropriate view on FrontViewController.
 @param viewController, which would be loaded.
 */
- (void) loadViewController : (UIViewController *)viewController {
    ZUUIRevealController *revealController = [self.parentViewController isKindOfClass:[ZUUIRevealController class]] ?
    (ZUUIRevealController *)self.parentViewController : nil;
    
    UINavigationController *currentNavigationController = (UINavigationController *)revealController.frontViewController;
    [currentNavigationController popToRootViewControllerAnimated:NO];
    [currentNavigationController pushViewController:viewController animated:YES];
    
    revealController.currentFrontViewPosition = FrontViewPositionRight;
    [revealController revealToggle:self];
}

#pragma mark
#pragma - ZUUIRevealControllerDelegate Protocol.
/*
 * All of the methods below are optional. You can use them to control the behavior of the ZUUIRevealController,
 * or react to certain events.
 */
- (BOOL)revealController:(ZUUIRevealController *)revealController shouldRevealRearViewController:(UIViewController *)rearViewController
{
    return YES;
}

- (BOOL)revealController:(ZUUIRevealController *)revealController shouldHideRearViewController:(UIViewController *)rearViewController
{
    return YES;
}
- (void)revealController:(ZUUIRevealController *)revealController didRevealRearViewController:(UIViewController *)rearViewController
{
    if ([Cache cache].touchIntercepterView!=nil) {
        [[Cache cache].touchIntercepterView removeFromSuperview];
    }
    UIView *temptouchIntercepterView = [[UIView alloc] initWithFrame:revealController.frontViewController.view.frame];
    [Cache cache].touchIntercepterView = temptouchIntercepterView;
    //[[Cache cache].touchIntercepterView  setBackgroundColor:[UIColor redColor]];
    
    SEL gestureSelector = sel_registerName(REVEALGESTURE);
    SEL toggleSelector = sel_registerName(REVEALTOGGLE);
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:revealController action:toggleSelector];
    [[Cache cache].touchIntercepterView addGestureRecognizer:tapGestureRecognizer];
    
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:revealController action:gestureSelector];
    [[Cache cache].touchIntercepterView addGestureRecognizer:panGestureRecognizer];
    
    [revealController.frontViewController.view addSubview:[Cache cache].touchIntercepterView];
    
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)revealController:(ZUUIRevealController *)revealController didHideRearViewController:(UIViewController *)rearViewController
{
    if  ([Cache cache].touchIntercepterView ==nil)
    {
        NSLog(@" because of memory leak gesture object release");
    }
    [[Cache cache].touchIntercepterView removeFromSuperview];
    
    
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)revealController:(ZUUIRevealController *)revealController willRevealRearViewController:(UIViewController *)rearViewController
{
    if ([Cache cache].touchIntercepterView!=nil) {
        [[Cache cache].touchIntercepterView removeFromSuperview];
    }
    UIView *temptouchIntercepterView = [[UIView alloc] initWithFrame:revealController.frontViewController.view.frame];
    [Cache cache].touchIntercepterView = temptouchIntercepterView;
    
    //    [[Cache cache].touchIntercepterView  setBackgroundColor:[UIColor redColor]];
    SEL gestureSelector = sel_registerName(REVEALGESTURE);
    SEL toggleSelector = sel_registerName(REVEALTOGGLE);
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:revealController action:toggleSelector];
    [[Cache cache].touchIntercepterView addGestureRecognizer:tapGestureRecognizer];
    
    
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:revealController action:gestureSelector];
    [[Cache cache].touchIntercepterView addGestureRecognizer:panGestureRecognizer];
    
    [revealController.frontViewController.view addSubview:[Cache cache].touchIntercepterView];
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)revealController:(ZUUIRevealController *)revealController willHideRearViewController:(UIViewController *)rearViewController
{
    if  ([Cache cache].touchIntercepterView ==nil)
    {
        NSLog(@" because of memory leak gesture object release");
    }
    [[Cache cache].touchIntercepterView removeFromSuperview];
    
    
    NSLog(@"%@", NSStringFromSelector(_cmd));
}
@end
