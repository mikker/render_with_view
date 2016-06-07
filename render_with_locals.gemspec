lib = File.expand_path('../lib', __FILE__)
$:.unshift(lib) unless $:.include?(lib)
require 'render_with_locals/version'

Gem::Specification.new do |s|
  s.name = 'render_with_locals'
  s.version = RenderWithLocals::VERSION
  s.date = '2016-06-07'
  s.summary = 'Be explicit about what you send to your Rails views'
  s.authors = ['Mikkel Malmberg']
  s.email = ['mikkel@brnbw.com']
  s.files = Dir["{lib}/**/*.rb", "LICENSE", "*.md"]
  s.require_path = 'lib'
  s.homepage = 'https://github.com/mikker/render_with_locals'
  s.license = 'MIT'
end
