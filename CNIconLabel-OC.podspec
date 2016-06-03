Pod::Spec.new do |s|
  s.name         = 'CNIconLabel-OC'
  s.version      = '1.0.1'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.homepage     = 'https://git.oschina.net/congni/CNIconLabel-OC.git'
  s.authors      = { "葱泥" => "983818495@qq.com" }
  s.summary      = 'OC图标按钮控件'
  s.description      = <<-DESC
                      A longer description of U in Markdown format.

                      * IOS开发基本图标按钮空间
                      * pod使用方法: pod "CNIconLabel-OC"
                      * Try to keep it short, snappy and to the point.
                      * Finally, don't worry about the indent, CocoaPods strips it!
                      DESC

  s.ios.deployment_target = '7.0'
  s.source       =  { :git => "https://git.oschina.net/congni/CNIconLabel-OC.git", :tag => s.version.to_s }
  s.requires_arc = true
  s.source_files = 'CNIconLabel-OC/*.{h,m}'
  s.public_header_files = 'CNIconLabel-OC/*.{h}'
end