//
//  CCCrashCushionTests.m
//  CCCrashCushionTests
//
//  Created by ccrsno1 on 05/27/2019.
//  Copyright (c) 2019 ccrsno1. All rights reserved.
//

@import XCTest;
#import <CCCrashCushion/NSArray+CCSwizzle.h>

@interface Tests : XCTestCase

@end

@implementation Tests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    NSArray* array = @[];
    NSLog(@"%@", array[100]);
    
    NSArray* nonEmptyArray = @[@"",@""];
    NSLog(@"%@", nonEmptyArray[100]);
    
    NSArray* singleArray = @[@""];
    NSLog(@"%@", singleArray[100]);

}

@end

