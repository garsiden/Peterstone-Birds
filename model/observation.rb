class Observation < Sequel::Model

    set_schema do
        foreign_key :bto_code, :birds,
            :type=>String, :size=>2, :null=>false
        foreign_key :user_id, :users, :type=>String, :size=>2, :null=>false
        Date :first_date
        String :note
        primary_key [:user_id, :bto_code]
    end

    create_table unless table_exists?
    unrestrict_primary_key
    many_to_one :bird, :key=>'bto_code'
    many_to_one :user


    # Validations
    self.raise_on_typecast_failure = false
    def validate
        validates_unique([:user_id, :bto_code])
        validates_length_range 1..2, :bto_code
        validates_exact_length 2, :user_id
        validates_not_string :first_date
    end

    # class method
    def self.total
        self.distinct.select(:bto_code).count
    end

    def self.latest
        self.eager(:bird, :user).order(:first_date.desc).first
    end
        
    def self.first_observations

        obs = self.eager(:bird).order(:bto_code, :first_date)

        first_obs = Array.new
        bto = nil
        obs.each do |o|
            if o.bto_code != bto
                first_obs << o
                bto = o.bto_code
            end
        end
        first_obs.sort! {|a,b| b.first_date <=> a.first_date }
    end

    if empty?
        create :user_id=>'NG', :bto_code=>'PE', :first_date=>'2004-01-01'
        create :user_id=>'EW', :bto_code=>'DR', :first_date=>'2004-01-01'
    end
end

