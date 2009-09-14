class Species < Sequel::Model(:species)
    set_schema do
	String :name, :unique=>true, :null=>false
	String :scientific_name, :unique=>true, :null=>false
	primary_key :bto_code, :char,
	    :null=>false, :size=>2, :auto_increment=>false
    end

    create_table unless table_exists?
    unrestrict_primary_key
    one_to_many :sighting, :class=>'Sighting', :key=>'bto_code'

    if empty?

	create :bto_code => 'PE', :name => 'Peregrine',
	    :scientific_name => 'Peregrinus pergrinus'
	create :bto_code => 'HY', :name=> 'Hobby',
	    :scientific_name => 'Subutteo subutteo'
    end
end
