require 'aws-sdk'
require 'forwardable'
require 'soror/ec2'
require 'soror/version'
require 'yaml'

unless {}.respond_to?(:symbolize_keys)
  class Hash
    def symbolize_keys
      dup.symbolize_keys!
    end

    def symbolize_keys!
      keys.each do |key|
        self[(key.to_sym rescue key) || key] = delete(key)
      end
      self
    end
  end
end

module Soror
  class << self
    extend Forwardable
    def_delegators Aws, :config, :config=
    def_delegators Soror::EC2::Instance, :search_by
  end
end

File.expand_path('~/.soror').tap do |path|
  if File.exists?(path)
    warn '[DEPRECATION] Support of `~/.soror` will be removed. Please use such as `~/.aws/credentials` instead.'
    Soror.config.update(YAML.load_file(path).symbolize_keys)
  end
end
