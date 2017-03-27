# react-native-store-review

This module exposes the native iOS APIs to ask the user to rate the app in the iOS App Store directly from within the app (requires iOS >= 10.3). 

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
pod 'RNStoreReview', :path => 'node_modules/react-native-store-review/ios'
```

## Usage
```javascript
import * as StoreReview from 'react-native-store-review';

// This API is only available on iOS 10.3 or later
if (StoreReview.isAvailable) {
  StoreReview.requestReview();
}
```
