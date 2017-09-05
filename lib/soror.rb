require 'aws-sdk-ec2'
require 'forwardable'
require 'soror/version'

class Soror
  class << self
    extend Forwardable
    def_delegators Aws, :config, :config=

    def search_by(tags)
      new.search_by(tags)
    end
  end

  def initialize
    @ec2 = Aws::EC2::Client.new
  end

  def search_by(tags)
    filters = [{ name: 'instance-state-name', values: ['running'] }]
    tags.each do |k, v|
      filters << { name: "tag:#{k}", values: [v] }
    end

    @ec2.describe_instances(filters: filters).reservations.map(&:instances).flatten
  end

  module EC2
    class Instance
      # Deprecated
      def self.search_by(tags)
        Soror.search_by(tags)
      end
    end
  end
end
