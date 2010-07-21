require 'sequel'

Sequel::Model.plugin :schema
Sequel::Model.plugin :timestamps

#Sequel::Model.plugin :hook_class_methods
#Sequel::Model.plugin(:validation_helpers)
#Sequel::Model.plugin(:validation_class_methods)

DB = Sequel.sqlite('data/psbirds.db3')
#DB2 = Sequel.sqlite('/usr/local/data/birdtrack2.db')
#DB = Sequel.sqlite(':memory:')

require 'model/bird'
require 'model/user'
require 'model/observation'
require 'model/site'
