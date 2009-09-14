class Sighting < Sequel::Model

    set_schema do
	foreign_key :bto_code, :species,
	    :type=>String, :size=>8, :null=>false
	foreign_key :user_id, :user, :null=>false
	Date :first_date
	String :note
	primary_key [:user_id, :bto_code]
    end

    create_table unless table_exists?
    unrestrict_primary_key
    many_to_one :species, :class=>'Species', :key=>'bto_code'
    many_to_one :user, :class=>'User'

    if empty?
	create :user_id => 1,
	    :bto_code => 'PE',
	    :first_date => '2004-01-01'
    end
end
