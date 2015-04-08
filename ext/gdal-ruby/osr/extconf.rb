require 'mkmf'

# see https://github.com/zhm/gdal-ruby/issues/5
require_relative '../ruby-2.2-patch'

raise 'gdal-config not found.' if `which gdal-config`.empty?

dir_config 'gdal',
           `gdal-config --cflags`.split(' ')[0].gsub(/-I/, ''),
           `gdal-config --libs`.split(' ')[0].gsub(/-L/, '')

have_library 'gdal' or raise 'libgdal not found'

pkg_config 'gdal'

$libs = append_library $libs, 'gdal'

# earlier versions of ruby do not define $CXXFLAGS
$CXXFLAGS = CONFIG["CXXFLAGS"] unless defined?($CXXFLAGS)

$CFLAGS << ' -Wno-format-security'
$CXXFLAGS << ' -Wno-format-security'

create_makefile('gdal-ruby/osr')
