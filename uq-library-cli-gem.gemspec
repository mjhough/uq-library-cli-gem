require_relative './lib/uq_libraries/version'

Gem::Specification.new do |s|
    s.name        = 'uq-library-cli-gem'
    s.version     = UqLibraries::VERSION
    s.date        = '2017-10-28'
    s.summary     = "How busy are UQ libraries?"
    s.description = "Shows users how busy a selected UQ library is."
    s.authors     = ["Matt Hough"]
    s.email       = "matt@hough.tv"
    s.files       = ["lib/uq-libraries.rb", "lib/uq-libraries/cli.rb", "lib/uq-libraries/scraper.rb", "lib/uq-libraries/library.rb", "lib/uq-libraries/library_details.rb", "config/environment.rb"]
    s.homepage    = 'http://rubygems.org/gems/uq-library-cli-gem'
    s.license     = 'MIT'
    s.executables << 'uq-libraries'

    s.add_runtime_dependency "colorize", "~> 0.8.1"

    s.add_development_dependency "bundler", "~> 1.15.4"
    s.add_development_dependency "rake", "~> 12.0.0"
    s.add_development_dependency "rspec", ">= 0"
    s.add_development_dependency "nokogiri", ">= 0"
    s.add_development_dependency "pry", ">= 0"
end