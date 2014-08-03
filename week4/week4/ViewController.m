//
//  ViewController.m
//  week4
//
//  Created by sunsidew on 2014. 8. 1..
//  Copyright (c) 2014년 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void) imageshake:(NSNotification *) NC
{
    UIImage* imagename = [UIImage imageNamed:[[NC userInfo] objectForKey:@"imagepath"]];
    NSLog(@"imgn : %@",[[NC userInfo] objectForKey:@"imagepath"]);
    [_imageView setImage:imagename];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSNotificationCenter* NC = [NSNotificationCenter defaultCenter];
    [NC addObserver:self selector:@selector(imageshake:) name:@"shakeshake" object:nil];
    
    Model *MYModel = [[Model alloc] init];
    [MYModel randomize];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"shakeshake" object:nil];
    // Dispose of any resources that can be recreated.
}

-(BOOL)canBecomeFirstResponder {
    return YES;
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self resignFirstResponder];
    [super viewWillDisappear:animated];
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake)
    {
        Model *MYModel = [[Model alloc] init];
        [MYModel randomize];
    }
}

@end
