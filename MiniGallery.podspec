#
# Be sure to run `pod lib lint MiniGallery.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MiniGallery'
  s.version          = '0.1.0'
  s.summary          = 'A short description of MiniGallery.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/Shevckcccc/MiniGallery'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'K' => 'yuyk1113@gmail.com' }
  s.source           = { :git => 'https://github.com/Shevckcccc/MiniGallery.git', :tag => s.version.to_s }
  
  s.ios.deployment_target = '10.0'
  s.swift_version = '5.0'
  s.source_files = 'MiniGallery/Classes/**/*'
  
  # s.resource_bundles = {
  #   'MiniGallery' => ['MiniGallery/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  s.dependency 'SnapKit'
end
