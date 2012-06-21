# -*- encoding: utf-8 -*-
require File.expand_path('../lib/gdal-ruby/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Zac McCormick"]
  gem.email         = ["zac.mccormick@gmail.com"]
  gem.description   = %q{GDAL/OGR bindings for ruby}
  gem.summary       = %q{GDAL/OGR bindings for ruby. Currently contains native extensions for GDAL 1.9.1}
  gem.homepage      = "https://github.com/zhm/gdal-ruby"

  gem.files         = `git ls-files`.split($\)
  gem.extensions    = ['ext/gdal-ruby/gdal/extconf.rb', 'ext/gdal-ruby/gdalconst/extconf.rb',
                       'ext/gdal-ruby/ogr/extconf.rb',  'ext/gdal-ruby/osr/extconf.rb']
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "gdal"
  gem.require_paths = ["lib"]
  gem.version       = Gdal::Ruby::VERSION

  gem.add_development_dependency 'rake',          ['>= 0']
  gem.add_development_dependency 'rake-compiler', ['>= 0']
  gem.add_development_dependency 'rspec',         ['>= 0']
end
