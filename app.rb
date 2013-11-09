#!/usr/bin/env ruby

require "bundler"
Bundler.require

configure do
  set :bind, "0.0.0.0"
  set :app_file, __FILE__
  set :haml, format: :html5
end

COMMANDS = {
  activate: %[osascript -e 'tell application "Keynote" to activate'],
  start:    %[osascript -e 'tell application "Keynote" to start slideshow'],
  stop:     %[osascript -e 'tell application "System Events" to key code 53'],
  next:     %[osascript -e 'tell application "Keynote" to show next'],
  previous: %[osascript -e 'tell application "Keynote" to show previous'],
}

get "/" do
  haml :index
end

post "/start" do
  system(COMMANDS[:activate])
  system(COMMANDS[:start])
end

post "/stop" do
  system(COMMANDS[:activate])
  system(COMMANDS[:stop])
end

post "/next" do
  system(COMMANDS[:next])
end

post "/previous" do
  system(COMMANDS[:previous])
end
