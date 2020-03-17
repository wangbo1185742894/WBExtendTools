#
# Be sure to run `pod lib lint WBExtendTools.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'WBExtendTools'
  s.version          = '1.0.3'
  s.summary          = '收集的一些常用的工具方法'

  s.description      = <<-DESC
TODO: 整理了一些常用的工具方法
                       DESC

  s.homepage         = 'https://github.com/wangbo1185742894/WBExtendTools'

  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wangbo1185742894' => 'wangbo3919@163.com' }
  s.source           = { :git => 'https://github.com/wangbo1185742894/WBExtendTools.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'WBExtendTools/Classes/**/*'
  
  s.frameworks = 'UIKit','Foundation','CoreGraphics','QuartzCore'
  s.dependency 'GTMBase64'
end
