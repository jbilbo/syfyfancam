# frozen_string_literal: true

require_relative 'lib/syfyfancam/version'

Gem::Specification.new do |s|
  s.name = 'syfyfancam'
  s.version = Syfyfancam::VERSION
  s.homepage = 'https://github.com/jbilbo/syfyfancam'
  s.summary = 'Library to access syfyfancam.com videos'
  s.description = <<-DESCRIPTION
    Videos from syfyfancam.com are composed by a bunch of individual images,
    this library gives you an API to return the link to the images given the
    URL of the video.
  DESCRIPTION
  s.license = 'MIT'
  s.authors = ['Jonathan Hernández']
  s.email = 'jbilbo@gmail.com'

  s.files = %w[README.md LICENSE] + Dir['lib/**/*.rb']
  s.test_files = Dir['spec/**/*.rb']

  s.add_runtime_dependency('nokogiri', '~> 1.6')
  s.add_development_dependency('rspec', '~> 3.3')
end
