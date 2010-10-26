require 'rubygems'
require 'spec'
require 'spec/autorun'
require 'active_support'
require 'active_record'

$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../lib')
require 'has_many_through_with_join_model'

require 'connection_and_schema'
require 'models/user'
require 'models/group'
require 'models/membership'


Spec::Runner.configure do |config|
end
