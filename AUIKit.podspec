Pod::Spec.new do |s|

  s.name         = "AUIKit"
  s.version      = "1.0.0"
  s.summary      = "AUIKit is an advanced extension for UIKit framework."
  s.description  = "AUIKit is an advanced extension for UIKit framework. It contains source code, principles and best practices for building efficient, reliable, maintable user interface."
  s.homepage     = "https://github.com/ihormyroniuk/AUIKit"
  s.license      = "MIT"
  s.author       = { "Ihor Myroniuk" => "ihormyroniuk@gmail.com" }
  s.platform     = :ios, "10.0"
  s.source       = { :git => "https://github.com/ihormyroniuk/AUIKit.git", :tag => "1.0.0" }
  s.source_files = "AUIKit/**/*.{swift}"
  s.swift_version = "4.2"

end
