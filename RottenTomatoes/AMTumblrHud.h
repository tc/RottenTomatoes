//
// Created by Mustafin Askar on 22/05/2014.
// Copyright (c) 2014 Asich. All rights reserved.
//

#ifndef RottenTomatoes_AMTumblrHud_h
#define RottenTomatoes_AMTumblrHud_h


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AMTumblrHud : UIView

@property (nonatomic, strong) UIColor *hudColor;

-(void)showAnimated:(BOOL)animated;
-(void)hide;

@end
#endif
