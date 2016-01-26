# WaterFlowLayout

## git私有库的创建注意点：版本号、tag以及licence

######问题汇总
+ warning '[source] The version should be included in the Git tag.':  修改version号和tag号一致后，通过命令pod lib lint检查是ok的，但执行pod trunk push *.podspec之后，会直接提示：[!] The podspec does not validate. 这个问题还没解决。
+ - WARN  | [iOS] Unable to find a license file: 将podspec文件中的 s.license = "MIT"修改为s.license = { :type => 'MIT', :file => 'LICENSE' }

######参考
+ http://guides.cocoapods.org/making/getting-setup-with-trunk
+ http://guides.cocoapods.org/making/specs-and-specs-repo.html
+ http://blog.csdn.net/wzzvictory/article/details/20067595
+ http://ishalou.com/blog/2012/10/16/how-to-create-a-cocoapods-spec-file/
+ http://codingtime.me/post/posts/leng-zhi-shi/2014_10_07_cocoapods
