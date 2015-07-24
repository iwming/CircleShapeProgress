//
//  CircleShapeView.m
//  CircleShapeProgress
//
//  Created by wangmin on 15/7/23.
//  Copyright (c) 2015年 wangmin. All rights reserved.
//

#import "CircleShapeView.h"


#define FromDegree2Radian(X) (((X)/180.0)*M_PI)

@interface CircleShapeView ()

@property (nonatomic,strong) CAShapeLayer *circleShapeLayer;
@end

@implementation CircleShapeView
@synthesize percent = _percent;


- (CAShapeLayer *)circleShapeLayer
{
    return  _circleShapeLayer;
}

- (void)getACicleShapeLayer
{
    CGFloat circleRadius = 0;
    if (_lineWidth == 0)
    {
        circleRadius = self.bounds.size.width/2.0 - 2;
        _lineWidth = 2;
    }
    else
    {
        circleRadius = self.bounds.size.width/2.0 - 2*_lineWidth;
    }
    
    if(!_strokeColor){
    
        _strokeColor = [UIColor orangeColor];
    }
    
    if(!_fillColor){
        
        _fillColor = [UIColor clearColor];
    }
    
    if(_startDegress == 0){
        
        _startDegress = 210;
    }
    
    if(_endDegress == 0){
        
        _endDegress = 360-30;
    }
    
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(CGRectGetWidth(self.bounds) / 2,CGRectGetHeight(self.bounds) / 2)
                                                              radius:(CGRectGetWidth(self.bounds) - self.lineWidth) / 2
                                                          startAngle:FromDegree2Radian(_startDegress)
                                                            endAngle:FromDegree2Radian(_endDegress)
                                                           clockwise:YES];
    self.circleShapeLayer = [CAShapeLayer layer];
    _circleShapeLayer.fillColor = _fillColor.CGColor;
    _circleShapeLayer.strokeColor = _strokeColor.CGColor;
    _circleShapeLayer.path = circlePath.CGPath;
    _circleShapeLayer.lineCap = kCALineCapRound;
    
    _circleShapeLayer.lineWidth = _lineWidth;
    
    _circleShapeLayer.strokeStart = 0.0;
    _circleShapeLayer.strokeEnd = 1.0;
    
    
}

-(void)layoutSubviews
{
    [self getACicleShapeLayer];

    if(_circleShapeMode == PureColorMode){
        
        [self.layer addSublayer:_circleShapeLayer];
        
    }else if(_circleShapeMode == CustomColorMode){
        
        self.layer.mask = _circleShapeLayer;
    }
}

- (CGFloat)percent
{
    return  _percent;
}

- (void)setPercent:(CGFloat)percent
{
    if(_animationDuration == 0){
    
        _animationDuration = 3;
    }
    
    [CATransaction begin];
    [CATransaction setDisableActions:NO];
    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    [CATransaction setAnimationDuration:_animationDuration];
     self.circleShapeLayer.strokeEnd = percent;
    [CATransaction commit];
    
}

@end
