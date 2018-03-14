//
//  ViewController.m
//  testSDK
//
//  Created by 霍驹 on 2018/3/13.
//  Copyright © 2018年 HJ. All rights reserved.
//

#import "ViewController.h"
#import "RDPFramwork.framework/Headers/RDPSDK.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    RDPDirectAPI *api =[[RDPDirectAPI alloc] initWithDelegate:self];
    [api startRequest];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
