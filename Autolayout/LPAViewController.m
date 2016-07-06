//
//  LPAViewController.m
//  Autolayout
//
//  Created by Steven Masuch on 2014-07-20.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "LPAViewController.h"

@interface LPAViewController ()

@property (nonatomic, weak) UIButton *  squareButton;
@property (nonatomic, weak) UIButton *  portraitButton;
@property (nonatomic, weak) UIButton *  landscapeButton;

@property (nonatomic, weak) UIView * framingView;
@property (nonatomic, weak) UIView * purpleBoxView;
@property (nonatomic, weak) UIView * blueBox1View;
@property (nonatomic, weak) UIView * blueBox2View;
@property (nonatomic, weak) UIView * blueBox3View;
@property (nonatomic, weak) UIView * redBoxView;
@property (nonatomic, weak) UIView * orangeBox1View;
@property (nonatomic, weak) UIView * orangeBox2View;


@property (nonatomic, weak) NSLayoutConstraint * framingViewHeight;
@property (nonatomic, weak) NSLayoutConstraint * framingViewWidth;
@property (nonatomic, weak) NSLayoutConstraint * purpleBoxViewHeight;
@property (nonatomic, weak) NSLayoutConstraint * purpleBoxViewWidth;
@property (nonatomic, weak) NSLayoutConstraint * redBoxViewHeight;
@property (nonatomic, weak) NSLayoutConstraint * redBoxViewWidth;
@property (nonatomic, weak) NSLayoutConstraint * orangeBox1ViewHeight;
@property (nonatomic, weak) NSLayoutConstraint * orangeBox1ViewWidth;
@property (nonatomic, weak) NSLayoutConstraint * orangeBox2ViewHeight;
@property (nonatomic, weak) NSLayoutConstraint * orangeBox2ViewWidth;



@end

@implementation LPAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *squareButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [squareButton setTitle:@"Square" forState:UIControlStateNormal];
    [squareButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:squareButton];
    squareButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.squareButton = squareButton;
    
    UIButton *portraitButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [portraitButton setTitle:@"Portrait" forState:UIControlStateNormal];
    [portraitButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:portraitButton];
    portraitButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.portraitButton = portraitButton;
    
    UIButton *landscapeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [landscapeButton setTitle:@"Landscape" forState:UIControlStateNormal];
    [landscapeButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:landscapeButton];
    landscapeButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.landscapeButton = landscapeButton;
    
    UIView *framingView = [[UIView alloc] initWithFrame:CGRectZero];
    framingView.translatesAutoresizingMaskIntoConstraints = NO;
    framingView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:framingView];
    self.framingView = framingView;
    
    
    NSString *buttonsHorizontalConstraints = @"|[squareButton(==portraitButton)][portraitButton(==landscapeButton)][landscapeButton]|";
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:buttonsHorizontalConstraints
                                                                      options:NSLayoutFormatAlignAllCenterY
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(squareButton, portraitButton, landscapeButton)]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:squareButton
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:-50.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:framingView
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:framingView
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1.0
                                                           constant:-50.0]];

    
    //framing view
    
    NSLayoutConstraint *framingViewHeight = [NSLayoutConstraint constraintWithItem:framingView
                                                                         attribute:NSLayoutAttributeHeight
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:nil
                                                                         attribute:NSLayoutAttributeNotAnAttribute
                                                                        multiplier:1.0
                                                                          constant:500.0];
    
    NSLayoutConstraint *framingViewWidth = [NSLayoutConstraint constraintWithItem:framingView
                                                                        attribute:NSLayoutAttributeWidth
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:nil
                                                                        attribute:NSLayoutAttributeNotAnAttribute
                                                                       multiplier:1.0
                                                                         constant:500.0];
    
    [framingView addConstraint:framingViewHeight];
    [framingView addConstraint:framingViewWidth];
    
    self.framingViewHeight = framingViewHeight;
    self.framingViewWidth = framingViewWidth;
    
// purple box
    
    
    UIView *purpleBoxView = [[UIView alloc] initWithFrame:CGRectZero];
    purpleBoxView.translatesAutoresizingMaskIntoConstraints = NO;
    purpleBoxView.backgroundColor = [UIColor purpleColor];
    [self.framingView addSubview:purpleBoxView];
    self.purpleBoxView = purpleBoxView;
    

    NSLayoutConstraint *purpleBoxViewWidth = [NSLayoutConstraint constraintWithItem:self.purpleBoxView
                                                                          attribute:NSLayoutAttributeWidth
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:self.framingView
                                                                          attribute:NSLayoutAttributeWidth
                                                                         multiplier:0.61
                                                                           constant:0.0];
    
    NSLayoutConstraint *purpleBoxViewHeight = [NSLayoutConstraint constraintWithItem:purpleBoxView
                                                                         attribute:NSLayoutAttributeHeight
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:nil
                                                                         attribute:NSLayoutAttributeNotAnAttribute
                                                                        multiplier:1.0
                                                                          constant:50.0];
    
    [self.framingView addConstraint:purpleBoxViewWidth];
    [self.framingView  addConstraint:purpleBoxViewHeight];

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:purpleBoxView
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.framingView
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:-20.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:purpleBoxView
                                                          attribute:NSLayoutAttributeRight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.framingView
                                                          attribute:NSLayoutAttributeRight
                                                         multiplier:1.0
                                                           constant:-20.0]];
    
    // code is working till here
    
    // blue boxes

    UIView *blueBox1View = [[UIView alloc] initWithFrame:CGRectZero];
    blueBox1View.translatesAutoresizingMaskIntoConstraints = NO;
    blueBox1View.backgroundColor = [UIColor blueColor];
    [self.framingView addSubview:blueBox1View];
    self.blueBox1View = blueBox1View;

    UIView *blueBox2View = [[UIView alloc] initWithFrame:CGRectZero];
    blueBox2View.translatesAutoresizingMaskIntoConstraints = NO;
    blueBox2View.backgroundColor = [UIColor blueColor];
    [self.framingView addSubview:blueBox2View];
    self.blueBox2View = blueBox2View;
    
    UIView *blueBox3View = [[UIView alloc] initWithFrame:CGRectZero];
    blueBox3View.translatesAutoresizingMaskIntoConstraints = NO;
    blueBox3View.backgroundColor = [UIColor blueColor];
    [self.framingView addSubview:blueBox3View];
    self.blueBox3View = blueBox3View;

    

    NSLayoutConstraint *blueBox1ViewWidth = [NSLayoutConstraint constraintWithItem:blueBox1View
                                                                          attribute:NSLayoutAttributeWidth
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:nil
                                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                                         multiplier:1.0
                                                                           constant:50.0];
    
    NSLayoutConstraint *blueBox1ViewHeight = [NSLayoutConstraint constraintWithItem:blueBox1View
                                                                           attribute:NSLayoutAttributeHeight
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:nil
                                                                           attribute:NSLayoutAttributeNotAnAttribute
                                                                          multiplier:1.0
                                                                            constant:50.0];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:blueBox1View
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.framingView
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:blueBox1View
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.framingView
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1.0
                                                           constant:0.0]];

    [self.framingView addConstraint:blueBox1ViewWidth];
    [self.framingView  addConstraint:blueBox1ViewHeight];
    
    NSLayoutConstraint *blueBox2ViewWidth = [NSLayoutConstraint constraintWithItem:blueBox2View
                                                                         attribute:NSLayoutAttributeWidth
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:nil
                                                                         attribute:NSLayoutAttributeNotAnAttribute
                                                                        multiplier:1.0
                                                                          constant:50.0];
    
    NSLayoutConstraint *blueBox2ViewHeight = [NSLayoutConstraint constraintWithItem:blueBox2View
                                                                          attribute:NSLayoutAttributeHeight
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:nil
                                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                                         multiplier:1.0
                                                                           constant:50.0];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:blueBox2View
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.framingView
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:blueBox2View
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.framingView
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:0.25
                                                           constant:0.0]];
    
    [self.framingView addConstraint:blueBox2ViewWidth];
    [self.framingView  addConstraint:blueBox2ViewHeight];

    NSLayoutConstraint *blueBox3ViewWidth = [NSLayoutConstraint constraintWithItem:blueBox3View
                                                                         attribute:NSLayoutAttributeWidth
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:nil
                                                                         attribute:NSLayoutAttributeNotAnAttribute
                                                                        multiplier:1.0
                                                                          constant:50.0];
    
    NSLayoutConstraint *blueBox3ViewHeight = [NSLayoutConstraint constraintWithItem:blueBox3View
                                                                          attribute:NSLayoutAttributeHeight
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:nil
                                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                                         multiplier:1.0
                                                                           constant:50.0];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:blueBox3View
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.framingView
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:blueBox3View
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.framingView
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:0.75
                                                           constant:0.0]];
    
    [self.framingView addConstraint:blueBox3ViewWidth];
    [self.framingView  addConstraint:blueBox3ViewHeight];
    
    
    // red box
    
    UIView *redBoxView = [[UIView alloc] initWithFrame:CGRectZero];
    redBoxView.translatesAutoresizingMaskIntoConstraints = NO;
    redBoxView.backgroundColor = [UIColor redColor];
    [self.framingView addSubview:redBoxView];
    self.redBoxView = redBoxView;
    
    NSLayoutConstraint *redBoxViewWidth = [NSLayoutConstraint constraintWithItem:self.redBoxView
                                                                         attribute:NSLayoutAttributeWidth
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:nil
                                                                         attribute:NSLayoutAttributeNotAnAttribute
                                                                        multiplier:1.0
                                                                          constant:150.0];
    
    NSLayoutConstraint *redBoxViewHeight = [NSLayoutConstraint constraintWithItem:self.redBoxView
                                                                          attribute:NSLayoutAttributeHeight
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:nil
                                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                                         multiplier:1.0
                                                                           constant:50.0];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.redBoxView
                                                          attribute:NSLayoutAttributeRight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.framingView
                                                          attribute:NSLayoutAttributeRight
                                                         multiplier:1.0
                                                           constant:-20.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.redBoxView
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.framingView
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant:20.0]];
    
    [framingView addConstraint:redBoxViewWidth];
    [framingView  addConstraint:redBoxViewHeight];

    // orange box 1
    
    UIView *orangeBox1View = [[UIView alloc] initWithFrame:CGRectZero];
    orangeBox1View.translatesAutoresizingMaskIntoConstraints = NO;
    orangeBox1View.backgroundColor = [UIColor orangeColor];
    [self.framingView addSubview:orangeBox1View];
    self.orangeBox1View = orangeBox1View;

    NSLayoutConstraint *orangeBox1ViewWidth = [NSLayoutConstraint constraintWithItem:self.orangeBox1View
                                                                       attribute:NSLayoutAttributeWidth
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:nil
                                                                       attribute:NSLayoutAttributeNotAnAttribute
                                                                      multiplier:1.0
                                                                        constant:50.0];
    
    NSLayoutConstraint *orangeBox1ViewHeight = [NSLayoutConstraint constraintWithItem:self.orangeBox1View
                                                                        attribute:NSLayoutAttributeHeight
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:nil
                                                                        attribute:NSLayoutAttributeNotAnAttribute
                                                                       multiplier:1.0
                                                                         constant:30.0];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.orangeBox1View
                                                          attribute:NSLayoutAttributeRight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.framingView
                                                          attribute:NSLayoutAttributeRight
                                                         multiplier:1.0
                                                           constant:-30.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.orangeBox1View
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.framingView
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant:30.0]];
    
    [framingView addConstraint:orangeBox1ViewWidth];
    [framingView  addConstraint:orangeBox1ViewHeight];

    
    // orange box 2
    
    UIView *orangeBox2View = [[UIView alloc] initWithFrame:CGRectZero];
    orangeBox2View.translatesAutoresizingMaskIntoConstraints = NO;
    orangeBox2View.backgroundColor = [UIColor orangeColor];
    [self.framingView addSubview:orangeBox2View];
    self.orangeBox2View = orangeBox2View;
    
    NSLayoutConstraint *orangeBox2ViewWidth = [NSLayoutConstraint constraintWithItem:self.orangeBox2View
                                                                          attribute:NSLayoutAttributeWidth
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:nil
                                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                                         multiplier:1.0
                                                                           constant:70.0];
    
    NSLayoutConstraint *orangeBox2ViewHeight = [NSLayoutConstraint constraintWithItem:self.orangeBox2View
                                                                            attribute:NSLayoutAttributeHeight
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:nil
                                                                            attribute:NSLayoutAttributeNotAnAttribute
                                                                           multiplier:1.0
                                                                             constant:30.0];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.orangeBox2View
                                                          attribute:NSLayoutAttributeRight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.framingView
                                                          attribute:NSLayoutAttributeRight
                                                         multiplier:1.0
                                                           constant:-90.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.orangeBox2View
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.framingView
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant:30.0]];
    
    [framingView addConstraint:orangeBox2ViewWidth];
    [framingView  addConstraint:orangeBox2ViewHeight];

    
    
}

- (void)resizeFramingView:(id)sender
{
    CGFloat newWidth = 0.0;
    CGFloat newHeight = 0.0;
    
    if (sender == self.squareButton) {
        newWidth = 500.0;
        newHeight = 500.0;
    } else if (sender == self.portraitButton) {
        newWidth = 350.0;
        newHeight = 550.0;
    } else if (sender == self.landscapeButton) {
        newWidth = 900.0;
        newHeight = 300.0;
    }
    
    [UIView animateWithDuration:2.0 animations:^(){
        self.framingViewHeight.constant = newHeight;
        self.framingViewWidth.constant = newWidth;
        [self.view layoutIfNeeded];
    }];
}

@end
