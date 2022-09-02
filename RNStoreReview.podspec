require "json"
version = JSON.parse(File.read("./package.json"))["version"]

folly_compiler_flags = '-DFOLLY_NO_CONFIG -DFOLLY_MOBILE=1 -DFOLLY_USE_LIBCPP=1 -Wno-comma -Wno-shorten-64-to-32'

Pod::Spec.new do |s|
  s.name           = "RNStoreReview"
  s.version        = version
  s.summary        = "App Store Ratings for React Native."
  s.homepage       = "https://github.com/oblador/react-native-store-review"
  s.license        = "MIT"
  s.author         = { "Joel Arvidsson" => "joel@oblador.se" }
  s.platform       = :ios, "12.4"
  s.source         = { :git => "https://github.com/oblador/react-native-store-review.git", :tag => "v#{s.version}" }
  s.source_files   = "ios/*.{h,m,mm}"
  s.preserve_paths = "**/*.js"
  s.ios.framework  = 'StoreKit'
  s.requires_arc = true

  s.dependency "React-Core"

  # This guard prevent to install the dependencies when we run `pod install` in the old architecture.
  if ENV['RCT_NEW_ARCH_ENABLED'] == '1' then
      s.compiler_flags = folly_compiler_flags + " -DRCT_NEW_ARCH_ENABLED=1"
      s.pod_target_xcconfig    = {
        "HEADER_SEARCH_PATHS" => "\"$(PODS_ROOT)/boost\"",
        "CLANG_CXX_LANGUAGE_STANDARD" => "c++17"
      }

      s.dependency "React-Codegen"
      s.dependency "RCT-Folly"
      s.dependency "RCTRequired"
      s.dependency "RCTTypeSafety"
      s.dependency "ReactCommon/turbomodule/core"
  end

end
