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
    def_delegators Aws, :config=

    def config(hash)
      warn '[DEPRECATION] `Soror.config` will be removed. Please use `Soror.config=` instead.'
      hash.symbolize_keys.each{ |k, v| Aws.config[k] = v }
    end
  end
end

File.expand_path('~/.soror').tap do |path|
  Soror.config.update(YAML.load_file(path).symbolize_keys) if File.exists?(path)
end
