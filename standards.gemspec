require_relative "lib/standards/version"

Gem::Specification.new do |spec|
  spec.name        = "standards"
  spec.version     = Standards::VERSION
  spec.authors     = ["Adam Sumner"]
  spec.email       = ["adam@gojilabs.com"]
  spec.homepage    = 'https://github.com/gojilabs/rails-standards'
  spec.summary     = "Contains Goji Labs Ruby on Rails configuration standards"
  spec.description = ""
  spec.license     = "See \"License\" section in README"
  
  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "none"

  spec.metadata["homepage_uri"]    = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"]   = spec.homepage

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency 'lograge',       '~> 0.12'
  spec.add_dependency 'oj',            '~> 3.15'
  spec.add_dependency 'puma',          '~> 5.6'
  spec.add_dependency 'rack-cors',     '~> 1.1'
  spec.add_dependency 'rails',         '>= 7.0.3'
  spec.add_dependency 'rollbar',       '~> 3.3'
  spec.add_dependency 'rswag-api',     '~> 2.10'
  spec.add_dependency 'rswag-ui',      '~> 2.10'
  spec.add_dependency 'faraday',       '~> 2.7'
  spec.add_dependency 'httpx',         '~> 0.24'
  spec.add_dependency 'faraday-retry', '~> 2.2'
end
