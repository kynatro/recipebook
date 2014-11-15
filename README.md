Recipe Book
==========

A simple recipe book storage application with mobile and desktop interfaces.

Technology
==========

* Ruby on Rails 4.1.x
* Puma 2.9.2
* PostgreSQL
* Rspec 3.0.0
* Spring 1.1.3

Setup
===========

Running `bundle install` should get most of the project dependencies setup and running for you, but some additional technology will be required for full operation.

### Guard RSpec Notifications

For notification center support with _Guard_ on a Mac, make sure you have install `terminal-notifier` installed.

```
brew install terminal-notifier
```

### File Upload Support

To ensure file uploads work with [Paperclip](https://github.com/thoughtbot/paperclip), you must install [Imagemagick](http://www.imagemagick.org/). If you are running on a Mac, you can do so easily with [Homebrew](http://brew.sh/). Make sure and consult the README for Paperclip to make sure any other dependencies are satisfied for your system configuration.

```
brew install imagemagick
```
