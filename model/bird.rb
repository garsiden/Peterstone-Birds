class Bird < Sequel::Model
    set_schema do
	String :name, :unique=>true, :null=>false
	String :taxonomic_name, :unique=>true, :null=>false
    Boolean :is_migrant, :default=>'f'
	primary_key :bto_code, :char,
	    :null=>false, :size=>2, :auto_increment=>false
    end

    create_table unless table_exists?
    unrestrict_primary_key
    one_to_many :observations, :key=>'bto_code', :class_name=>'Observation'

    if empty?

	create :bto_code => 'PE', :name => 'Peregrine',
	    :taxonomic_name => 'Peregrinus pergrinus'
	create :bto_code => 'HY', :name=> 'Hobby',
	    :taxonomic_name => 'Subutteo subutteo'
	create :bto_code => 'DR', :name => 'Spotted Redshank',
	    :taxonomic_name => 'Tringa'
    end
end
