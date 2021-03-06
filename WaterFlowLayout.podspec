
Pod::Spec.new do |s|

s.license      = { :type => 'MIT', :file => 'LICENSE' }

s.name         = "WaterFlowLayout"
s.version      = "1.0.4"
s.summary      = "WaterFlowLayout is a subclass of UICollectionViewFlowLayout, it's' very simple. You can very easily control the column count of waterflow"

s.homepage     = "https://github.com/goodyboy6/"
s.author       = {"goodyboy6" => "xiaoluo.yxl@alibaba-inc.com"}

s.platform     = :ios, '7.0'
s.ios.deployment_target = '7.0'
s.requires_arc = true

s.source =  { :git => "https://github.com/goodyboy6/WaterFlowLayout.git" , :tag => "1.0.4"}
s.source_files = "WaterFlowDemo/Class/*.{h,m}"
s.public_header_files = "WaterFlowDemo/Class/*.h"

end