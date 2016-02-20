//
//  FHOSVersionTool.h
//  FHKit
//
//  Created by MADAO on 16/2/17.
//  Copyright © 2016年 MADAO. All rights reserved.
//

/**
 *  以下方法都是在处理运行时判断系统版本的问题，如果只需要在编译期间判断，则不建议使用以下宏
 */
#ifndef FHOSVersionTool_h
#define FHOSVersionTool_h

#pragma mark - OSVersion
/**是否iOS6以后版本判断*/
#ifndef kCFCoreFoundationVersionNumber_iOS_6_0
    #define kCFCoreFoundationVersionNumber_iOS_6_0 793.00
#endif
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_6_0
    #define IF_IOS6_OR_GREATER(...) \
    if (kCFCoreFoundationVersionNumber >= kCFCoreFoundationVersionNumber_iOS_6_0) \
    { \
        __VA_ARGS__ \
    }
#else
    #define IF_IOS6_OR_GREATER(...)
#endif

/**是否iOS7以后版本判断*/
#ifndef kCFCoreFoundationVersionNumber_iOS_7_0
    #define kCFCoreFoundationVersionNumber_iOS_7_0 847.20
#endif
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_7_0
    #define IF_IOS7_OR_GREATER(...) \
    if (kCFCoreFoundationVersionNumber >= kCFCoreFoundationVersionNumber_iOS_7_0) \
    { \
        __VA_ARGS__ \
    }
#else
    #define IF_IOS7_OR_GREATER(...)
#endif

/**是否iOS8以后版本判断*/
#ifndef kCFCoreFoundationVersionNumber_iOS_8_0
    #define kCFCoreFoundationVersionNumber_iOS_8_0 1140.1
#endif
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    #define IF_IOS8_OR_GREATER(...) \
    if (kCFCoreFoundationVersionNumber >= kCFCoreFoundationVersionNumber_iOS_8_0) \
    { \
        __VA_ARGS__ \
    }
#else
    #define IF_IOS8_OR_GREATER(...)
#endif


#pragma mark - PreVersion
/**版本在7之前*/
#define IF_PRE_IOS7(...) \
if (kCFCoreFoundationVersionNumber < kCFCoreFoundationVersionNumber_iOS_7_0) \
{ \
    __VA_ARGS__ \
}

/**版本在8之前*/
#define IF_PRE_IOS8(...) \
if (kCFCoreFoundationVersionNumber < kCFCoreFoundationVersionNumber_iOS_8_0) \
{ \
    __VA_ARGS__ \
}

//#define IF_PRE_IOS9(...) \
//if (kCFCoreFoundationVersionNumber < kCFCoreFoundationVersionNumber_iOS_9_0) \
//{ \
//    __VA_ARGS__ \
//}
///**是否iOS9以后版本判断*/
//#ifndef kCFCoreFoundationVersionNumber_iOS_9_0
//#define kCFCoreFoundationVersionNumber_iOS_9_0 1140.1
//#endif
//#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_9_0
//#define IF_IOS9_OR_GREATER(...) \
//if (kCFCoreFoundationVersionNumber >= kCFCoreFoundationVersionNumber_iOS_8_0) \
//{ \
//__VA_ARGS__ \
//}
//#else
//#define IF_IOS8_OR_GREATER(...)
//#endif

#endif /* FHOSVersionTool_h */
