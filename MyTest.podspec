Pod::Spec.new do |s|
  s.name         = "MyTest"
  s.version      = "v0.0.2"
  s.summary      = "A Test For Pod Project"
  s.homepage     = "https://github.com/Cuiyun/test2"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "cuiyun" => "675162379@qq.com" }
  s.platform     = :ios, "5.0"
  s.source       = { :git => "https://github.com/Cuiyun/test2.git", :tag => "v0.0.2" }
  s.source_files  = "test谓词/*.{h,m}"
  s.framework  = "UIKit"
end
