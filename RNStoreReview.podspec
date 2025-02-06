require "json"
version = JSON.parse(File.read("./package.json"))["version"]

Pod::Spec.new do |s|
  s.name           = "RNStoreReview"
  s.version        = version
  s.summary        = "App Store Ratings for React Native."
  s.homepage       = "https://github.com/oblador/react-native-store-review"
  s.license        = "MIT"
  s.author         = { "Joel Arvidsson" => "joel@oblador.se" }
  s.platform       = :ios, "14.0"
  s.source         = { :git => "https://github.com/oblador/react-native-store-review.git", :tag => "v#{s.version}" }
  s.source_files   = "ios/*.{h,m,mm,swift}"
  s.preserve_paths = "**/*.js"
  s.ios.framework  = 'StoreKit'
  s.requires_arc = true

  s.dependency "React-Core"

  if defined? install_modules_dependencies
    install_modules_dependencies(s)
  end

end
