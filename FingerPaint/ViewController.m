//
//  ViewController.m
//  FingerPaint
//
//  Created by Shaun Campbell on 2016-09-16.
//  Copyright © 2016 Shaun Campbell. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic) UIBezierPath* fingerPaintingPath;
@property (nonatomic) NSArray* fingerPainting;
@property (weak, nonatomic) IBOutlet FingerPaintView *fingerPaintView;
@property (nonatomic) NSArray* fingerPaintColors;
@property (nonatomic) UIColor* currentColor;
//@property (nonatomic) UIBezierPath* aPath;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    self.aPath = [UIBezierPath bezierPathWithOvalInRect:(CGRectMake(10, 10, self.view.frame.size.width-20, self.view.frame.size.height-20))];
    self.fingerPainting = [[NSArray alloc] init];
    self.fingerPaintColors = [[NSArray alloc] init];
    self.currentColor = [UIColor blackColor];
    self.fingerPaintView.delegate = self;
}

-(NSArray *)returnPaths
{
    
    
    return self.fingerPainting;
//    return [NSArray arrayWithObject:self.aPath];
}

-(NSArray *)returnColors
{
    return self.fingerPaintColors;
}


- (IBAction)panGestureOccured:(UIPanGestureRecognizer *)sender {
    if(sender.state == UIGestureRecognizerStateBegan)
    {
        self.fingerPaintingPath = [[UIBezierPath alloc] init];
        [self.fingerPaintingPath moveToPoint:[sender locationInView:self.view]];
        self.fingerPainting = [self.fingerPainting arrayByAddingObject:self.fingerPaintingPath];
        self.fingerPaintColors = [self.fingerPaintColors arrayByAddingObject:self.currentColor];
    }
    else if(sender.state == UIGestureRecognizerStateEnded)
    {
        //when the line ends
    }
    
    self.fingerPaintingPath.lineWidth = hypot([sender velocityInView:self.fingerPaintView].x, [sender velocityInView:self.fingerPaintView].y)/100;
    [self.fingerPaintingPath addLineToPoint:[sender locationInView:self.view]];
    [self.fingerPaintView setNeedsDisplay];
    
    
    
}

- (IBAction)clearButtonPressed:(UIButton *)sender {
    self.fingerPainting = [[NSArray alloc] init];
    self.fingerPaintColors = [[NSArray alloc] init];
    
    [self.fingerPaintView setNeedsDisplay];
    
    
}

- (IBAction)redPressed:(UIButton *)sender {
    self.currentColor = [UIColor redColor];
}
- (IBAction)bluePressed:(UIButton *)sender {
    self.currentColor = [UIColor blueColor];
}
- (IBAction)blackPressed:(UIButton *)sender {
    self.currentColor = [UIColor blackColor];
}
- (IBAction)erasePressed:(UIButton *)sender {
    self.currentColor = self.fingerPaintView.backgroundColor;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
