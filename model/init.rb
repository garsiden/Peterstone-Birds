require 'sequel'

# Timestamp all model instances using +created_at+ and +updated_at+
# (called before loading subclasses)
Sequel::Model.plugin :timestamps
Sequel::Model.plugin :schema

DB = Sequel.connect(ENV['DATABASE_URL'] || 'sqlite://data/psbirds.db3')

require 'model/bird'
require 'model/user'
require 'model/observation'
require 'model/site'
