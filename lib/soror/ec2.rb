require 'soror/ec2/instance'

module Soror
  module EC2
    def client
      @@client ||= Aws::EC2::Client.new
    end

    def resource
      @@resource ||= Aws::EC2::Resource.new(client: client)
    end
  end
end
