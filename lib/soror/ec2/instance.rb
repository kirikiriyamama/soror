module Soror
  module EC2
    class Instance
      extend Soror::EC2

      def self.search_by(tags)
        warn %q{[DEPRECATION] `Soror::EC2::Instance.search_by` won't be memoized. If you want to memoize, use `Soror.start_memoizing`.}
        AWS.memoize do
          ec2.instances.
            filter('instance-state-name', 'running').
            select{ |i| tags.all?{ |k, v| i.tags[k.to_s] == v.to_s } }
        end
      end
    end
  end
end
