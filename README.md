# WaterFlowLayout

## git私有库的创建注意点：版本号、tag以及licence

#### warning '[source] The version should be included in the Git tag.'
> 修改version号和tag号一致后，通过命令pod lib lint检查是ok的，但执行pod trunk push *.podspec之后，会直接提示：
> [!] The podspec does not validate. 
> 随后又执行了pod trunk lint *.podspec后，提示
> [!] The spec did not pass validation, due to 1 error.
> 好陶醉的提示，尝试升级了cocoapods到1.0.0.beta.2版本后，终于有了详细的提示：
> warning: Could not find remote branch 1.0.2 to clone.
> fatal: Remote branch 1.0.2 not found in upstream origin 
> 额，原来tag只是被我打在本地了，push到origin就ok了.在通过lint验证就都ok了。
#### unable to find a license file
> 将podspec文件中的 s.license = "MIT"修改为s.license = { :type => 'MIT', :file => 'LICENSE' } 

##参考
+ http://guides.cocoapods.org/making/getting-setup-with-trunk
+ http://guides.cocoapods.org/making/specs-and-specs-repo.html
+ http://blog.csdn.net/wzzvictory/article/details/20067595
+ http://ishalou.com/blog/2012/10/16/how-to-create-a-cocoapods-spec-file/
+ http://codingtime.me/post/posts/leng-zhi-shi/2014_10_07_cocoapods
