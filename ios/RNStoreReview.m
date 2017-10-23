#import "RNStoreReview.h"
#import <StoreKit/SKStoreReviewController.h>

@implementation RNStoreReview

- (dispatch_queue_t)methodQueue
{
  return dispatch_get_main_queue();
}

RCT_EXPORT_MODULE()

- (NSDictionary *)constantsToExport
{
  return @{
    @"isAvailable": [SKStoreReviewController class] ? @(YES) : @(NO)
  };
}

RCT_EXPORT_METHOD(requestReview)
{
  [SKStoreReviewController requestReview];
}

+ (BOOL)requiresMainQueueSetup
{
  return YES;
}

@end
