require 'aws-sdk-v1'
require 'soror/ec2'
require 'soror/version'
require 'yaml'

module Soror
  def self.config(options)
    AWS.config(options)
  end
end

File.expand_path('~/.soror').tap do |path|
  File.exists?(path) && Soror.config(YAML.load_file(path))
end
