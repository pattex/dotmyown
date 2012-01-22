#!/usr/bin/env ruby

require 'rubygems'
require 'highline/import'

rubygems = %w[hub wirble]

dotfiles_path = File.join(File.expand_path(File.dirname(__FILE__)), 'dotfiles')
config_fiel   = File.join(ENV['HOME'], '.dotmyown.config')
config_vars   = %w[GIT_AUTHOR_NAME EMAIL GITHUB_USER GITHUB_TOKEN]
colors = {
  :black     => 30,
  :dark_red  => 31,
  :green     => 32,
  :orange    => 33,
  :blue      => 34,
  :magenta   => 35,
  :turquoise => 36,
  :gray      => 37,
  :light_red => 38,
  :white     => 39
}

begin
  rubygems.each { |rubygem| gem(rubygem) }
rescue Gem::LoadError
  say "\nSome of the required gems (#{rubygems.join(', ')}) are not installed."
  if agree('Shall we install them right now? ')
    puts `bundle install`
  else
    return
  end
end

# create ~/bin if it doesn't already exists
unless File.exists?("#{ENV['HOME']}/bin")
  if File.makedirs("#{ENV['HOME']}/bin")
    say "\nCreated directory '#{ENV['HOME']}/bin'"
  end
end

unless File.exists?("#{ENV['HOME']}/bin/hub")
  `hub hub standalone > #{ENV['HOME']}/bin/hub && chmod 755 #{ENV['HOME']}/bin/hub`
  if File.exists?("#{ENV['HOME']}/bin/hub")
    say "\nInstalled a standalone version of hub which doesn't require "
    say "RubyGems to run."
  else
    puts "\nInstallation of hub failed."
    puts 'Please try it manually after this script is done.'
    puts 'To do that, run:'
    puts "\n\thub hub standalone > ~/bin/hub && chmod 755 ~/bin/hub\n"
  end
end

# create .dotmyown.config
config = Hash.new

say "\nLet's do some configurations!"
question = "You already have a config file! Do you want to overwrite it?"
if !File.exists?(config_fiel) || agree(question) { |q| q.default = 'no' }
  config_vars.each { |var|
    question = var.gsub('_', ' ')
    question = question[0,1] + question[1..-1].downcase
    config[var] = ask(question) { |q| q.default = ENV[var] if ENV[var] }
  }
  
  color = choose { |menu|
    menu.prompt = "Choose the color of your prompt:"
    menu.choices(*colors.keys)
  }
  config['PROMPT_COLOR'] = colors[color]
  
  File.open(config_fiel, 'w') { |f|
    config.each { |k, v|
      f.puts "export #{k}='#{v}'"
    }
  }
  
  if File.exists?(config_fiel)
    say "\nConfig file '#{config_fiel}' have been written. You can edit it "
    say "manually, if you want to."
  else
    say "\nSomething went wrong! The config file '#{config_fiel}' couldn't created."
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