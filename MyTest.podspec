Pod::Spec.new do |s|
  s.name         = "MyTest from cy"
  s.version      = "0.0.5"
  s.summary      = "A Test For Pod Project from cy ,xixixi"
  s.homepage     = "https://github.com/Cuiyun/test2"
  s.license      = "MIT"
  s.author       = { "cuiyun" => "675162379@qq.com" }
  s.platform     = :ios, "5.0"
  s.source       = { :git => "https://github.com/Cuiyun/test2.git", :tag => s.version.to_s }
  s.source_files  = "test谓词/*.{h,m}"
end
