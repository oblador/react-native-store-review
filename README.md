# react-native-store-review

This module exposes the native APIs to ask the user to rate the app in the iOS App Store or Google Play store directly from within the app (requires iOS >= 10.3 or Android 5.0 with Google Play store installed). 

<img width="274" alt="Rating Dialog" src="https://cloud.githubusercontent.com/assets/378279/24377493/d22eb0b8-133f-11e7-9968-44d186a3801f.png">

## Installation

`$ yarn add react-native-store-review`

### Mostly automatic installation

`$ react-native link react-native-store-review`

### Manual installation

1. In Xcode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-store-review` and add `RNStoreReview.xcodeproj`
3. In Xcode, in the project navigator, select your project. Add `libRNStoreReview.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)

### Using [CocoaPods](https://cocoapods.org/)

Add the following to your `Podfile` and run `pod install`:

```ruby
pod 'RNStoreReview', :path => '../node_modules/react-native-store-review/ios'
```

## Usage
```javascript
import * as StoreReview from 'react-native-store-review';

// This API is only available on iOS 10.3 or later
if (StoreReview.isAvailable) {
  StoreReview.requestReview();
}
```

## Notes

`StoreReview.isAvailable` will not return `false` if Apple's limit for showing the store rating has been reached. It simply returns if the API is available. You will have to keep track of that by yourself.

If you are using this library, you might want to know how the underlying `SKStoreReviewController` is working: first things first, [here is the doc](https://developer.apple.com/documentation/storekit/skstorereviewcontroller).

And having the API Reference might not be enough (the API has some arbitrary limits), that's why we recommend you to read [this guide](https://developer.apple.com/documentation/storekit/skstorereviewcontroller/requesting_app_store_reviews).

The short story behind this `SKStoreReviewController` is that Apple does not want apps to spam users with review requests. Therefore you're able to show this dialog only few times per year. It means that you need to be pretty sure when you want to show it and probably ask the user if he wants to review the app in a first place (before showing this costly dialog).

Another interesting point is that the dialog **is not showing while testing with TestFlight** but will be working normally once in production ([source](https://stackoverflow.com/questions/46770549/skstorereviewcontroller-requestreview-popup-is-not-showing-in-testflight-build/47048474#47048474)).

Read more about Google Play Store in-app-review [in the docs](https://developer.android.com/guide/playcore/in-app-review)