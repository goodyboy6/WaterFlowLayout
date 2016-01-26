
Pod::Spec.new do |s|

s.license      = "MIT"

s.name         = "WaterFlowLayout"
s.version      = "0.0.1"
s.summary      = "Water Flow Layout"

s.description  = <<-DESC
Water Flow Layout description
commit:d6ce2d91e220e1f6c5fe8d5ae4bb5897c2d4b972
DESC

s.homepage     = "https://github.com/goodyboy6/"
s.author       = {  "明越" => "luying.ly@alibaba-inc.com"}

s.platform     = :ios, '7.0'
s.ios.deployment_target = '7.0'
s.requires_arc = true

s.source =  { :git => "https://github.com/goodyboy6/WaterFlowLayout.git" , :tag => "0.0.1"}
s.source_files = 'WaterFlowDemo/**/*.{h,m}'
s.public_header_files = "WaterFlowDemo/**/*.h"

end