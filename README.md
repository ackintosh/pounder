# Pounder

Pounder is a POP server for operation verification for the system to
parse the mail.

master: [![Build
Status](https://travis-ci.org/ackintosh/pounder.png?branch=master)](https://travis-ci.org/ackintosh/pounder)

develop: [![Build
Status](https://travis-ci.org/ackintosh/pounder.png?branch=develop)](https://travis-ci.org/ackintosh/pounder)

## Installation

    $ gem install pounder

## Usage

### mail data

Create a `.pounder` directory in the current directory.

Save `.pounder` directory the source of the email that you want to
operation verification.

### start

    $ bundle exec pounder {port}

If POP acceess to the host that started Pounder, you can get the mail
data that is prepared in advance.

It will not be deleted when you receive mail, you can repeat access.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
