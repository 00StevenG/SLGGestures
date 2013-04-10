//
//  SGFFourCornersTapGestureRecognizer.m
//
//  Created by Grace Steven on 7/6/11.
//  Copyright 2011 works5.com All rights reserved.
//

#import "SLGFourCornersTapGestureRecognizer.h"


@implementation SLGFourCornersTapGestureRecognizer


#pragma mark - Corner Point Calculations
//
//
//
-(CGPoint)topLeftCorner{
    return CGPointMake(1,1);
}
-(CGPoint)topRightCorner{
    return CGPointMake(CGRectGetMaxX(self.view.bounds),0);
}
-(CGPoint)bottomRightCorner{
    return CGPointMake(CGRectGetMaxX(self.view.bounds),CGRectGetMaxY(self.view.bounds));
}
-(CGPoint)bottomLeftCorner{
    return CGPointMake(1,CGRectGetMaxY(self.view.bounds));
}
//
// OVERRIDE THE LOCATION AT INDEX FUNCTION TO RETURN THE CORNERS
//
-(CGPoint)touchPointAtIndex:(NSInteger)anIndex{
    
    switch (anIndex) {
        case 0:
            return [self topLeftCorner];
        case 1:
            return [self topRightCorner];
        case 2:
            return [self bottomRightCorner];
        case 3:
            return [self bottomLeftCorner];
        default:
            return CGPointZero;
    }
}
//
//
//
-(NSUInteger)numberOfRequiredTapLocations{
    
    return 4;
}
/*
//
//
//
-(BOOL)checkIsRecognized{
    if(self.currentLocationIndex == 4)
        return YES;
    
    return NO;
    
}
*/



@end
