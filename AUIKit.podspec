Pod::Spec.new do |s|

  s.name         = "AUIKit"
  s.version      = "1.0.0"
  s.summary      = "Advanced extension for UIKit framework"
  s.description  = "Advanced extension for UIKit framework."
  s.homepage     = "https://github.com/ihormyroniuk/AUIKit"

  s.license      = "MIT"

  s.author       = { "Ihor Myroniuk" => "ihormyroniuk@gmail.com" }

  s.platform     = :ios, "10.0"

  s.source       = { :git => "https://github.com/ihormyroniuk/AUIKit.git", :tag => "1.0.0" }

  s.source_files = "AUIKit/**/*.{swift}"

  s.swift_version = "4.2"

end
