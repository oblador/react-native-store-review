import { NativeModules } from 'react-native';

const { RNStoreReview } = NativeModules;

/**
 * Whether or not the requestReview() function is available.
 */
export const isAvailable = !!RNStoreReview && RNStoreReview.isAvailable;

/**
 * Asks the user to rate the app in the iOS App Store.
 * @throws Will throw an Error if native module is not present or not supported by the iOS version.
 */
export function requestReview() {
  if (!RNStoreReview) {
    throw new Error('StoreReview native module not available, did you forget to link the library?');
  }
  if (!isAvailable) {
    throw new Error('StoreReview is not available');
  }
  return RNStoreReview.requestReview();
}
