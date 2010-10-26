require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "has_many_through_with_join_model"
    gem.summary     = %Q{Access the associated join model from any element in your has_many :through association collection}
    gem.description = %Q{Access the associated join model from any element in your has_many :through association collection}
    gem.email = "github.com@tylerrick.com"
    gem.homepage = "http://github.com/TylerRick/has_many_through_with_join_model"
    gem.authors = ["Tyler Rick"]
    gem.add_dependency "activerecord", ">= 0"
    gem.add_dependency "activesupport", ">= 0"
    gem.add_development_dependency "rspec", ">= 0"
    gem.add_development_dependency "sqlite3-ruby", ">= 0"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

#----------------------------------------------------------------------------------------------------
require 'spec/rake/spectask'
desc 'Run all examples.'
Spec::Rake::SpecTask.new('spec') do |t|
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.spec_opts = ["-c"]
end

desc "Run all examples with RCov"
Spec::Rake::SpecTask.new('examples_with_rcov') do |t|
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.rcov = true
  t.rcov_opts = ['--exclude', '/opt,spec,Library']
end

#----------------------------------------------------------------------------------------------------
require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "has_many_through_with_join_model #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

#----------------------------------------------------------------------------------------------------
task :test => :check_dependencies

task :default => :test
