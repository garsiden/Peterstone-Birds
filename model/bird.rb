class Species < Sequel::Model
    set_schema do
	String :name, :unique=>true, :null=>false
	String :scientific_name, :unique=>true, :null=>false
	primary_key :bto_code, :char,
	    :null=>false, :size=>2, :auto_increment=>false
    end

    create_table unless table_exists?
    unrestrict_primary_key
    one_to_many :sightings, :key=>'bto_code', :class_name=>'Sighting'

    if empty?

	create :bto_code => 'PE', :name => 'Peregrine',
	    :scientific_name => 'Peregrinus pergrinus'
	create :bto_code => 'HY', :name=> 'Hobby',
	    :scientific_name => 'Subutteo subutteo'
	create :bto_code => 'DR', :name => 'Spotted Redshank',
	    :scientific_name => 'Tringa'
    end
end
