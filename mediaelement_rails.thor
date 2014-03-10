# encoding: utf-8

module MediaelementRails
  class Updater < Thor
    include Thor::Actions
    namespace "mediaelement_rails"
    
    UPDATE_FILES = {
      "mediaelement.js"        => "javascripts",
      "mediaelementplayer.js"  => "javascripts",
      "mediaelementplayer.css" => "stylesheets",
      "mejs-skins.css"         => "stylesheets",
      "*.{svg,png,gif}"        => "images",
      "*.{swf,xap}"            => "plugins"
    }
    
    TRANSFORMATIONS = {
      "**/*.css.erb" => :add_asset_path_helper,
      "**/*.js"      => :remove_weird_characters
    }
    
    def self.source_root
      File.expand_path("..", __FILE__)
    end
    
    desc "update", "Update the MediaElement.js files"
    method_option "vendor_path",
      :desc    => "Path to the the MediaElement.js git repo",
      :default => "vendor/mediaelement",
      :aliases => %w(-v)
    method_option "assets_path",
      :desc    => "Path to the the mediaelement_rails assets",
      :default => "app/assets",
      :aliases => %w(-a)
    method_option "git",
      :desc    => "URL of the MediaElement.js git repo to clone",
      :default => "http://github.com/johndyer/mediaelement.git",
      :aliases => %w(-g)
    method_option "tag",
      :desc    => "The tag to checkout in the MediaElement.js git repo",
      :default => "master",
      :aliases => %w(-t)
    def update
      assets_path = options[:assets_path]
      vendor_path = options[:vendor_path]
      
      # Update the vendored MediaElement.js
      run "git clone #{options[:git]} #{vendor_path}",    :capture => true unless File.directory? vendor_path
      run "cd #{vendor_path} && git pull origin master",  :capture => true
      run "cd #{vendor_path} && git checkout #{options[:tag]}", :capture => true

      # Then copy the files we need to their correct locations
      UPDATE_FILES.each do |matcher, path|
        Dir[File.join(vendor_path, "build", matcher)].each do |file|
          new_name = File.join assets_path, path, "mediaelement_rails", File.basename(file)
          new_name << ".erb" if file =~ /\.css$/
          copy_file file, new_name
        end
      end
      
      # Peform any transformations necessary to the files
      TRANSFORMATIONS.each do |matcher, transformation|
        Dir[File.join(assets_path, matcher)].each do |file|
          content = File.binread file
          content = send(transformation, content)
          File.open(file, "wb") { |file| file.write(content) }
        end
      end
    end
    
    protected
    
    # Replaces `url(...)` with url(<%= asset_path "..." %>) in CSS files.
    def add_asset_path_helper(content)
      content.gsub /url\((.*?)\)/, 'url(<%= asset_path "mediaelement_rails/\1" %>)'
    end
    
    # Removes the weird unicode character from the MediaElement source files.
    def remove_weird_characters(content)
      content.force_encoding('utf-8').gsub /﻿/, ''
    end
  end
end
