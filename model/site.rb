class Site < Sequel::Model 
    
    self.db= DB2 
    self.set_dataset :site

end

