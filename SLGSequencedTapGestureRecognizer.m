//
//  OKSequencedTapGestureRecognizer.m
//
//  Created by Grace Steven on 7/6/11.
//  Copyright 2011 works5.com All rights reserved.
//

#import "SLGSequencedTapGestureRecognizer.h"
#import <UIKit/UIGestureRecognizerSubclass.h>



@implementation SLGSequencedTapGestureRecognizer{
    
    // private
    NSInteger _currentLocationIndex;
    CGPoint _invalidPoint;
    
}
#pragma mark INIT
//
//
//
-(id)initWithTarget:(id)target action:(SEL)action{
    
    self = [super initWithTarget:target action:action];
    if(self){
        _pointMargin = 200;
        _currentLocationIndex =0;
    }
    return self;
}
#pragma mark - Public
//
//
//
-(NSInteger)currentLocationIndex{
    return _currentLocationIndex;
}
#pragma mark - Internal
//
//
//
-(void)reset{
    
    [super reset];
    _currentLocationIndex = 0;    
}
//
// Calculate a rect given a point using the pointMargin
//
-(CGRect)_calculateRectForLocation:(CGPoint)aPoint{
    
    CGRect aRect =
    CGRectMake(aPoint.x-(_pointMargin/2),
               aPoint.y-(_pointMargin/2),
               _pointMargin,
               _pointMargin);
    
    return aRect;
}
//
//
//
-(BOOL)_testTouchPoint:(CGPoint)aTouchPoint{
 
    CGPoint aLocationPoint = [self touchPointAtIndex:_currentLocationIndex];
    
    BOOL isZeroPoint = CGPointEqualToPoint(aLocationPoint, CGPointZero);
    if(!isZeroPoint){
        
        CGRect aTouchRect = [self _calculateRectForLocation:aLocationPoint];
        if(CGRectContainsPoint(aTouchRect,aTouchPoint)){
            return YES;
        }
    }
    return NO;
}
#pragma mark - Touch Handling
//
//
//
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
 
    [super touchesBegan:touches withEvent:event];
        
    CGPoint aTouchPoint = [self locationInView:self.view];
    BOOL result = [self _testTouchPoint:aTouchPoint];
    
    if(!result)
        [self setState:UIGestureRecognizerStateFailed];
    
}
//
//
//
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [super touchesMoved:touches withEvent:event];
    
    
    CGPoint aTouchPoint = [self locationInView:self.view];
    BOOL result = [self _testTouchPoint:aTouchPoint];
    
    if(!result)
        [self setState:UIGestureRecognizerStateFailed];
}
//
//
//
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [super touchesEnded:touches withEvent:event];
    
    CGPoint aTouchPoint = [self locationInView:self.view];
    BOOL result = [self _testTouchPoint:aTouchPoint];
    
    if(!result){
        [self setState:UIGestureRecognizerStateFailed];
    }
    else{
        // increment the index
        _currentLocationIndex++;
    
        // reconize if reached the end of locations array
        if(_currentLocationIndex >= [self numberOfRequiredTapLocations])
            [super setState:UIGestureRecognizerStateRecognized];

        
    }
    
}
//
//
//
-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [super touchesCancelled:touches withEvent:event];
    [self setState:UIGestureRecognizerStateFailed];

}
#pragma mark - Hooks / Required Subclass Overrides
//
//
//
-(CGPoint)touchPointAtIndex:(NSInteger)anIndex{
    
    [NSException raise:NSGenericException
                format:@"Failed to override: %s",__PRETTY_FUNCTION__];
    
    return CGPointZero;
    
}
//
//
//
-(NSUInteger)numberOfRequiredTapLocations{
    
    [NSException raise:NSGenericException
                format:@"Failed to override: %s",__PRETTY_FUNCTION__];
    
    return 0;
    
}
@end
