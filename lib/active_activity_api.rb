if ENV['ENV'] == 'development'
  require 'dotenv/load'
  require 'byebug'
end
require 'active_activity_api/version'
require 'active/data_coercion'
require 'active/activity'
require 'active_activity_api/client'

module ActiveActivityApi
  class Error < StandardError; end;
end
