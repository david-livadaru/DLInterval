Pod::Spec.new do |s|

s.name         = "DLInterval"
s.version      = "1.3.0"
s.summary      = "A Swift module which provides an abstractions of mathematical intervals."

s.homepage     = "https://github.com/davidlivadaru/DLInterval"

s.license      = "MIT (example)"
s.license      = { :type => "MIT", :file => "LICENSE" }

s.author       = "David Livadaru"

s.ios.deployment_target = "10.0"
s.osx.deployment_target = "10.12"
s.watchos.deployment_target = "3.0"
s.tvos.deployment_target = "10.0"

s.source       = { :git => "https://github.com/davidlivadaru/DLInterval.git", :tag => "#{s.version}" }

s.source_files = "Sources/**/*.{h,m,swift}"

end
