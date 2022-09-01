#import "RNStoreReview.h"
#import <StoreKit/SKStoreReviewController.h>

#ifdef RCT_NEW_ARCH_ENABLED
#import <RNStoreReviewSpec/RNStoreReviewSpec.h>
#endif

@implementation RNStoreReview

- (dispatch_queue_t)methodQueue
{
  return dispatch_get_main_queue();
}

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(requestReview)
{
  [SKStoreReviewController requestReview];
}

#ifdef RCT_NEW_ARCH_ENABLED
- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:(const facebook::react::ObjCTurboModule::InitParams &)params
{
  return std::make_shared<facebook::react::NativeRNStoreReviewSpecJSI>(params);
}
#endif

@end
