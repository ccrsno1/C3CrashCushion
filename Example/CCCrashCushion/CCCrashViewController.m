//
//  CCCrashViewController.m
//  CCCrashCushion
//
//  Created by ccrsno1 on 05/27/2019.
//  Copyright (c) 2019 ccrsno1. All rights reserved.
//

#import "CCCrashViewController.h"
#import <CCCrashCushion/NSArray+CCSwizzle.h>

@interface CCCrashViewController ()

@end

@implementation CCCrashViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSArray* array = @[];
    NSLog(@"%@", array[100]);
    
    NSArray* nonEmptyArray = @[@"",@""];
    NSLog(@"%@", nonEmptyArray[100]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
