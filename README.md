kor-output-ltsv
===

[![Build Status](https://travis-ci.org/ksss/kor-output-ltsv.svg?branch=master)](https://travis-ci.org/ksss/kor-output-ltsv)

LTSV output plugin for [kor](https://github.com/ksss/kor)

## Usage

```shell
$ kor markdown ltsv --help
Usage: kor [options]
        --key=KEY                    preset keys (e.g. foo,bar,baz) (default auto)
```

```shell
$ cat table.md
| foo | bar | baz |
| --- | --- | --- |
| 100 | 200 | 300 |
| 400 | 500 | 600 |

$ kor markdown ltsv < table.md
foo:100    bar:200    baz:300
foo:400    bar:500    baz:600

$ kor markdown ltsv --key=bar
bar:200
bar:500
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'kor-output-ltsv'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install kor-output-ltsv

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ksss/kor-output-ltsv. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Refs

- https://github.com/ksss/kor
