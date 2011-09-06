#!/usr/bin/ruby

require 'rubygems'
require 'xmpp4r-simple'
require 'yaml'
require 'getoptlong'

config = YAML.load_file("#{File.dirname((File.symlink?(__FILE__) ? File.readlink(__FILE__) : __FILE__))}/config.yml")

opt = GetoptLong.new(
    ["--interactive", "-i", GetoptLong::NO_ARGUMENT],
    ["--help", "-h", GetoptLong::NO_ARGUMENT]
)

settings = {}
settings[:interactive] = false

opt.each do |opt, arg|
    case opt
        when '--help'
            puts "Hilfe gibt's noch nicht!"
            exit 0
        when '--interactive'
            settings[:interactive] = true
    end
end

if ARGV.length==0
    puts "Missing recipients."
    exit 0
end
recipients = ARGV

im = Jabber::Simple.new(config["user"], config["password"])

text = STDIN.gets
begin
    ARGV.each do |recipient|
        im.deliver(recipient, text, :normal)
    end
end while settings[:interactive] and text = STDIN.gets.strip

sleep 1
im.disconnect

