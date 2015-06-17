Pod::Spec.new do |s|
  s.name         = "JRTViperPattern"
  s.version      = "0.0.1"
  s.summary      = "JRTViperPattern super classes to work in VIPER pattern"
  s.homepage     = "https://github.com/ifobos/JRTViperPattern"
  s.license      = "MIT"
  s.author       = { "ifobos" => "juancarlos.garcia.alfaro@gmail.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "http://EXAMPLE/JRTViperPattern.git", :tag => "0.0.1" }
  s.source_files = "*.{h,m}"
  s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
