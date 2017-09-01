#
#  Be sure to run `pod spec lint MyTest.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "MyTest"
  s.version      = "0.0.1"
  s.summary      = "A Test For Pod Project"
  s.homepage     = "https://github.com/Cuiyun/test2"
  s.license      = "MIT"
  s.author             = { "cuiyun" => "675162379@qq.com" }
  s.platform     = :ios, "5.0"
  s.source       = { :git => "https://github.com/Cuiyun/test2.git", :tag => "0.0.1" }
  s.source_files  = "Person", "Person/**/*.{h,m}"
  s.framework  = "UIKit"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  # s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
