# react-native-store-review

This module exposes the native APIs to ask the user to rate the app in the iOS App Store or Google Play store directly from within the app (requires iOS >= 14.0 or Android 5.0 with Google Play store installed). 

<img width="274" alt="Rating Dialog" src="https://cloud.githubusercontent.com/assets/378279/24377493/d22eb0b8-133f-11e7-9968-44d186a3801f.png">

## Installation

```bash
# Add dependency
yarn add react-native-store-review
# Link iOS dependency
pod install --project-directory=ios
# Compile project
react-native run-ios # or run-android
```

## Usage

The intention of this API is to ask the user to rate the app as a part of the user journey, typically as the user completes a task. **Since it's not possible to know if a dialog will be shown or not you should not call it as a result of tapping a button**, but rather as a side effect of an event happening in the app. 

```js
import * as StoreReview from 'react-native-store-review';

StoreReview.requestReview();
```

### Button

If you want to show a button or provide a fallback for OS versions not supporting these APIs, you can redirect the user to the respective stores to review the app there instead. 

```js
import { Linking, Platform } from 'react-native';

const APP_STORE_LINK = `itms-apps://apps.apple.com/app/id${IOS_APP_ID}?action=write-review`;
const PLAY_STORE_LINK = `market://details?id=${ANDROID_APP_ID}`;

const STORE_LINK = Platform.select({
  ios: APP_STORE_LINK,
  android: PLAY_STORE_LINK,
});

export const openReviewInStore = () => Linking.openURL(STORE_LINK)
```

## References

* [`SKStoreReviewController` for App Store](https://developer.apple.com/documentation/storekit/skstorereviewcontroller/requesting_app_store_reviews) 
* [`In-App Review API` for Google Play Store](https://developer.android.com/guide/playcore/in-app-review).

## Troubleshooting

### The dialog is not showing in the correct language on iOS

The strings in the dialog comes from the OS, if your translations are purely in JavaScript land you need to add meta data so iOS understand which languages you support, [see the official documentation](https://developer.apple.com/documentation/xcode/localization/adding_support_for_languages_and_regions).

### The dialog is not showing when I call `requestReview()`

##### (1)
For iOS you have to add LSApplicationQueriesSchemes as Array param to Info.plist and add itms-apps as one of params in this array to link appstore.

For example:
```js
<key>LSApplicationQueriesSchemes</key>
<array>
  <string>itms-apps</string>
</array>
```

##### or (2)
The dialog **is not showing while testing with TestFlight** but will be working normally once in production ([source](https://stackoverflow.com/questions/46770549/skstorereviewcontroller-requestreview-popup-is-not-showing-in-testflight-build/47048474#47048474)). Furthermore it will not work for enterprise apps as they are not available on the App Store, and Apple/Google will restrict the amount of times the API can be called to a few times per year in order prevent misuse. 
