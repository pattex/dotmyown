#!/usr/bin/env ruby

require 'rubygems'
require 'highline/import'
require 'ftools'

rubygems = %w[hub wirble]

dotfiles_path = File.join(File.expand_path(File.dirname(__FILE__)), 'dotfiles')
config_file   = File.join(ENV['HOME'], '.dotmyown.config')
config_vars   = %w[GIT_AUTHOR_NAME EMAIL GITHUB_USER GITHUB_TOKEN]

begin
  rubygems.each { |rubygem| gem(rubygem) }
rescue Gem::LoadError
  say "\nSome of the required gems (#{rubygems.join(', ')}) are not installed."
  if agree('Shall we install them right now? ')
    puts `bundle install`
  end
end

# create .dotmyown.config
config = Hash.new

say "\nLet's do some configurations!"
question = "You already have a config file! Do you want to overwrite it?"
if !File.exists?(config_file) || agree(question + ' ') { |q| q.default = 'no' }
  config_vars.each { |var|
    question = var.gsub('_', ' ')
    question = question[0,1] + question[1..-1].downcase
    config[var] = ask(question + ' ') { |q| q.default = ENV[var] if ENV[var] }
  }

  File.open(config_file, 'w') { |f|
    config.each { |k, v|
      f.puts "export #{k}='#{v}'"
    }
  }

  if File.exists?(config_file)
    say "\nConfig file '#{config_file}' have been written. You can edit it "
    say "manually, if you want to."
  else
    say "\nSomething went wrong! The config file '#{config_file}' couldn't created."
  end
end

# link dotfiles to home
dotfiles = Dir.glob("#{dotfiles_path}/*").map{ |path| File.basename(path) }
dotfiles.each { |dotfile|
  dotdotfile = "#{ENV['HOME']}/.#{dotfile}"
  if !File.exists?(dotdotfile) ||
    agree("File '.#{dotfile}' already exists. Overwrite? ") { |q| q.default = 'no' }
    if system("ln -s #{dotfiles_path}/#{dotfile} #{dotdotfile}")
      say "\nCreated link '#{dotdotfile} -> #{dotfiles_path}/#{dotfile}'"
    end
  end
}

say("\nOK, everything is done.")
say("Maybe you want to update your environment now.")
say("\tsource #{ENV['HOME']}/.profile")
