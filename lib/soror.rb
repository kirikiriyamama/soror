require 'aws-sdk-ec2'
require 'forwardable'
require 'soror/ec2'
require 'soror/version'
require 'yaml'

module Soror
  class << self
    extend Forwardable
    def_delegators Aws, :config, :config=
    def_delegators Soror::EC2::Instance, :search_by
  end
end
