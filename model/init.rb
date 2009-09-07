require 'sequel'

Sequel::Model.plugin(:schema)

DB = Sequel.sqlite('data/psbirds.db3')
#DB = Sequel.sqlite(':memory:')

require 'model/species'
