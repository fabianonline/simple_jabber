#!/usr/bin/ruby
require "#{File.dirname(__FILE__)}/SimpleJabber"

if ARGV.length==0
    puts "Missing recipients."
    exit 0
end
recipients = ARGV

jabber = SimpleJabber.new

while text = STDIN.gets do
    ARGV.each do |recipient|
        jabber.deliver(recipient, text)
    end
end

# If we just quit, we risk losing unsent messages.
# So we just wait a second to raise the chances that the message will be sent.
sleep 1

