require 'sequel'

Sequel::Model.plugin :schema
Sequel::Model.plugin :timestamps
#Sequel::Model.plugin(:validation_helpers)
#Sequel::Model.plugin(:validation_class_methods)

DB = Sequel.sqlite('data/psbirds.db3')
#DB = Sequel.sqlite(':memory:')

require 'model/species'
require 'model/user'
require 'model/sighting'
