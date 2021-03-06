require 'sequel'

# Timestamp all model instances using +created_at+ and +updated_at+
# (called before loading subclasses)
Sequel::Model.plugin :timestamps
Sequel::Model.plugin :schema
Sequel::Model.plugin :validation_helpers

DB = Sequel.connect(ENV['DATABASE_URL'])

require 'model/bird'
require 'model/user'
require 'model/observation'
require 'model/report'
require 'model/list'
require 'model/sighting'
