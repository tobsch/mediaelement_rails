# encoding: utf-8

class MediaelementUpdateGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  def update_mediaelement
    # clone git repository
    git :clone => "https://github.com/johndyer/mediaelement.git #{self.class.source_root}/mediaelement"
        
    # copy all template files
    build_path = File.join(self.class.source_root, "mediaelement", "build")
    {
      '*.png'                  => { :path => 'images' },
      '*.gif'                  => { :path => 'images' },
      'mediaelementplayer.css' => { :path => 'stylesheets', :extension => '.css.erb' },
      'mejs-skins.css'         => { :path => 'stylesheets', :extension => '.css.erb' },
      '*.swf'                  => { :path => 'flash' },
      '*.xap'                  => { :path => 'silverlight' },
      'mediaelement.js'        => { :path => 'javascripts' },
      'mediaelementplayer.js'  => { :path => 'javascripts' }
    }.each do |matcher, options|
      Dir[ File.join(build_path, matcher)  ].each do |file|
        old_extension = File.extname(file)
        basename = File.basename(file, old_extension)
        extension = options.key?(:extension) ? options[:extension] : old_extension
        new_name = File.join("app","assets", options[:path], "mediaelement_rails", "#{basename}#{extension}")
        old_name = File.join("mediaelement", "build", "#{basename}#{old_extension}")
        copy_file old_name, new_name
      end
    end
    
    # replace image paths in css
    Dir[ File.join(Rails.root, 'app', 'assets', '*', 'mediaelement_rails', '*.css.erb') ].each do |file|
      File.open(file, "r+") do |fp|
        new_content = fp.read.gsub(/([^(]+\.(png|gif))/m, "<%= asset_path('mediaelement_rails/\\1') %>")
        fp.rewind  
        fp.write(new_content)
      end
    end

		Dir[ File.join(Rails.root, 'app', 'assets', '*', 'mediaelement_rails', '*.js') ].each do |file|
			p file
			File.open(file, "r+") do |fp|
				new_content = fp.read.gsub(/﻿/, '')
				fp.rewind
				fp.write(new_content)
			end
		end

  end
end
