//
//  DetailViewController.m
//  RevailViewDemo
//
//  Created by Rohit on 02/06/15.
//  Copyright (c) 2015 IBM. All rights reserved.
//

#import "DetailViewController.h"
#import "ZUUIRevealController.h"

@interface DetailViewController ()

@property (nonatomic, weak) IBOutlet UIButton *menuButton;
@property (nonatomic, weak) IBOutlet UILabel *notifyLabel;
@property (nonatomic, strong) UIPanGestureRecognizer *navigationBarPanGestureRecognizer;

- (void) configureViewGesture;

@end

@implementation DetailViewController
@synthesize notiferString = _notiferString;
@synthesize menuButton = _menuButton;
@synthesize notifyLabel = _notifyLabel;
@synthesize navigationBarPanGestureRecognizer = _navigationBarPanGestureRecognizer;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self configureViewGesture];
    [_notifyLabel setText:_notiferString];
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
- (void) configureViewGesture
{
    //Configure PanGesture
    SEL gestureSelector = sel_registerName(REVEALGESTURE);
    SEL toggleSelector = sel_registerName(REVEALTOGGLE);
    if ([self.navigationController.parentViewController respondsToSelector:gestureSelector] && [self.navigationController.parentViewController respondsToSelector:toggleSelector])
    {
        // Check if a UIPanGestureRecognizer already sits atop our NavigationBar.
        if (![[self.view gestureRecognizers] containsObject:_navigationBarPanGestureRecognizer])
        {
            // If not, allocate one and add it.
            UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self.navigationController.parentViewController action:gestureSelector];
            _navigationBarPanGestureRecognizer = panGestureRecognizer;
            
            [self.view addGestureRecognizer:_navigationBarPanGestureRecognizer];
        }
    }
}

-(IBAction)menuButtonTapped:(UIButton *)sender {
    SEL gestureSelector = sel_registerName(REVEALGESTURE);
    SEL toggleSelector = sel_registerName(REVEALTOGGLE);
    if ([self.navigationController.parentViewController respondsToSelector:gestureSelector] &&
        [self.navigationController.parentViewController respondsToSelector:toggleSelector])
    {
        [self.navigationController.parentViewController performSelectorOnMainThread:toggleSelector
                                                                         withObject:nil
                                                                      waitUntilDone:NO];
    }
}

@end
