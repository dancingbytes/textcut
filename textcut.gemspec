# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "textcut/version"

Gem::Specification.new do |s|

  s.name = 'textcut'
  s.version = Textcut::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors = ['Tyralion', 'Redfield']
  s.email = ['tyralion@dancingbytes.ru', 'redfield@dancingbytes.ru']
  s.homepage = 'https://github.com/dancingbytes/textcut'
  s.summary = 'Cutting text for rails 3'
  s.description = 'Cutting text for rails 3'

  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ['lib']

  s.licenses = ['BSD']

  s.add_dependency 'railties', ['>= 3.0.0']
  s.add_dependency 'nokogiri', ['>= 1.5']

end
