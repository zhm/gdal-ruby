# gdal-ruby [![Build Status](https://secure.travis-ci.org/zhm/gdal-ruby.png)](http://travis-ci.org/zhm/gdal-ruby)

Native bindings for GDAL/OGR for ruby. The GDAL repository contains ruby bindings
in the `swig/ruby` directory, but they aren't compiled or installed with default
installations of GDAL. In addition to not typically being installed, the GDAL build
system places the files in a global ruby directory which can cause some problems since
it's not the way other ruby libraries are typically installed. This gem simply turns
the ruby bindings from the GDAL repo into a gem which can be easily managed like all
of the other dependencies in your application. This simplifies the process of being
able to switch between versions of ruby and use bundler to manage the extension. Also
this gem enables you to install GDAL from the standard package managers that don't
include the ruby bindings.

## Installation

You will first need to install GDAL. There are several ways to install it, but the
easiest way is using a package manager.

OS X:

    brew install gdal

Ubuntu:

    sudo add-apt-repository ppa:ubuntugis/ubuntugis-unstable
    sudo apt-get update
    sudo apt-get install libgdal-dev

Add this line to your application's Gemfile:

    gem 'gdal'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gdal
    
Installing on Mac using The Framework way GDAL :
    
- Download and install GDAL Complete dmg from [kyngchaos](http://www.kyngchaos.com/software/frameworks).

- Export path ` export PATH=/Library/Frameworks/GDAL.framework/Programs:$PATH ` in your bash or zsh profile

- Verify the installation ` gdal-config --version `

- Install the gem using:
    
    ` $ gem install gdal -- --with-gdal-lib=/Library/Frameworks/GDAL.framework/unix/lib --with-gdal-includes=/Library/Frameworks/GDAL.framework/Versions/Current/Headers/ `


## Usage

To test it out:

    $ ruby -e "require 'gdal-ruby/ogr'; puts Gdal::Ogr.create_geometry_from_wkt('POINT (30 10)').export_to_json"

The best documentation for right now is the [autotest](http://trac.osgeo.org/gdal/browser/trunk/autotest/ruby/ogr) code in the GDAL source tree. You can see various
patterns for accessing files and using the OGR API from the autotest sources.

## License

This gem is BSD. The .c and .cpp files in the ext/gdal-ruby directory are from GDAL. For more info,
See `ext/gdal-ruby/LICENSE` or visit [gdal.org](http://www.gdal.org/).
