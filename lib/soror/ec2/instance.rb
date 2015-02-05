module Soror
  module EC2
    class Instance
      extend Soror::EC2

      def self.search_by(tags)
        ec2.instances.
          filter('instance-state-name', 'running').
          select{ |i| tags.all?{ |k, v| i.tags[k.to_s] == v.to_s } }
      end
    end
  end
end
