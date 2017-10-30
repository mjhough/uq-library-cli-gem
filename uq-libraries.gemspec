require_relative './lib/uq_libraries/version'

Gem::Specification.new do |s|
    s.name        = 'uq-libraries'
    s.version     = UqLibraries::VERSION
    s.date        = '2017-10-28'
    s.summary     = "How busy are UQ libraries?"
    s.description = "Shows users how busy a selected UQ library is."
    s.authors     = ["Matt Hough"]
    s.email       = "matt@hough.tv"
    s.files       = ["lib/uq_libraries.rb", "lib/uq_libraries/cli.rb", "lib/uq_libraries/scraper.rb", "lib/uq_libraries/library.rb", "lib/uq_libraries/library_details.rb", "config/environment.rb"]
    s.homepage    = 'http://rubygems.org/gems/uq-libraries'
    s.license     = 'MIT'
    s.executables << 'uq-libraries'

    s.add_runtime_dependency "colorize", "~> 0.8.1"

    s.add_development_dependency "bundler", "~> 1.15.4"
    s.add_development_dependency "rake", "~> 12.0.0"
    s.add_development_dependency "rspec", ">= 0"
    s.add_development_dependency "nokogiri", ">= 0"
    
    s.add_dependency "pry", ">= 0"
end