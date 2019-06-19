Pod::Spec.new do |s|
  s.name            = "GDCheckbox"
  s.version         = "1.0.0"
  s.summary         = "Simple checkbox/radio box component for iOS"
  s.homepage        = "https://github.com/saeid/GDCheckbox"
  s.screenshots     = "https://github.com/saeid/GDCheckbox/blob/master/screenshots/example.gif?raw=true"
  s.license         = { :type => 'MIT', :file => 'LICENSE' } 
  s.authors         = { "saeid" => "saeid.basirniaa@gmail.com" }
  s.source          = { :git => "https://github.com/saeid/GDCheckbox.git", :tag => s.version }
  s.swift_version   = '5.0'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Source/*'
end
