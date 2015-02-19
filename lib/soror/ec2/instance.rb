module Soror
  module EC2
    class Instance
      class << self
        include Soror::EC2

        def search_by(tags)
          filters = [].tap do |array|
            array << { name: 'instance-state-name', values: ['running'] }
            tags.each do |k, v|
              array << { name: "tag:#{k}", values: [v] }
            end
          end
          resource.instances(filters: filters).to_a
        end
      end
    end
  end
end
