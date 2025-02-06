#import <Foundation/Foundation.h>

#ifdef RCT_NEW_ARCH_ENABLED

#import <RNStoreReviewSpec/RNStoreReviewSpec.h>
@interface RNStoreReview: NSObject <NativeRNStoreReviewSpec>

#else

#import <React/RCTBridgeModule.h>
@interface RNStoreReview : NSObject <RCTBridgeModule>

#endif

@end
