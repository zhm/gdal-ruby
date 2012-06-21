require 'mkmf'

raise 'gdal-config not found.' if `which gdal-config`.empty?

dir_config 'gdal',
           `gdal-config --libs`.split(' ')[0].gsub(/-L/, ''),
           `gdal-config --cflags`.split(' ')[0].gsub(/-I/, '')

have_library 'gdal' or raise 'libgdal not found'

pkg_config 'gdal'

$libs = append_library $libs, 'gdal'

create_makefile('gdal-ruby/gdalconst')
