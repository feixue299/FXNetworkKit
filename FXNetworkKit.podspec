Pod::Spec.new do |spec|
  spec.name         = "FXNetworkKit"
  spec.version      = "1.2.7"
  spec.summary      = "A FXNetworkKit"
  spec.homepage     = "https://github.com/feixue299/FXNetworkKit"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "wpf" => "1569485690@qq.com" }
  spec.platform     = :ios, "8.0"
  spec.source       = { :git => "https://github.com/feixue299/FXNetworkKit.git", :tag => "#{spec.version}" }
  spec.swift_version = '5.0'
  spec.source_files  = "Sources", "Sources/**/*.{swift}"
  spec.requires_arc = true
  spec.dependency "Moya"
end