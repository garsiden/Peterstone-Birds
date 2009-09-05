# Define a subclass of Ramaze::Controller holding your defaults for all
# controllers
require 'controller/helpers'

class Controller < Ramaze::Controller
  include AppHelpers
  layout :default
  engine :Haml
  helper :xhtml
#  engine :Etanni
end

# Here go your requires for subclasses of Controller:
require __DIR__('main')
require __DIR__('shared')
