Pod::Spec.new do |s|

  s.name         = "AUIKit"
  s.version      = "0.0.1"
  s.summary      = "Advanced UIKit."
  s.description  = "Advanced UIKit approach."
  s.homepage     = "https://github.com/jobihormyroniuk/AUIKit"

  s.license      = "MIT"

  s.author             = { "Ihor Myroniuk" => "job.ihormyroniuk@gmail.com" }

  s.platform     = :ios, "10.0"

  s.source       = { :git => "https://github.com/jobihormyroniuk/AUIKit.git", :tag => "0.0.2" }

  s.source_files  = "AUIKit"

  s.swift_version = "4.2"

end
