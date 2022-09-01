import RNStoreReview from "./NativeRNStoreReview"

/**
 * Asks the user to rate the app in the App/Play Store.
 * @throws Will throw an Error if native module is not present or not supported by the OS version.
 */
export function requestReview() {
  if (!RNStoreReview) {
    throw new Error('StoreReview native module not available, did you forget to link the library?');
  }

  return RNStoreReview.requestReview();
}
