

Pod::Spec.new do |s|

  s.name         = "YQAdvCircleView"
  s.version      = "0.0.1"
  s.summary      = "A advertisement circle play view."
  s.homepage     = "https://github.com/a770322699/YQAdvCircleView/tree/master"
  s.license      = "MIT"
  s.author             = { "YiQuan" => "770322699@qq.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/a770322699/YQAdvCircleView.git", :tag => "#{s.version}" }
  s.requires_arc = true
  s.frameworks = "Foundation", "UIKit"
  s.dependency "Masonry", "~> 0.6"
  s.dependency "SDWebImage", "~> 3.8"
  s.source_files = "YQAdvCircleView/**/*.{h,m}"

end
