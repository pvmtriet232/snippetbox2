This is a golang web server project. 
In this repo, I'll put all my practical golang code ,test and build a webserver locally.
The technology I'll use: Golang,Docker,Github

Chapter 3: Configuration and Error Handling
You will learn to :

Set configuration settings for your application at runtime in an easy and idiomatic way
using command-line flags.

Improve your application log messages to include more information, and manage them
differently depending on the type (or level) of log message.

Make dependencies available to your handlers in a way that’s extensible, type-safe, and
doesn’t get in the way when it comes to writing tests.

Centralize error handling so that you don’t need to repeat yourself when writing code.

--------------------------------

In Go, a common and idiomatic way to manage configuration settings is to use command line flags when start application:
   $ go run ./cmd/web -addr=":80"

The easiest way to accept and parse a command line flag from your application is with a line of code like this:
   addr := flag.String("addr", ":4000", "HTTP network address")


