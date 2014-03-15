# Pounder

Pounder is a POP server for operation verification for the system to
parse the mail.

## Build & Dependency Status

[![Gem Version](https://badge.fury.io/rb/sixpounder.png)](http://badge.fury.io/rb/sixpounder) [![Code
Climate](https://codeclimate.com/github/ackintosh/pounder.png)](https://codeclimate.com/github/ackintosh/pounder)

master: [![Build
Status](https://travis-ci.org/ackintosh/pounder.png?branch=master)](https://travis-ci.org/ackintosh/pounder) [![Coverage
Status](https://coveralls.io/repos/ackintosh/pounder/badge.png?branch=master)](https://coveralls.io/r/ackintosh/pounder?branch=master)

develop: [![Build
Status](https://travis-ci.org/ackintosh/pounder.png?branch=develop)](https://travis-ci.org/ackintosh/pounder) [![Coverage
Status](https://coveralls.io/repos/ackintosh/pounder/badge.png?branch=develop)](https://coveralls.io/r/ackintosh/pounder?branch=develop)

## Installation

    $ gem install sixpounder

*# Not a `pounder`*

## Usage

### mail data

Create a `.pounder` directory in the current directory.

Save `.pounder` directory the source of the email that you want to
operation verification.

### start

    $ bundle exec pounder [port]

If POP acceess to the host that started Pounder, you can get the mail
data that is prepared in advance.

It will not be deleted when you receive mail, you can repeat access.

`[port]` is optional.  
If it is omitted, a free port will be used automatically by [Ackintosh::Net::EmptyPort](https://github.com/ackintosh/ackintosh-net-empty_port).

#### `-f` option

    $ bundle exec pounder -f pounder@example.com

Pounder can change 'From' header to specified email address.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
