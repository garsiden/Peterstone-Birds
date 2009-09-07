require 'sequel'

Sequel::Model.plugin(:schema)

DB = Sequel.sqlite(':memory:')

require 'model/species'
