//
//  NSDictionary+FHExtension.h
//  FHKit
//
//  Created by MADAO on 16/8/30.
//  Copyright © 2016年 MADAO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (FHExtension)


@end

@interface NSMutableDictionary (FHExtension)
/**
 *  Set an object for a key, ignore nil object to avoid crash
 *
 *  @param anObject An Object, nil would be Ok.
 *  @param aKey     Key for the Object
 */
- (void)setObjectOrNil:(id)anObject forKey:(id<NSCopying>)aKey;

@end