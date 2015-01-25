module Soror
  module EC2
    class Instance
      extend Soror::EC2

      def self.search_by(tags)
        AWS.memoize do
          ec2.instances.
            filter('instance-state-name', 'running').
            select{ |i| tags.all?{ |k, v| i.tags[k] == v } }
        end
      end
    end
  end
end
