#!/usr/bin/ruby

require 'rubygems'
require 'xmpp4r-simple'
require 'yaml'

config = YAML.load_file("#{File.dirname((File.symlink?(__FILE__) ? File.readlink(__FILE__) : __FILE__))}/config.yml")

if ARGV.length==0
    puts "Missing recipients."
    exit 0
end
recipients = ARGV

im = Jabber::Simple.new(config["user"], config["password"])

while text = STDIN.gets do
    ARGV.each do |recipient|
        im.deliver(recipient, text.strip, :normal)
    end
end

# If we just quit, we risk losing unsent messages.
# So we just wait a second to raise the chances that the message will be sent.
sleep 1
im.disconnect

