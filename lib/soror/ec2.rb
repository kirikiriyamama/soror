require 'soror/ec2/instance'

module Soror
  module EC2
    def ec2
      @@ec2 ||= AWS::EC2.new
    end
  end
end
