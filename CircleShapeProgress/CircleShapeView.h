//
//  CircleShapeView.h
//  CircleShapeProgress
//
//  Created by wangmin on 15/7/23.
//  Copyright (c) 2015年 wangmin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CircleShapeMode) {
    PureColorMode = 0,
    CustomColorMode
};


@interface CircleShapeView : UIView

@property (nonatomic,assign) CircleShapeMode circleShapeMode;//纯色轨迹  自定义轨迹

@property (nonatomic,strong) UIColor *strokeColor;//描边颜色

@property (nonatomic,strong) UIColor *fillColor;//填充颜色

@property (nonatomic,assign) CGFloat lineWidth;//线宽

@property (nonatomic,assign) CGFloat startDegress;//起始角度

@property (nonatomic,assign) CGFloat endDegress;//结束角度

@property (nonatomic,assign) CFTimeInterval animationDuration;//动画时间

@property (nonatomic,assign) CGFloat percent;//进度 取值0-1

@end
