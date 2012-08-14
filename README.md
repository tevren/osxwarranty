# OSXwarranty

This gem brings together glarizza's ruby script for parsing warranty info from Apple and chilcote's ASD check.
## Installation

Add this line to your application's Gemfile:

    gem 'osxwarranty'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install osxwarranty

## Usage

If you want warranty info as well as asd info:

	osx = OSXwarranty::Base.new

	osx.info("SERIAL_NUMBER")

if you want warranty info without the asd info:
	osx = OSXwarranty::Base.new

	osx.get_warranty_info("SERIAL_NUMBER")

If you want just the model info:
	osx = OSXwarranty::Base.new

	osx.get_model_info("SERIAL_NUMBER")	


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
