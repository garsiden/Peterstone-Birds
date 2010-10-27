#$: << File.expand_path(File.dirname(__FILE__)) + '/../'

require 'rubygems'
require 'model/init'

# sightings --> birds(bto_code)
#           --> lists(sub_id)
DB.alter_table :sightings do
    add_foreign_key [:bto_code], :birds,
                    :on_delete => :cascade,
                    :on_update => :cascade

    add_foreign_key [:sub_id], :lists,
                    :on_delete => :cascade,
                    :on_update => :cascade
end

# web_species --> birds(name)
DB.alter_table :web_species do
    add_foreign_key [:bto_name], :birds,
                    :key => :name,
                    :on_delete => :cascade,
                    :on_update => :cascade
end

# observations --> birds(bto_code)
#              --> users(user_id)
DB.alter_table :observations do
    add_foreign_key [:bto_code], :birds,
                    :on_delete => :cascade,
                    :on_update => :cascade
                   
    add_foreign_key [:user_id], :users,
                    :on_delete => :cascade,
                    :on_update => :cascade
                   
end
