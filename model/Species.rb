class Species < Sequel::Model(:species)
    set_schema do
#	varchar :bto_code
	primary_key_name = :bto_code
	varchar :bto_code, :auto_increment=>false
	varchar :species_name, :unique=>true, :empty=>false
	varchar :scientific_name
    end

#    set_primary_key [:bto_code]

    create_table unless table_exists?

    if empty?
	create :bto_code => 'PE', :species_name => 'Peregrine',
	    :scientific_name => 'Peregrinus pergrinus'
	create :bto_code => 'HY', :species_name => 'Hobby',
	    :scientific_name => 'Subutteo subutteo'
    end
end

