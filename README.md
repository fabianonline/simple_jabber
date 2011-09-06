Simple Jabber
=============

Usage
-----

You can use simple_jabber.rb whenever you want to send jabber messages
from the console. For example, you could use this script to send Nagios
notifications to your Jabber account or notify yourself in realtime about
other important things on your server.

Installation
------------

* Clone this repository.
* Install the needed gems (`gem install xmpp4r-simple`).
* Copy `config.yml.example` to `config.yml`.
* Modify `config.yml` to add login credentials to an existing
  Jabber account which will be used for sending messages.

Usage
-----

You can just pipe data via STDIN into the script.

    echo "hello" | ./simple_jabber.rb recipient@example.com

Every line will be sent as single message, so you can even pipe long-running
scripts into simple_jabber.rb to automatically get notified about new lines.

    tail -f /var/log/apache2/access.log | ./simple_jabber.rb recipient@example.com

Without piping data into simple_jabber.rb, it will just send everything you type
into it. Press Ctrl-C to exit.

    ./simple_jabber.rb recipient@example.com<ENTER>
    Hello World<ENTER>
    How are you?<ENTER>
    <Ctrl-C>

You are not even limited to a single recipient.

    echo "Hello all of you" | ./simple_jabber.rb a@example.com b@example.com c@example.com

