class List < Sequel::Model

   one_to_many :sightings, :key => :sub_id

   def self.latest num = 3
       self.order(:list_date.desc).first(num)
   end
end
