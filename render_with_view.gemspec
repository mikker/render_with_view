# encoding: utf-8
require File.expand_path("../lib/render_with_view/version", __FILE__)

Gem::Specification.new do |s|
  s.name = 'render_with_view'
  s.summary = 'Be explicit about what you send to your Rails views'
  s.version = RenderWithView::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors = ['Mikkel Malmberg']
  s.email = ['mikkel@brnbw.com']
  s.homepage = 'https://github.com/mikker/render_with_view'
  s.license = 'MIT'

  s.files = `git ls-files`.split("\n")
  s.require_path    = "lib"
end
