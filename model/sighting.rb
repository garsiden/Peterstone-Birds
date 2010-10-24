class Sighting < Sequel::Model

    many_to_one :list, :key => :sub_id
    many_to_one :bird, :key => :bto_code
end
