# Soror

Search for EC2 instances by tags :mag_right:

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
# Search for EC2 instances which have the tag `{ "Key": "name", "Value": "soror" }`
# You can use methods of Aws::EC2::Instance to an element of return value
# See http://docs.aws.amazon.com/sdkforruby/api/Aws/EC2/Instance.html
Soror::EC2::Instance.search_by(name: 'soror') #=> [<Aws::EC2::Instance>, ...]
```

### Configuration

```ruby
Soror.config.update(access_key_id: 'xxxxx', secret_access_key: 'xxxxx', region: 'ap-northeast-1')
```

In addition, Soror supports [a new and standardized way to manage credentials](http://blogs.aws.amazon.com/security/post/Tx3D6U6WSFGOK2H/A-New-and-Standardized-Way-to-Manage-Credentials-in-the-AWS-SDKs)

## CLI

`ATTR` is an instance method name of `Aws::EC2::Instance`

```
$ soror --help
Usage: soror [options]
    -t, --tag='KEY=VALUE'
    -a, --attributes=ATTR,ATTR,...
        --[no-]header
        --profile-name=NAME
        --credentials-path=PATH
        --access-key=KEY
        --secret-key=KEY
        --region=REGION

$ soror --profile-name 'kirikiriyamama' --region 'ap-northeast-1' --tag 'name=soror' --attributes 'instance_id,public_ip_address'
instance_id public_ip_address
i-xxxxx     xxx.xxx.xxx.xxx
i-xxxxx     xxx.xxx.xxx.xxx
```

## Required permissions

```js
{
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "ec2:Describe*",
      "Resource": "*"
    }
  ]
}
```

## Contributing

1. Fork it ( https://github.com/kirikiriyamama/soror/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
