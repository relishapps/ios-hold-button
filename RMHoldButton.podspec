#
# Be sure to run `pod lib lint RMHoldButton.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "RMHoldButton"
  s.version          = "1.0.0"
  s.summary          = "A must have UIButton subclass for desctructive actions."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
                       A Swift subclass of UIButton that has to be held for a configurable amount of time before it performs an action
                       DESC

  s.homepage         = "https://github.com/relishmedia/ios-hold-button"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Dan Sinclair" => "dansinclair@me.com" }
  s.source           = { :git => "https://github.com/relishmedia/ios-hold-button.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'RMHoldButton/Classes/**/*'
  # s.resource_bundles = {
  #   'RMHoldButton' => ['RMHoldButton/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
