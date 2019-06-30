# encoding: utf-8
Gem::Specification.new do |gem|
    gem.name = "fluent-plugin-tag_rewrite"
    gem.description = "This fluentd plugin allows you to rewrite message tag"
    gem.homepage = "https://github.com/tombolaltd/fluent-plugin-tag_rewrite"
    gem.summary = gem.description
    gem.version = "2.0.2"
    gem.license = 'MIT'
    gem.authors = ["Sohaib Maroof"]
    gem.email = "sohaib.maroof@tombola.com"
    gem.has_rdoc = false
    gem.files = `git ls-files`.split("\n")
    gem.require_paths = ['lib']
    gem.add_runtime_dependency "fluentd", [">= 0.14.0", "< 2"]
    gem.required_ruby_version = '>= 2.1'
  end
  
  
