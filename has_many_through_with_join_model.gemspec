# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "has_many_through_with_join_model/version"

Gem::Specification.new do |s|
  s.name        = "has_many_through_with_join_model"
  s.summary     = %Q{Access the associated join model from any element in your has_many :through association collection}
  s.description = %Q{Access the associated join model from any element in your has_many :through association collection}
  s.authors = ["Tyler Rick"]
  s.email = "github.com@tylerrick.com"
  s.homepage = "http://github.com/TylerRick/has_many_through_with_join_model"

  s.add_dependency "activerecord", ">= 3.0.0"
  s.add_dependency "activesupport", ">= 3.0.0"
  s.add_development_dependency "rspec", ">= 2"
  s.add_development_dependency "sqlite3-ruby", ">= 0"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.version     = HasManyThroughWithJoinModel::Version
  s.platform    = Gem::Platform::RUBY
end
