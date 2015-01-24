# Soror

Soror is EC2 instances searcher, EC2 instances is searched by tags

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'soror'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install soror

## Usage

```ruby
# Search for EC2 instances that have the tag { "Key": "Name", "Value": "Soror" }
# You can use methods of AWS::EC2::Instance to an element of return value
# See http://docs.aws.amazon.com/AWSRubySDK/latest/AWS/EC2/Instance.html
Soror::EC2::Instance.search_by('Name' => 'Soror') #=> [<AWS::EC2::Instance>, ...]
```

## Contributing

1. Fork it ( https://github.com/kirikiriyamama/soror/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
