# Define a subclass of Ramaze::Controller holding your defaults for all
# controllers

class Controller < Ramaze::Controller
  layout :default
  engine :Haml
  helper :xhtml
#  engine :Etanni
end

# Here go your requires for subclasses of Controller:
require __DIR__('main')
