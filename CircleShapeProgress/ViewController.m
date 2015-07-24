//
//  ViewController.m
//  CircleShapeProgress
//
//  Created by wangmin on 15/7/23.
//  Copyright (c) 2015年 wangmin. All rights reserved.
//

#import "ViewController.h"
#import "CircleShapeView.h"

@interface ViewController ()
{

    CircleShapeView *pure_circleView;
    CircleShapeView *custom_circleView;

}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //纯色
    pure_circleView = [[CircleShapeView alloc] initWithFrame:CGRectMake( (CGRectGetWidth(self.view.bounds)-145)/2.0f, 60, 145, 145)];
    pure_circleView.strokeColor = [UIColor redColor];
    pure_circleView.startDegress = 90;
    pure_circleView.endDegress = 270;
    pure_circleView.lineWidth = 10;
    [self.view addSubview:pure_circleView];
    
    //自定义
    custom_circleView = [[CircleShapeView alloc] initWithFrame:CGRectMake( (CGRectGetWidth(self.view.bounds)-145)/2.0f, 280, 145, 145)];
    custom_circleView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"circle_coclor.png"]];
    custom_circleView.circleShapeMode = CustomColorMode;
    custom_circleView.startDegress = -180;
    custom_circleView.endDegress = 180;
    custom_circleView.lineWidth = 10;
    custom_circleView.animationDuration = 1;
    [self.view addSubview:custom_circleView];
    
}

- (IBAction)purNewProgress:(id)sender {

    pure_circleView.animationDuration = 1;
    pure_circleView.percent = 0.8;
}


- (IBAction)cusNewProgress:(id)sender {
    
    custom_circleView.percent = 0.8;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
