//
//  NSArray+CCSwizzle.m
//  CCCrashCushion
//
//  Created by 秦旭 on 2019/6/12.
//

#import "NSArray+CCSwizzle.h"
#import "NSObject+CCSwizzleCore.h"
#import <objc/runtime.h>

@implementation NSArray (CCSwizzle)

- (instancetype)initWithObjects_safe:(id *)objects count:(NSUInteger)cnt {
    NSUInteger newCnt = 0;
    for (NSUInteger i = 0; i < cnt; i++) {
        if (!objects[i]) {
            break;
        }
        newCnt++;
    }
    self = [self initWithObjects_safe:objects count:newCnt];
    return self;
}

- (id)safe_objectAtIndex:(NSUInteger)index {
    if (index >= [self count]) {
        return nil;
    }
    return [self safe_objectAtIndex:index];
}

- (id)safe_objectAtIndexedSubscript:(NSUInteger)index {
    if (index >= [self count]) {
        return nil;
    }
    return [self safe_objectAtIndexedSubscript:index];
}

- (id)safe_singleObjectAtIndex:(NSUInteger)index {
    if (index >= [self count]) {
        return nil;
    }
    return [self safe_singleObjectAtIndex:index];
}

- (id)safe_objectAtIndexForNSArray0:(NSUInteger)index {
    if (index >= [self count]) {
        return nil;
    }
    return [self safe_objectAtIndexForNSArray0:index];
}

- (NSArray *)safe_arrayByAddingObject:(id)anObject {
    if (!anObject) {
        return self;
    }
    return [self safe_arrayByAddingObject:anObject];
}

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class selfClass =  [self class];
        
        Class placeholderClass = NSClassFromString(@"__NSPlaceholderArray");
        Method placeholderClassMethod = class_getInstanceMethod(placeholderClass, @selector(initWithObjects:count:));
        Method selfPlaceholderClassMethod = class_getInstanceMethod(selfClass, @selector(initWithObjects_safe:count:));
        if (placeholderClass && selfClass && placeholderClassMethod && selfPlaceholderClassMethod) {
            method_exchangeImplementations(placeholderClassMethod, selfPlaceholderClassMethod);
        }

        Class arrayIClass = NSClassFromString(@"__NSArrayI");
        Method arrayIClassMethod = class_getInstanceMethod(arrayIClass, @selector(objectAtIndex:));
        Method selfClassObjectAtMethod = class_getInstanceMethod(selfClass, @selector(safe_objectAtIndex:));
        if (arrayIClass && selfClass && arrayIClassMethod && selfClassObjectAtMethod) {
            method_exchangeImplementations(arrayIClassMethod, selfClassObjectAtMethod);
        }
        
        Method arrayIClassIndexMethod = class_getInstanceMethod(arrayIClass, @selector(objectAtIndexedSubscript:));
        Method selfClassObjectAtIndexMethod = class_getInstanceMethod(selfClass, @selector(safe_objectAtIndexedSubscript:));
        if (arrayIClass && selfClass && arrayIClassIndexMethod && selfClassObjectAtIndexMethod) {
            method_exchangeImplementations(arrayIClassIndexMethod, selfClassObjectAtIndexMethod);
        }
        
        Class singleArrayIClass = NSClassFromString(@"__NSSingleObjectArrayI");
        Method singleArrayIClassMethod = class_getInstanceMethod(singleArrayIClass, @selector(objectAtIndex:));
        Method selfClassSingleObjectAtMethod = class_getInstanceMethod(selfClass, @selector(safe_singleObjectAtIndex:));
        if (singleArrayIClass && selfClass && singleArrayIClassMethod && selfClassSingleObjectAtMethod) {
            method_exchangeImplementations(singleArrayIClassMethod, selfClassSingleObjectAtMethod);
        }

        Class array0Class = NSClassFromString(@"__NSArray0");
        Method array0ClassMethod = class_getInstanceMethod(array0Class, @selector(objectAtIndex:));
        Method selfClassObjectAtForArray0Method = class_getInstanceMethod(selfClass, @selector(safe_objectAtIndexForNSArray0:));
        if (array0Class && selfClass && array0ClassMethod && selfClassObjectAtForArray0Method) {
            method_exchangeImplementations(array0ClassMethod, selfClassObjectAtForArray0Method);
        }

    });
}

@end
