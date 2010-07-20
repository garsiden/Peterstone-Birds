class Sighting < Sequel::Model

    set_schema do
	foreign_key :bto_code, :species,
	    :type=>String, :size=>2, :null=>false
	foreign_key :user_id, :users, :type=>String, :size=>2, :null=>false
	Date :first_date
	String :note
	primary_key [:user_id, :bto_code]
    end

    create_table unless table_exists?
    unrestrict_primary_key
    many_to_one :species, :key=>'bto_code'
    many_to_one :user

    if empty?
	create :user_id=>'NG', :bto_code=>'PE', :first_date=>'2004-01-01'
	create :user_id=>'EW', :bto_code=>'DR', :first_date=>'2004-01-01'
    end
end
