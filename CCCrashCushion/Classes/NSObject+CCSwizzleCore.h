//
//  NSObject+CCSwizzleCore.h
//  CCCrashCushion
//
//  Created by 秦旭 on 2019/6/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (CCSwizzleCore)

+ (BOOL)cc_swizzleMethod:(SEL)origSel_ withMethod:(SEL)altSel_ error:(NSError**)error_;
+ (BOOL)cc_swizzleClassMethod:(SEL)origSel_ withClassMethod:(SEL)altSel_ error:(NSError**)error_;


/**
 ```
 __block NSInvocation *invocation = nil;
 invocation = [self cc_swizzleMethod:@selector(initWithCoder:) withBlock:^(id obj, NSCoder *coder) {
 NSLog(@"before %@, coder %@", obj, coder);
 [invocation setArgument:&coder atIndex:2];
 [invocation invokeWithTarget:obj];
 id ret = nil;
 [invocation getReturnValue:&ret];
 NSLog(@"after %@, coder %@", obj, coder);
 return ret;
 } error:nil];
 ```
 */
+ (NSInvocation*)cc_swizzleMethod:(SEL)origSel withBlock:(id)block error:(NSError**)error;

/**
 ```
 __block NSInvocation *classInvocation = nil;
 classInvocation = [self cc_swizzleClassMethod:@selector(test) withBlock:^() {
 NSLog(@"before");
 [classInvocation invoke];
 NSLog(@"after");
 } error:nil];
 ```
 */
+ (NSInvocation*)cc_swizzleClassMethod:(SEL)origSel withBlock:(id)block error:(NSError**)error;

@end

NS_ASSUME_NONNULL_END
