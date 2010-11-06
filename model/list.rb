class List < Sequel::Model

   one_to_many :sightings, :key => :sub_id

   def self.latest num = 3
       self.order(:list_date.desc).first(num)
   end

   def self.by_user
        DB[:summary_by_user]
   end

   def date_and_time
       Time.parse(list_date.to_s + start_time.strftime(' %R %Z'))
   end
end
