//
//  FingerPaintView.m
//  FingerPaint
//
//  Created by Shaun Campbell on 2016-09-16.
//  Copyright © 2016 Shaun Campbell. All rights reserved.
//

#import "FingerPaintView.h"

@implementation FingerPaintView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(void)drawRect:(CGRect)rect
{
    
    
    NSArray *paths = [self.delegate returnPaths];
    NSArray *colors = [self.delegate returnColors];
    
    
//    UIBezierPath* aPath = [UIBezierPath bezierPathWithOvalInRect:(CGRectMake(10, 10, self.frame.size.width-20, self.frame.size.height-20))];
//    
//    [aPath stroke];
    
    if(colors.count == paths.count)
    {
        for(int i = 0; i < (paths.count); i++)
        {
            [colors[i] setStroke];
            [paths[i] stroke];
        }
    }
    else{
        NSLog(@"FingerPaintView.drawRect: colors array count does not match paths array count");
    }
    
    
}

@end
