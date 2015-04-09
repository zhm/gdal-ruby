## v1.0.0
* Regenerated bindings using GDAL 1.10.1 sources and SWIG 3.0.5
* Patch for ruby 2.2.1 (Thanks @aleksejleonov and @johnjohndoe) (Issue #5)
* Fix symbol conflicts when requiring both `gdal-ruby/gdal` and `gdal-ruby/ogr` with `get_driver_by_name` and other functions (Issue #2)
* Since the symbol conflicts are now fixed, `gdal`, `ogr`, `osr` and `gdalconst` are now `require`'d be default (Issue #2)

## v0.0.7
* Fix for building on ruby versions where `$CXXFLAGS` isn't defined
