require 'rubygems'
require 'xmpp4r-simple'
require 'yaml'

class SimpleJabber
    def initialize
        @config = YAML.load_file("#{File.dirname((File.symlink?(__FILE__) ? File.readlink(__FILE__) : __FILE__))}/config.yml")
        @im = Jabber::Simple.new(@config["user"], @config["password"])
    end
    
    def deliver(recipient, message)
        @im.deliver(recipient, message.strip, :normal)
    end
end
