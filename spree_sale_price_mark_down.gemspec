lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'spree_sale_price_mark_down/version'

# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_sale_price_mark_down'
  s.version     = SpreeSalePriceMarkDown::VERSION
  s.summary       = %q{A handy tool for scheduling sale_price modifications}
  s.description   = %q{Admin tool allowing to recalculate products' sale prices based on their taxons. }
  s.required_ruby_version = '>= 2.1.0'

  s.email         = ["pawel@praesens.co"]
  s.authors       = ["Paweł Strzałkowski"]
  s.homepage      = "http://praesens.co/"
  s.license = 'BSD-3'

  s.files       = `git ls-files`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 3.1.3'
end
