Pod::Spec.new do |s|
  s.name         = "JRTViperPattern"
  s.version      = "0.1.2"
  s.summary      = "JRTViperPattern super classes to work in VIPER pattern"
  s.homepage     = "https://github.com/ifobos/JRTViperPattern"
  s.license      = "MIT"
  s.author       = { "ifobos" => "juancarlos.garcia.alfaro@gmail.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/ifobos/JRTViperPattern.git", :tag => "0.1.2" }
  s.source_files = "*.{h,m}"
  s.requires_arc = true
end
