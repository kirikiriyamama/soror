# Soror

Search for EC2 instances by tags :mag_right:

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'soror'
```

And then execute:

```
$ bundle
```

Or install it yourself as:

```
$ gem install soror
```

## Usage

```ruby
# Search for EC2 instances which have tags `[{ "Key": "role", "Value": "app" }, { "Key": "stage", "Value": "production" }]`
# You can use methods of Aws::EC2::Types::Instance for each element
# See http://docs.aws.amazon.com/sdkforruby/api/Aws/EC2/Types/Instance.html
Soror.search_by(role: 'app', stage: 'production') #=> [<Aws::EC2::Types::Instance>, ...]
```

### Configuration

```ruby
Soror.config.update(access_key_id: 'xxxxx', secret_access_key: 'xxxxx', region: 'ap-northeast-1')
```

In addition, Soror supports [a new and standardized way to manage credentials](http://blogs.aws.amazon.com/security/post/Tx3D6U6WSFGOK2H/A-New-and-Standardized-Way-to-Manage-Credentials-in-the-AWS-SDKs)

## CLI

`ATTR` is an instance method name of `Aws::EC2::Types::Instance`

```
$ soror --help
Usage: soror [options]
    -t, --tags='KEY=VAL,KEY=VAL,...'
    -a, --attributes=ATTR,ATTR,...
        --[no-]header
        --profile-name=NAME
        --credentials-path=PATH
        --access-key=KEY
        --secret-key=KEY
        --region=REGION
```

### Example

```
$ soror --tags 'role=app,stage=production' --attributes 'instance_id,public_ip_address' --profile-name 'kirikiriyamama' --region 'ap-northeast-1'
instance_id public_ip_address
i-xxxxx     xxx.xxx.xxx.xxx
i-xxxxx     xxx.xxx.xxx.xxx
```

```
$ ssh -i ~/.ssh/id_rsa ec2-user@$(soror --tags 'role=app,stage=production' --attributes 'instance_id,public_ip_address' --profile-name 'kirikiriyamama' --region 'ap-northeast-1' --no-header | peco | awk '$0 = $2')
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
