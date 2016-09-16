//
//  FingerPaintView.h
//  FingerPaint
//
//  Created by Shaun Campbell on 2016-09-16.
//  Copyright © 2016 Shaun Campbell. All rights reserved.
//

#import <UIKit/UIKit.h>


@class FingerPaintView;

@protocol FingerPaintViewDelegate <NSObject>

-(NSArray *)returnPaths;
-(NSArray *)returnColors;

@end

@interface FingerPaintView : UIView

@property (nonatomic) id<FingerPaintViewDelegate> delegate;

@end
