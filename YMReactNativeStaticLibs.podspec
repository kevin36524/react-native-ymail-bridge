Pod::Spec.new do |s|
  s.name             = "YMReactNativeStaticLibs"
  s.version          = "1.0.1"
  s.summary          = "Yahoo Mail++ React Native Static Libs"
  s.homepage         = "https://git.ouroath.com/ymobilemail/react-native-static-libs"
  s.author           = { "The Mail Team" => "saturn-ios-dev@oath.com" }
  s.source           = { :git => "git@git.ouroath.com:ymobilemail/react-native-static-libs.git", :tag => s.version.to_s }
  s.license          = { :type => 'Yahoo Internal', :text => 'YAHOO! CONFIDENTIAL & INTERNAL ONLY' }
  s.platform     = :ios, '9.0'
  s.requires_arc = true

  s.source_files = 'include/**/*.h'
  s.ios.vendored_library = 'lib/*.a'
end

