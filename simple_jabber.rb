#!/usr/bin/ruby

require 'rubygems'
require 'xmpp4r-simple'
require 'yaml'

config = YAML.load_file("#{File.dirname((File.symlink?(__FILE__) ? File.readlink(__FILE__) : __FILE__))}/config.yml")

im = Jabber::Simple.new(config["user"], config["password"])
puts im.connected?
recv = "fabian354@googlemail.com"
text = "Dies ist ein Test " + Time.now.to_s
queue = im.deliver(recv, text)

while queue.length>0 do
    sleep(0.5)
end
