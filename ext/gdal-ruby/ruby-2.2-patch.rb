# This is monkeypatch for Ruby 2.2.0+
# Method pkg_config is broken on Ubuntu 12.04, so I replace it to method from Ruby 2.1.5

if RUBY_VERSION >= '2.2.0'

  module MakeMakefile
    def pkg_config(pkg, option=nil)
      if pkgconfig = with_config("#{pkg}-config") and find_executable0(pkgconfig)
        # iff package specific config command is given
      elsif ($PKGCONFIG ||=
             (pkgconfig = with_config("pkg-config", ("pkg-config" unless CROSS_COMPILING))) &&
             find_executable0(pkgconfig) && pkgconfig) and
          system("#{$PKGCONFIG} --exists #{pkg}")
        # default to pkg-config command
        pkgconfig = $PKGCONFIG
        get = proc {|opt|
          opt = IO.popen("#{$PKGCONFIG} --#{opt} #{pkg}", err:[:child, :out], &:read)
          opt.strip if $?.success?
        }
      elsif find_executable0(pkgconfig = "#{pkg}-config")
        # default to package specific config command, as a last resort.
      else
        pkgconfig = nil
      end
      if pkgconfig
        get ||= proc {|opt|
          opt = IO.popen("#{pkgconfig} --#{opt}", err:[:child, :out], &:read)
          opt.strip if $?.success?
        }
      end
      orig_ldflags = $LDFLAGS
      if get and option
        get[option]
      elsif get and try_ldflags(ldflags = get['libs'])
        if incflags = get['cflags-only-I']
          $INCFLAGS << " " << incflags
          cflags = get['cflags-only-other']
        else
          cflags = get['cflags']
        end
        libs = get['libs-only-l'] || ''
        ldflags = (Shellwords.shellwords(ldflags) - Shellwords.shellwords(libs)).quote.join(" ")
        $CFLAGS += " " << cflags
        $CXXFLAGS += " " << cflags
        $LDFLAGS = [orig_ldflags, ldflags].join(' ')
        $libs += " " << libs
        Logging::message "package configuration for %s\n", pkg
        Logging::message "cflags: %s\nldflags: %s\nlibs: %s\n\n",
                         cflags, ldflags, libs
        [cflags, ldflags, libs]
      else
        Logging::message "package configuration for %s is not found\n", pkg
        nil
      end
    end
  end

end
