Pod::Spec.new do |s|

 s.name = 'NFDownloadButton'
 s.version = '0.0.3'
 s.license = { :type => "MIT", :file => "LICENSE" }
 s.summary = 'Revamped Download Button'
 s.homepage = 'https://github.com/LeonardoCardoso/NFDownloadButton'
 s.social_media_url = 'https://twitter.com/leocardz'
 s.authors = { "Leonardo Cardoso" => "contact@leocardz.com" }
 s.source = { :git => "https://github.com/LeonardoCardoso/NFDownloadButton.git", :tag => s.version.to_s }
 s.platforms     = { :ios => "8.0" }
 s.requires_arc = true
 s.source_files  = "Sources/**/*.swift"
 s.framework  = "Foundation"

end
