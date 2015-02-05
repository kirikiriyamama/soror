require 'aws-sdk-v1'
require 'forwardable'
require 'soror/ec2'
require 'soror/version'
require 'yaml'

module Soror
  class << self
    extend Forwardable
    def_delegators AWS, :config, :start_memoizing, :stop_memoizing
  end
end

File.expand_path('~/.soror').tap do |path|
  File.exists?(path) && Soror.config(YAML.load_file(path))
end
