#!/usr/bin/env rake
require 'rubygems'
require 'bundler'
require 'bundler/gem_tasks'
require 'rake/testtask'
require 'rake'
require 'rake/extensiontask'
require 'rspec/core'
require 'rspec/core/rake_task'

Bundler.setup

Rake::ExtensionTask.new('gdal-ruby/gdal') do |ext|
  ext.name = 'gdal'
  ext.lib_dir = "lib/gdal-ruby"
end

Rake::ExtensionTask.new('gdal-ruby/ogr') do |ext|
  ext.name = 'ogr'
  ext.lib_dir = "lib/gdal-ruby"
end

Rake::ExtensionTask.new('gdal-ruby/osr') do |ext|
  ext.name = 'osr'
  ext.lib_dir = "lib/gdal-ruby"
end

Rake::ExtensionTask.new('gdal-ruby/gdalconst') do |ext|
  ext.name = 'gdalconst'
  ext.lib_dir = "lib/gdal-ruby"
end

RSpec::Core::RakeTask.new(:spec) do |spec|
  Rake::Task['compile'].invoke
  spec.pattern = FileList['spec/**/*_spec.rb']
end

task :default => :spec
