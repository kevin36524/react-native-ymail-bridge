Pod::Spec.new do |s|
  s.name             = "YMRNStaticPod"
  s.version          = "1.0.0"
  s.summary          = "Yahoo Mail++ React Native Pods"
  s.homepage         = "https://git.ouroath.com/ymobilemail/mailpp-common-assets"
  s.author           = { "The Mail Team" => "saturn-ios-dev@oath.com" }
  s.source           = { :git => "git@git.ouroath.com:ymobilemail/mailpp-common-assets.git", :tag => s.version.to_s }
  s.license          = { :type => 'Yahoo Internal', :text => 'YAHOO! CONFIDENTIAL & INTERNAL ONLY' }
  s.platform     = :ios, '9.0'
  s.requires_arc = true

  s.source_files = 'include/**/*.{h,m}'
  s.ios.vendored_library = 'lib/*.a'
end

