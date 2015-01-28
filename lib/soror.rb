require 'aws-sdk-v1'
require 'soror/ec2'
require 'soror/version'

module Soror
  def self.config(options)
    AWS.config(options)
  end
end
