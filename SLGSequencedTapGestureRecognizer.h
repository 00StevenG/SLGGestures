//
//  SLGSequencedTapGestureRecognizer.h
//
//  Created by Grace Steven on 7/6/11.
//  Copyright 2011 works5.com All rights reserved.
//
//  Abstract Base Class for a discrete Gesture Recognizer requiring a sequence of locations on the screen t
//  be tapped in sequence to be recognized
//  Location calculation is deferred to subclasses so points can be calculated based on the view state during
//  the touch sequence
//

#import <Foundation/Foundation.h>


@interface SLGSequencedTapGestureRecognizer : UIGestureRecognizer


// the index in the locations array the gesture will 'test' next
@property(nonatomic,readonly)NSInteger currentLocationIndex;

// the width and height of the rectangle constructed around a point
// to hit test default is 200
@property(nonatomic,readwrite,assign)CGFloat pointMargin;


// Required Overrides: will throw exception if not implemented

// return the point at a given index in the sequence to be tapped
-(CGPoint)touchPointAtIndex:(NSInteger)anIndex;
// return the total number of points to be tested
-(NSUInteger)numberOfRequiredTapLocations;

@end
