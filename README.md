Distribute
----------

distribute is a gem for creating distributions of your code.
If you have any statically released binaries or files then this will help you.
Lots of people used Github Downloads before, but now can't.
With distribute this is made much easier.

Requires git, at the moment.


Using Distribute
================

Either use in a rake task:

``` ruby
files = [
  'bin/whatever',
  'dist/thing.js',
  'dist/thing.min.js'
]

version = File.read("VERSION")

desc "Releasing the new binary"
task :release do
  Release.new(files, version).distribute!
end

desc "Releasing the latest binary"
task :latest do
  Latest.new(files).distribute!
end
```

Or the binary provided by us:

``` ruby
distribute --version=1.0.0 ember.js ember.min.js [filename...]
```

For more information, check the [wiki](/wiki)


Installing Distribute
=====================

Add this line to your application's Gemfile:

    gem 'distribute'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install distribute


Contributing
============

  1. Fork it
  2. Create your feature branch (`git checkout -b my-new-feature`)
  3. Commit your changes (`git commit -am 'Add some feature'`)
  4. Push to the branch (`git push origin my-new-feature`)
  5. Create new Pull Request

A list of past contributors:


License
=======

    Copyright (c) 2013 Kurtis Rainbolt-Greene

    MIT License

    Permission is hereby granted, free of charge, to any person obtaining
    a copy of this software and associated documentation files (the
    "Software"), to deal in the Software without restriction, including
    without limitation the rights to use, copy, modify, merge, publish,
    distribute, sublicense, and/or sell copies of the Software, and to
    permit persons to whom the Software is furnished to do so, subject to
    the following conditions:

    The above copyright notice and this permission notice shall be
    included in all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
    EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
    MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
    NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
    LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
    OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
    WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
