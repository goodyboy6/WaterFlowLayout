
Pod::Spec.new do |s|

s.license      = "MIT"

s.name         = "WaterFlowLayout"
s.version      = "0.0.1"
s.summary      = "WaterFlowLayout is a subclass of UICollectionViewFlowLayout, it's' very simple. You can very easily control the column count of waterflow"

s.description  = <<-DESC
Water Flow Layout description
commit:d6ce2d91e220e1f6c5fe8d5ae4bb5897c2d4b972
DESC

s.homepage     = "https://github.com/goodyboy6/"
s.author       = {"goodyboy6" => "xiaoluo.yxl@alibaba-inc.com"}

s.platform     = :ios, '7.0'
s.ios.deployment_target = '7.0'
s.requires_arc = true

s.source =  { :git => "https://github.com/goodyboy6/WaterFlowLayout.git" , :tag => "0.0.1"}
s.source_files = 'WaterFlowDemo/Class/*.{h,m}'
s.public_header_files = "WaterFlowDemo/Class/*.h"

end