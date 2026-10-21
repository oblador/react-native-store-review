#import <Foundation/Foundation.h>

#ifdef RCT_NEW_ARCH_ENABLED

#import <RNStoreReviewSpec/RNStoreReviewSpec.h>
@interface RNStoreReview: NSObject <NativeRNStoreReviewSpec>

#else

#if __has_include(<React/RCTBridgeModule.h>)
#import <React/RCTBridgeModule.h>
#elif __has_include("RCTBridgeModule.h")
#import "RCTBridgeModule.h"
#else
#import <React-Core/RCTBridgeModule.h>
#endif
@interface RNStoreReview : NSObject <RCTBridgeModule>

#endif

@end
