Pod::Spec.new do |s|
  s.name         = "JustSignals"
  s.version      = "0.1.0"
  s.summary      = "Signals to replace delegates and NotificationCenter, nothing more."
  s.description  = <<-DESC
    JustSignals is a type-safe alternative to NotificationCenter and delegates.
    Use it if you don't need binding and rx magic in your project,
    and just want to replace NotificationCenter with something more strict and safe.
  DESC
  s.homepage     = "https://github.com/devandsev/JustSignals"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Andrey Sevrikov" => "devandsev@gmail.com" }
  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.9"
  s.source       = { :git => s.homepage + ".git", :tag => s.version.to_s }
  s.source_files = "Sources/*"
  s.frameworks   = "Foundation"
end
