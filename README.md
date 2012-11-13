# APSIS API wrapper for Ruby

A simple API wrapper for the APSIS mail marketing service. Currently
only supports adding subscribers to a mailing list.

## Installation

Add this line to your application's Gemfile:

    gem 'apsis'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install apsis

## Usage

Either provide your APSIS API key using the APSIS_API_KEY environment
variable (recommended) or provide it as an argument when you instantiate a new Apsis object 

    apsis = Apsis.new
    # Add two new subscribers to the mailing list with id 123456
    apsis.create_subscribers(123456, [{'Email': 'johndoe@example.com', 'Name':
'John Doe'}, {'Email: 'janedoe@example.com', 'Name':
'jane.doe@example.com'}] # Note that APSIS wants these keys to be capitalized.


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
